<#
.SYNOPSIS
  Markdown → LaTeX (XeLaTeX/ctexart) → PDF + Word (.docx)

.PARAMETER InputMarkdown
  Path to CASE_STUDY.md or similar narrative.

.PARAMETER OutDir
  Output directory (created if missing).

.PARAMETER Title
  Optional PDF/DOCX title metadata.
#>
param(
  [Parameter(Mandatory = $true)][string]$InputMarkdown,
  [Parameter(Mandatory = $true)][string]$OutDir,
  [string]$Title = "",
  [string]$MainFont = "SimSun",
  [switch]$AllowDocxWithoutPdf
)

$ErrorActionPreference = "Stop"
function Log([string]$m) { Write-Host $m; Add-Content -Path $script:LogFile -Value $m -Encoding UTF8 }

$InputMarkdown = (Resolve-Path $InputMarkdown).Path
$mdDir = Split-Path $InputMarkdown -Parent
$stem = [IO.Path]::GetFileNameWithoutExtension($InputMarkdown)
New-Item -ItemType Directory -Force -Path $OutDir | Out-Null
$OutDir = (Resolve-Path $OutDir).Path
$script:LogFile = Join-Path $OutDir "EXPORT_LOG.md"
$build = Join-Path $OutDir "build"
New-Item -ItemType Directory -Force -Path $build | Out-Null

$pandocCmd = Get-Command pandoc -ErrorAction SilentlyContinue
$xelatexCmd = Get-Command xelatex -ErrorAction SilentlyContinue
if (-not $pandocCmd) { throw "pandoc not found on PATH" }
if (-not $xelatexCmd) { throw "xelatex not found on PATH (install MiKTeX/TeX Live)" }
$pandoc = $pandocCmd.Source
$xelatex = $xelatexCmd.Source

@"
# Manuscript export log

- Input: ``$InputMarkdown``
- OutDir: ``$OutDir``
- Started: $(Get-Date -Format o)
- Pandoc: $(& $pandoc --version | Select-Object -First 1)
- XeLaTeX: $xelatex
- MainFont: $MainFont

"@ | Set-Content -Path $script:LogFile -Encoding UTF8

$texPath = Join-Path $build "$stem.tex"
$pdfPath = Join-Path $build "$stem.pdf"
$docxPath = Join-Path $OutDir "$stem.docx"
$mediaDir = Join-Path $build "media"

$resourcePath = @($mdDir, (Join-Path $mdDir "figures"), (Join-Path $mdDir "literature_pack")) -join [IO.Path]::PathSeparator

$pandocToTex = @(
  $InputMarkdown,
  "-f", "markdown",
  "-t", "latex",
  "-s",
  "-o", $texPath,
  "--resource-path=$resourcePath",
  "--extract-media=$mediaDir",
  "-V", "documentclass=ctexart",
  "-V", "geometry:margin=2.5cm",
  "-V", "CJKmainfont=$MainFont",
  "--shift-heading-level-by=0"
)
if ($Title) { $pandocToTex += @("-M", "title=$Title") }

Log "### Step 1: Pandoc → LaTeX"
Log ("Command: pandoc " + ($pandocToTex -join ' '))
& $pandoc @pandocToTex
if ($LASTEXITCODE -ne 0) { throw "Pandoc MD→TeX failed: $LASTEXITCODE" }
Log "OK tex=$texPath"

# Ensure ctex + xeCJK friendly engine note in tex if pandoc omitted
$texText = Get-Content $texPath -Raw -Encoding UTF8
if ($texText -notmatch "ctex") {
  Log "WARN: documentclass may not be ctexart; check preamble"
}

Log "### Step 2: XeLaTeX → PDF"
Push-Location $build
try {
  & $xelatex -interaction=nonstopmode -halt-on-error "$stem.tex" 2>&1 | Tee-Object -FilePath (Join-Path $build "xelatex_pass1.log") | Out-Null
  $xe1 = $LASTEXITCODE
  Log "XeLaTeX pass1 exit=$xe1"
  if ($xe1 -eq 0) {
    & $xelatex -interaction=nonstopmode -halt-on-error "$stem.tex" 2>&1 | Tee-Object -FilePath (Join-Path $build "xelatex_pass2.log") | Out-Null
    Log "XeLaTeX pass2 exit=$LASTEXITCODE"
  }
} finally {
  Pop-Location
}

$pdfOk = Test-Path $pdfPath
Log "PDF present=$pdfOk path=$pdfPath"
if (-not $pdfOk -and -not $AllowDocxWithoutPdf) {
  throw "XeLaTeX did not produce PDF. See build/xelatex_pass1.log. Word export blocked (LaTeX required)."
}

Log "### Step 3: Pandoc LaTeX/MD → DOCX"
# Prefer tex→docx when PDF succeeded; else optional degraded md→docx
$docxSrc = if ($pdfOk -and (Test-Path $texPath)) { $texPath } else { $InputMarkdown }
$docxArgs = @(
  $docxSrc,
  "-t", "docx",
  "-o", $docxPath,
  "--resource-path=$resourcePath;$mediaDir;$build",
  "--extract-media=$(Join-Path $OutDir 'docx_media')"
)
Log ("Command: pandoc " + ($docxArgs -join ' '))
& $pandoc @docxArgs
if ($LASTEXITCODE -ne 0) { throw "Pandoc → DOCX failed: $LASTEXITCODE" }

# Copy PDF next to docx for handoff
if ($pdfOk) {
  Copy-Item -Force $pdfPath (Join-Path $OutDir "$stem.pdf")
}

Log ""
Log "## Result"
Log "- DOCX: ``$docxPath``"
Log "- PDF:  ``$(Join-Path $OutDir "$stem.pdf")``"
Log "- TEX:  ``$texPath``"
Log "- Finished: $(Get-Date -Format o)"
Log ""
Log "Scientific content was not rewritten by this export."

Write-Host "EXPORT_OK docx=$docxPath"
