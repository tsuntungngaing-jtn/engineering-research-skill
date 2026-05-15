# AI Engineering Research Skill System

**An AI-assisted engineering simulation laboratory workflow for Cursor / Codex.**

This repository packages a reproducible research pipeline for microfluidic thermal management, multiphysics COMSOL simulation, SolidWorks CAD, and publication-grade validation. It is derived from operational practice in paper-to-simulation replication (Lee 2026 MMC, Tan 2019 bio-inspired channels, fractal microchannel studies).

## Philosophy

> **AI assists reasoning and workflow; humans validate physics and engineering correctness.**

The agent must never claim convergence, validation, or publication readiness without evidence. Simulation success requires logs, mesh metrics, and physics sanity checks—not colorful plots alone.

## End-to-End Workflow

```
Reference Paper
  → Extract geometry & physics (paper-analysis)
  → AI-assisted CAD / COMSOL geometry (geometry-reconstruction)
  → COMSOL simulation setup & solve
  → Debug (comsol-debug)
  → Physics validation (validation)
  → Scientific figures (scientific-figure)
  → Final delivery (delivery)
```

## Repository Layout

| Path | Purpose |
|------|---------|
| `skills/` | Cursor/Codex agent skills (one `SKILL.md` per module) |
| `workflows/` | Stage-gate process documents |
| `checklists/` | Pre-flight and sign-off checklists |
| `prompts/` | Reusable prompt templates for agent sessions |
| `templates/` | Reports, logs, figure captions |

## Installation (Cursor)

### Option A — Project skill (recommended for a research repo)

```text
cp -r skills/* your-project/.cursor/skills/
```

Or symlink individual skills:

```text
your-project/.cursor/skills/paper-analysis/   →  engineering-research-skill/skills/paper-analysis/
```

### Option B — Personal skill (all projects)

```text
cp -r skills/* ~/.cursor/skills/
```

### Option C — Reference only

Point the agent at this repo in a Cursor rule:

```text
For COMSOL/microfluidic simulation tasks, follow engineering-research-skill/workflows/simulation-workflow.md
```

## Skill Index

| Skill | Trigger |
|-------|---------|
| `paper-analysis` | New reference paper, parameter extraction, BC/material audit |
| `geometry-reconstruction` | CAD/COMSOL geometry from paper dimensions |
| `comsol-debug` | Solver failure, green velocity fields, mesh warnings |
| `validation` | Physics sanity, Re/Pe checks, comparison to paper |
| `scientific-figure` | Nature/IEEE-style multi-panel figures |
| `delivery` | Final package, VERIFIED_USE_THESE archive |

## Mandatory Pre-Solve Gates

Before any COMSOL study run, the agent must complete:

1. **Units** — mm vs m consistency (STEP import scale is a common failure mode)
2. **Domain assignment** — fluid vs solid explicitly separated
3. **Boundary conditions** — traceable to paper section/table
4. **Mesh scale** — resolves channel height and thermal boundary layer order-of-magnitude
5. **Reynolds number** — laminar/turbulent assumption stated and justified

## Prohibited Behaviors

- Fabricating convergence or "Done" status without `.status` / log evidence
- Presenting full-green velocity fields without diagnosing domain selection
- Reporting temperatures below inlet or above physically plausible limits without explanation
- Skipping uncertainty and assumption disclosure in deliverables

## Toolchain

| Tool | Role |
|------|------|
| COMSOL Multiphysics 6.x | CFD, heat transfer, CHT, Java API builders |
| SolidWorks | STEP export, assembly alignment |
| MATLAB LiveLink | STEP import, `mphgeominfo`, graft scripts |
| PdfPig / PDF text | Paper parameter extraction |
| Cursor / Codex | Workflow orchestration, code generation under human review |

## Related Artifacts

If you maintain a project archive (e.g. `hangyezhang_sop/建模/00_统一归档_论文_模型_仿真/`), align folder naming with `templates/simulation-log-template.md` and `checklists/final-delivery-checklist.md`.

## License

MIT — use in academic and industrial research; cite assumptions and validate physics independently.

## Maintainer

tsuntungngaing-jtn — AI-assisted thermal–fluidic device research.
