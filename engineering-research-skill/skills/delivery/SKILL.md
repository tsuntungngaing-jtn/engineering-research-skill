---
name: delivery
description: >-
  Package final engineering simulation deliverables: VERIFIED mph files, logs,
  builder scripts, STEP geometry, validation report, session/compare storage, and
  README for archive folders. Use when closing a study or handing off to
  advisor/collaborator. Requires explicit validation status—never mark VERIFIED
  without logs.
---

# Delivery Skill

## Role

Produce a **reproducible, auditable** delivery package suitable for lab archive, thesis appendix, or supplementary material.

## Folder Structure (standard)

Canonical map: `templates/PROJECT_LAYOUT.md`. Init: `scripts/init-project-storage.ps1` / `.sh`.  
Workflow: `workflows/project-storage.md`.

```text
<PROJECT_ID>/
├── session/              # SESSION_CONFIG + SESSION_LOG (boot policy)
├── references/           # PDFs + LITERATURE_MANIFEST
│   └── pdfs/
├── evidence/             # EVIDENCE_LEDGER + excerpts
├── decisions/            # OPTION_CARD + DECISION_LOG
├── compare/              # COMPARE_LOG + optional vision/
├── replicate/            # REPLICATE_SCORECARD + baseline notes
├── optimize/             # OPTIMIZE_RUN_LOG + baseline/ copies
├── prose_scrub/          # SCRUB_LOG + backups from academic-prose-gate
├── figures/
├── cad_solidworks_step/
├── comsol_models/        # working .mph, .status, stdout
├── builders_logs/
├── VERIFIED_USE_THESE/   # human-approved finals only
│   ├── REPLICATE_*.mph
│   └── OPTIMIZED_*.mph
├── PROJECT_LAYOUT.md     # optional local copy of the map
├── PAPER_SPEC.md
├── model_equation_audit.md
├── model_run_log.md
├── model_output_reliability.md
├── VALIDATION_REPORT.md
└── README.md             # English archive (lang_ui CHN does not change this)
```

## Storage rules

1. Skill repository ≠ project store. Keep mph/STEP/PDF out of the skill git tree.
2. `session/` and `compare/` are first-class deliverables when boot/compare were used.
3. Never overwrite an open/locked mph; stage a new name under `comsol_models/` then promote copies to `VERIFIED_USE_THESE/`.
4. Literature downloads record rows in `references/LITERATURE_MANIFEST.md` (`OA_ONLY_MANIFEST` / `USER_SUPPLIED_PATH` / `LINK_ONLY`).

## File Naming Convention

```text
<Paper>_<variant>_<stage>.mph

Stages:
  GEOMETRY_READY | COMSOL_READY
  FLOW_SOLVED | HEAT_SOLVED | CHT_SOLVED
  BATCH_VERIFIED

Prefixes in VERIFIED_USE_THESE:
  REPLICATE_   | OPTIMIZED_

Suffixes:
  CONTROL | BLOCKED | PATCH_<date>
```

## README Minimum Content

1. **Purpose** — which paper figure / claim
2. **Use these files** — explicit list with priority (`VERIFIED_USE_THESE` first)
3. **Superseded files** — old mph that trigger solver bugs
4. **Parameters** — table from `PAPER_SPEC.md`
5. **Validation status** — per study from validation skill
6. **How to reproduce** — Java compile line or batch command
7. **Known limitations** — mesh, split flow/heat, topology delta
8. **Session keys** — `lang_ui`, `intake`, `path_policy` (from `SESSION_CONFIG`)

## Required Deliverable Table

| Artifact | Required | Evidence |
|----------|----------|----------|
| SESSION_CONFIG (+ LOG) | Yes if boot used (default yes) | `session/` |
| EVIDENCE_LEDGER + DECISION_LOG | Yes (or written Phase-0 waiver) | `evidence/` `decisions/` |
| COMPARE_LOG | Yes if QoI/figure claims shipped | `compare/` |
| Builder source | Yes | `.java` / `.m` in `builders_logs/` |
| READY mph | Yes | Opens, geom builds |
| SOLVED mph | If claimed | Batch log `Done`, LASTEXITCODE=0 |
| STEP geometry | If CAD path | mm units |
| Solve stdout | If SOLVED | Attached |
| model_equation_audit.md | Yes when audit in scope | Sections 1–13; A/B/C/D grades |
| VALIDATION_REPORT | Yes | Metrics + status |
| REPLICATE_SCORECARD | Yes if replicate claimed | `replicate/` |
| OPTIMIZE_RUN_LOG | If OPTIMIZED_ shipped | `optimize/` + checklist |
| Figure exports | If publication | 300 dpi + caption; no **D** sources without waiver |
| prose scrub log | If narrative README/report shipped | `prose_scrub/SCRUB_LOG.md` via academic-prose-gate |
| LITERATURE_MANIFEST | If PDFs were fetched/supplied | `references/` |
| Manuscript Word/PDF | If user requested Word / LaTeX排版 | `skills/manuscript-export` → `.tex` + `.pdf` + `.docx` + `EXPORT_LOG.md` |

## Result Report Sections

Use `templates/result-report-template.md`:

1. Executive summary (3 sentences max)
2. Reference & objective
3. Model summary (geometry, physics, mesh)
4. Results (ΔP, T, u, Re)
5. Validation status & limitations
6. Reproduction steps
7. Human sign-off

## Simulation Log

Every solve session → `templates/simulation-log-template.md` entry in `builders_logs/`.

## Prohibited Delivery Practices

- Shipping only `.mph` without builder or parameter doc
- Labeling `SOLVED` when user only opened GUI once
- Deleting failed attempts without documenting why fix worked
- `VERIFIED_USE_THESE` containing files with known open lock issues without README warning
- Placing `OPTIMIZED_` mph without replicate-before-optimize checklist
- Shipping assignment/chat/process-contaminated README without academic-prose-gate
- Declaring EXACT VALIDATED from pixel/vision (`C4`) alone
- Omitting `session/` or `compare/` when those stages were used

## Prose gate (required when shipping narrative)

Run `skills/academic-prose-gate` (upstream [academic-scrub](https://github.com/tsuntungngaing-jtn/academic-scrub)) on README, validation/optimize narratives, and figure captions before close-out. Tick `checklists/academic-prose-checklist.md`.

## Manuscript Word (optional; when requested)

Default archive prose is Markdown. If the user needs a **Word** manuscript **after LaTeX typesetting**, run `skills/manuscript-export` (`scripts/export_manuscript.ps1`):

1. Pandoc MD → LaTeX (`ctexart` + XeLaTeX for Chinese)
2. XeLaTeX → PDF
3. Pandoc → `.docx`

Do not claim “经 LaTeX 排版的 Word” unless `.tex` and successful `.pdf` exist beside the `.docx`.

## Handoff Message Template

```markdown
## Delivery: <Project>

**Status:** FLOW_VALIDATED + THERMAL_VALIDATED (not PAPER_COMPARABLE)

**Session:** intake=… path_policy=… (see session/SESSION_CONFIG.md)

**Primary files:**
- `VERIFIED_USE_THESE/<name>_CHT_SOLVED.mph`
- `builders_logs/Build<>.java`
- `compare/COMPARE_LOG.md`

**Reproduce:**
`comsolbatch -inputfile ... -study std_flow`

**Caveats:** Split flow/heat studies; honeycomb mesh quality warnings documented.

**Human review required before citation in manuscript.**
```

## Related

- `templates/PROJECT_LAYOUT.md`
- `workflows/project-storage.md`
- `skills/simulation-equation-audit/SKILL.md`
- `skills/academic-prose-gate/SKILL.md`
- `skills/parameter-optimize/SKILL.md`
- `workflows/transformer-pipeline.md`
- `checklists/final-delivery-checklist.md`
- `checklists/replicate-before-optimize-checklist.md`
- `checklists/academic-prose-checklist.md`
- `templates/result-report-template.md`
