<#
.SYNOPSIS
  Create canonical ERS project storage folders and seed templates.

.PARAMETER ProjectRoot
  Target project directory (created if missing).

.PARAMETER ProjectId
  Written into SESSION_CONFIG project_id (default: folder name).

.EXAMPLE
  .\scripts\init-project-storage.ps1 -ProjectRoot D:\work\Lee2026_MMC
#>
[CmdletBinding()]
param(
  [Parameter(Mandatory = $true)]
  [string]$ProjectRoot,
  [string]$ProjectId = "",
  [ValidateSet("CHN", "ENG")]
  [string]$LangUi = "ENG",
  [ValidateSet("AGENT_SEARCH", "USER_LIT", "HYBRID")]
  [string]$Intake = "USER_LIT",
  [ValidateSet("OPTIONS", "HIGH_IMPACT_ASK", "USER_SPECIFY")]
  [string]$PathPolicy = "OPTIONS"
)

$ErrorActionPreference = "Stop"
$skillRoot = Split-Path -Parent $PSScriptRoot
if (-not $ProjectId) { $ProjectId = Split-Path -Leaf $ProjectRoot }

$dirs = @(
  "session",
  "references/pdfs",
  "evidence",
  "decisions",
  "compare/vision",
  "replicate",
  "optimize/baseline",
  "prose_scrub",
  "figures",
  "cad_solidworks_step",
  "comsol_models",
  "builders_logs",
  "VERIFIED_USE_THESE"
)

New-Item -ItemType Directory -Force -Path $ProjectRoot | Out-Null
foreach ($d in $dirs) {
  New-Item -ItemType Directory -Force -Path (Join-Path $ProjectRoot $d) | Out-Null
}

function Copy-Template([string]$name, [string]$destRel) {
  $src = Join-Path $skillRoot "templates\$name"
  $dest = Join-Path $ProjectRoot $destRel
  if (-not (Test-Path $dest)) {
    if (Test-Path $src) {
      Copy-Item $src $dest
    }
  }
}

Copy-Template "SESSION_CONFIG.md" "session\SESSION_CONFIG.md"
Copy-Template "SESSION_LOG.md" "session\SESSION_LOG.md"
Copy-Template "COMPARE_LOG.md" "compare\COMPARE_LOG.md"
Copy-Template "EVIDENCE_LEDGER.md" "evidence\EVIDENCE_LEDGER.md"
Copy-Template "OPTION_CARD.md" "decisions\OPTION_CARD.md"
Copy-Template "DECISION_LOG.md" "decisions\DECISION_LOG.md"
Copy-Template "REPLICATE_SCORECARD.md" "replicate\REPLICATE_SCORECARD.md"
Copy-Template "OPTIMIZE_RUN_LOG.md" "optimize\OPTIMIZE_RUN_LOG.md"
Copy-Template "LITERATURE_MANIFEST.md" "references\LITERATURE_MANIFEST.md"
Copy-Template "PROJECT_LAYOUT.md" "PROJECT_LAYOUT.md"

$cfgPath = Join-Path $ProjectRoot "session\SESSION_CONFIG.md"
if (Test-Path $cfgPath) {
  $stamp = (Get-Date).ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ssZ")
  $raw = Get-Content $cfgPath -Raw
  $raw = $raw -replace "project_id: REPLACE_ME", "project_id: $ProjectId"
  $raw = $raw -replace "lang_ui: ENG", "lang_ui: $LangUi"
  $raw = $raw -replace "intake: USER_LIT", "intake: $Intake"
  $raw = $raw -replace "path_policy: OPTIONS", "path_policy: $PathPolicy"
  $raw = $raw -replace "updated_at: 2026-10-24T00:00:00Z", "updated_at: $stamp"
  $raw = $raw -replace "updated_by: session-boot", "updated_by: init-project-storage.ps1"
  Set-Content -Path $cfgPath -Value $raw -Encoding utf8
}

$logPath = Join-Path $ProjectRoot "session\SESSION_LOG.md"
if (Test-Path $logPath) {
  $stamp = (Get-Date).ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ssZ")
  Add-Content -Path $logPath -Value "| $stamp | BOOT_CREATE | — → initial | init-project-storage.ps1 |"
}

Write-Host "Initialized ERS storage at: $ProjectRoot"
Write-Host "project_id=$ProjectId lang_ui=$LangUi intake=$Intake path_policy=$PathPolicy"
