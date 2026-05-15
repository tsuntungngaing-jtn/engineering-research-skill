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
├── references/           # PDF, DOI link
├── figures/              # SVG schematics, exported PNG/PDF
├── cad_solidworks_step/  # .STEP, .SLDPRT
├── comsol_models/        # .mph, .status, stdout
├── builders_logs/        # .java, .m, build/solve logs
├── VERIFIED_USE_THESE/   # human-approved final mph only
├── PAPER_SPEC.md
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
| Builder source | Yes | `.java` / `.m` in `builders_logs/` |
| READY mph | Yes | Opens, geom builds |
| SOLVED mph | If claimed | Batch log `Done`, LASTEXITCODE=0 |
| STEP geometry | If CAD path | mm units |
| Solve stdout | If SOLVED | Attached |
| VALIDATION_REPORT | Yes | Metrics + status |
| Figure exports | If publication | 300 dpi + caption |

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

- `checklists/final-delivery-checklist.md`
- `templates/result-report-template.md`
