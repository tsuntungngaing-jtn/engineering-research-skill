# AI Engineering Research Skill System

**An AI-assisted engineering simulation laboratory workflow for Cursor / Codex.**

This repository packages a reproducible research pipeline for microfluidic thermal management, multiphysics COMSOL simulation, SolidWorks CAD, and publication-grade validation. It is derived from operational practice in paper-to-simulation replication (Lee 2026 MMC, Tan 2019 bio-inspired channels, fractal microchannel studies).

## Philosophy

> **AI assists reasoning and workflow; humans validate physics and engineering correctness.**

The agent must never claim convergence, validation, or publication readiness without evidence. Simulation success requires logs, mesh metrics, and physics sanity checks—not colorful plots alone.

**Overall research stance:** **replicate first, then optimize** on a locked baseline.

## Transformer pipeline (metaphor)

No ML Transformer is trained. Stages mirror Encoder → Decision → Decoder:

```
Input
  → Encoder: deep-search → EVIDENCE_LEDGER (literature + official docs)
  → Decision: decision-gate → OPTION_CARD / user choice / accountable self-iterate
  → Decoder · Replicate: paper-analysis → geometry → solve → validation → REPLICATE_SCORECARD
  → Decoder · Optimize: parameter-optimize (numeric and/or pixel compare)
  → Prose gate: academic-prose-gate (fused academic-scrub)
  → Delivery: VERIFIED_USE_THESE (REPLICATE_* vs OPTIMIZED_*)
```

Full map: [`workflows/transformer-pipeline.md`](workflows/transformer-pipeline.md).  
Legacy detailed CAD/solve map: [`workflows/paper-to-simulation.md`](workflows/paper-to-simulation.md).

## Language / journal prose

Process contamination and AIGC defensive tone in reports, captions, and README are handled by **`academic-prose-gate`**, which **requires** the upstream skill:

**https://github.com/tsuntungngaing-jtn/academic-scrub**

```powershell
git clone https://github.com/tsuntungngaing-jtn/academic-scrub.git $env:USERPROFILE\.cursor\skills\academic-scrub
```

Do not close delivery without a prose scrub pass when narrative artifacts are shipped.
See `checklists/academic-prose-checklist.md` and `NOTICE.md`.

## Project storage (runtime)

Simulation outputs live in a **project folder**, not in this skill git tree. Canonical layout: [`templates/PROJECT_LAYOUT.md`](templates/PROJECT_LAYOUT.md). Init:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/init-project-storage.ps1 -ProjectRoot "D:\work\<PROJECT_ID>"
```

Details: [`workflows/project-storage.md`](workflows/project-storage.md). Includes `session/`, `compare/`, `evidence/`, `decisions/`, `replicate/`, `optimize/`, `VERIFIED_USE_THESE/`.

## Repository Layout

| Path | Purpose |
|------|---------|
| `skills/` | Cursor/Codex agent skills (one `SKILL.md` per module) |
| `workflows/` | Stage-gate process documents |
| `checklists/` | Pre-flight and sign-off checklists |
| `prompts/` | Reusable prompt templates for agent sessions |
| `templates/` | Reports, logs, ledgers, session/compare storage seeds |
| `scripts/` | `init-project-storage` helpers |

## Installation (Cursor)

### Option A — Project skill (recommended for a research repo)

```text
cp -r skills/* your-project/.cursor/skills/
```

Also install `academic-scrub` (see above).

### Option B — Personal skill (all projects)

```text
cp -r skills/* ~/.cursor/skills/
```

### Option C — Reference only

Point the agent at this repo in a Cursor rule:

```text
For COMSOL/microfluidic simulation tasks, follow engineering-research-skill/workflows/transformer-pipeline.md
```

## Skill Index

| Skill | Stage | Trigger |
|-------|-------|---------|
| `deep-search` | Encoder | Start project; build accountable evidence ledger |
| `decision-gate` | Decision | Option cards; user select / refuse → self-iterate |
| `paper-analysis` | Decoder · Replicate | Consolidate ledger → `PAPER_SPEC.md` |
| `geometry-reconstruction` | Decoder · Replicate | CAD/COMSOL geometry from confirmed spec |
| `comsol-debug` | Decoder · Replicate | Solver / green-field / mesh failures |
| `simulation-equation-audit` | Decoder · Replicate | Equation / coordinate / A–D reliability |
| `validation` | Decoder · Replicate | Physics + paper comparison status |
| `parameter-optimize` | Decoder · Optimize | After replicate scorecard; numeric/pixel search |
| `scientific-figure` | Communicate | Nature/IEEE-style figures |
| `academic-prose-gate` | Prose | Fuse academic-scrub on deliverable text (`academic-prose-checklist`) |
| `delivery` | Archive | `VERIFIED_USE_THESE`, full package |

## Mandatory Pre-Solve Gates

Before any COMSOL study run, the agent must complete:

0. **Evidence + decision** — ledger ready; decision logged (or written waiver)
0b. **Equation audit** — `model_equation_audit.md` (`simulation-equation-audit`)
1. **Units** — mm vs m consistency (STEP import scale is a common failure mode)
2. **Domain assignment** — fluid vs solid explicitly separated
3. **Boundary conditions** — traceable to paper section/table (ledger `claim_id`)
4. **Mesh scale** — resolves channel height and thermal boundary layer order-of-magnitude
5. **Reynolds number** — laminar/turbulent assumption stated and justified

## Mandatory Pre-Optimize Gates

- `checklists/replicate-before-optimize-checklist.md`
- Digitized figure samples remain `digitized_estimate`

## Prohibited Behaviors

- Fabricating convergence or "Done" status without `.status` / log evidence
- Presenting full-green velocity fields without diagnosing domain selection
- Reporting temperatures below inlet or above physically plausible limits without explanation
- Skipping uncertainty and assumption disclosure in deliverables
- Marking outputs **A** (quantitative) without `model_equation_audit.md` and reliability grades
- Silent defaults on high-impact underspec when user refuses or is AFK
- Optimizing before a replicate scorecard
- Promoting pixel matches to paper-reported `VALIDATED`
- Shipping narrative README/reports without `academic-prose-gate` when prose is in scope

## Toolchain

| Tool | Role |
|------|------|
| COMSOL Multiphysics 6.x | CFD, heat transfer, CHT, Java API builders |
| SolidWorks | STEP export, assembly alignment |
| MATLAB LiveLink | STEP import, `mphgeominfo`, graft scripts |
| PdfPig / PDF text | Paper parameter extraction |
| Cursor / Codex | Workflow orchestration, code generation under human review |
| academic-scrub | Journal-language / process-contamination scrub |

Optional runtime automation: sibling project **comsol-automatic** (MCP). Epistemic policy C (digitized ≠ reported) aligns with `decision-gate` / `parameter-optimize`.

## Related Artifacts

If you maintain a project archive (e.g. `hangyezhang_sop/建模/00_统一归档_论文_模型_仿真/`), align folder naming with `templates/simulation-log-template.md`, `skills/delivery/SKILL.md`, and `checklists/final-delivery-checklist.md`.

## License

MIT — use in academic and industrial research; cite assumptions and validate physics independently.  
`academic-scrub` remains a separate repository with its own license/terms.

## Maintainer

tsuntungngaing-jtn — AI-assisted thermal–fluidic device research.
