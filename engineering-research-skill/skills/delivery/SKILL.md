---
name: delivery
description: >-
  Package final engineering simulation deliverables: VERIFIED mph files, logs,
  builder scripts, STEP geometry, validation report, and README for archive
  folders. Use when closing a study or handing off to advisor/collaborator.
  Requires explicit validation status—never mark VERIFIED without logs.
---

# Delivery Skill

## Role

Produce a **reproducible, auditable** delivery package suitable for lab archive, thesis appendix, or supplementary material.

## Folder Structure (standard)

```text
<PROJECT_ID>/
├── evidence/             # EVIDENCE_LEDGER + excerpts
├── decisions/            # OPTION_CARD + DECISION_LOG
├── replicate/            # REPLICATE_SCORECARD + baseline notes
├── optimize/             # OPTIMIZE_RUN_LOG + child runs (optional)
├── prose_scrub/          # SCRUB_LOG + backups from academic-prose-gate
├── references/           # PDF, DOI link
├── figures/              # SVG schematics, exported PNG/PDF
├── cad_solidworks_step/  # .STEP, .SLDPRT
├── comsol_models/        # .mph, .status, stdout
├── builders_logs/        # .java, .m, build/solve logs
├── VERIFIED_USE_THESE/   # human-approved finals only
│   ├── REPLICATE_*.mph
│   └── OPTIMIZED_*.mph   # only after replicate-before-optimize
├── PAPER_SPEC.md
├── model_equation_audit.md
├── model_run_log.md              # if numerical runs
├── model_output_reliability.md   # optional, many outputs
├── VALIDATION_REPORT.md
└── README_使用说明.md or README.md
```

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

Prefer **new file** over overwriting locked/open COMSOL sessions.

## README Minimum Content

1. **Purpose** — which paper figure / claim
2. **Use these files** — explicit list with priority (`VERIFIED_USE_THESE` first)
3. **Superseded files** — old mph that trigger solver bugs
4. **Parameters** — table from `PAPER_SPEC.md`
5. **Validation status** — per study from validation skill
6. **How to reproduce** — Java compile line or batch command
7. **Known limitations** — mesh, split flow/heat, topology delta

## Required Deliverable Table

| Artifact | Required | Evidence |
|----------|----------|----------|
| EVIDENCE_LEDGER + DECISION_LOG | Yes (or written Phase-0 waiver) | `evidence/` `decisions/` |
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

## Prose gate (required when shipping narrative)

Run `skills/academic-prose-gate` (upstream [academic-scrub](https://github.com/tsuntungngaing-jtn/academic-scrub)) on README, validation/optimize narratives, and figure captions before close-out. Tick `checklists/academic-prose-checklist.md`.

## Handoff Message Template

```markdown
## Delivery: <Project>

**Status:** FLOW_VALIDATED + THERMAL_VALIDATED (not PAPER_COMPARABLE)

**Primary files:**
- `VERIFIED_USE_THESE/<name>_CHT_SOLVED.mph`
- `builders_logs/Build<>.java`

**Reproduce:**
`comsolbatch -inputfile ... -study std_flow`

**Caveats:** Split flow/heat studies; honeycomb mesh quality warnings documented.

**Human review required before citation in manuscript.**
```

## Related

- `skills/simulation-equation-audit/SKILL.md` (or root audit templates if that layout is used)
- `skills/academic-prose-gate/SKILL.md`
- `skills/parameter-optimize/SKILL.md`
- `workflows/transformer-pipeline.md`
- `checklists/final-delivery-checklist.md`
- `checklists/replicate-before-optimize-checklist.md`
- `checklists/academic-prose-checklist.md`
- `checklists/model-equation-audit-checklist.md`
- `templates/result-report-template.md`
