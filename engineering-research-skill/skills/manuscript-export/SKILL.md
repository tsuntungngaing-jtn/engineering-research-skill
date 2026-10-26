---
name: manuscript-export
description: >-
  Export engineering case-study / report Markdown to LaTeX-typeset PDF and Word
  (.docx). Use when the user asks for Word manuscript, LaTeX排版, docx交付, or
  publication-like archive beyond Markdown. Requires Pandoc + XeLaTeX (MiKTeX/TeX Live).
---

# Manuscript Export Skill

## Role

Turn narrative Markdown (e.g. `CASE_STUDY.md`, result reports) into:

1. **LaTeX source** (typesetting source of truth for this export)
2. **PDF** (XeLaTeX / `ctexart` for Chinese)
3. **Word `.docx`** (from the LaTeX stage via Pandoc)

Markdown remains the editable research artifact; Word/PDF are **derived** deliverables.

## When to use

- User asks for Word / `.docx` / “经 LaTeX 排版”
- Delivery close-out when a journal-like manuscript is required
- Advisor handoff that must open in Microsoft Word

## Prerequisites

| Tool | Purpose |
|------|---------|
| Pandoc ≥ 2.19 | MD↔LaTeX↔DOCX |
| XeLaTeX (MiKTeX / TeX Live) | Chinese + math typesetting |
| `ctex` / `ctexart` | Chinese document class |

Optional: `python-docx` + `journal-manuscript-layout-auditor` for post-DOCX layout audit.

## Pipeline (mandatory order)

```text
INPUT.md
  → Pandoc → build/*.tex   (+ extract-media)
  → XeLaTeX (×1–2) → build/*.pdf
  → Pandoc *.tex → *.docx  (resource-path includes media/)
  → optional layout audit (docx-document skill)
```

Script (repo root):

```powershell
powershell -ExecutionPolicy Bypass -File scripts/export_manuscript.ps1 `
  -InputMarkdown "path\to\CASE_STUDY.md" `
  -OutDir "path\to\manuscript_export" `
  -Title "Optional title"
```

## Outputs

```text
manuscript_export/
  <stem>.tex
  <stem>.pdf          # LaTeX typeset proof
  <stem>.docx         # Word for editing/submission prep
  media/              # extracted figures
  EXPORT_LOG.md       # commands, exit codes, font notes
```

## Rules

1. **Do not rewrite science** — export only; no QoI / status edits.
2. Relative figure paths must resolve (`figures/`, `--resource-path`).
3. Prefer **OMML/MathML** for equations in DOCX (`pandoc -t docx`); avoid equation screenshots.
4. Chinese body: XeLaTeX + `ctexart`; document fonts in `EXPORT_LOG.md`.
5. If XeLaTeX fails, record FAIL and still attempt DOCX from Markdown **only if** user accepts degraded path; default is **block Word claim** until PDF OK when user required LaTeX typesetting.
6. Bibliography: use accompanying `.bib` when present (`--citeproc` if pandoc supports and user wants).

## Delivery checklist hook

When narrative manuscript Word is requested, tick in `checklists/final-delivery-checklist.md`:

- [ ] `manuscript-export` ran; `.tex` + `.pdf` + `.docx` present
- [ ] `EXPORT_LOG.md` records Pandoc/XeLaTeX versions and exit codes

## Related

- `skills/delivery/SKILL.md`
- `skills/academic-prose-gate/SKILL.md` (run before export when shipping narrative)
- Cursor `docx-document` skill for post-export layout audit
