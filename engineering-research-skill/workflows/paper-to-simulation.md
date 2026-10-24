# Paper-to-Simulation Workflow

**End-to-end map from reference publication to archived deliverable.**

For the full **Encoder → Decision → Replicate → Optimize → Prose** map, prefer
[`transformer-pipeline.md`](transformer-pipeline.md). This file details CAD/solve
phases inside **Decoder · Replicate** (and optional Optimize after scorecard).

## Pipeline

```text
┌──────────────────────────────────────────────────────────────────┐
│ PHASE 0: ENCODER + DECISION (Transformer)                        │
├──────────────────────────────────────────────────────────────────┤
│ deep-search → evidence/EVIDENCE_LEDGER.md                        │
│ decision-gate → OPTION_CARD / DECISION_LOG (or written waiver)   │
└──────────────────────────────────────────────────────────────────┘
                              ↓
┌──────────────────────────────────────────────────────────────────┐
│ PHASE A: KNOWLEDGE                                               │
├──────────────────────────────────────────────────────────────────┤
│ Prefer ledger rows over cold PDF skim                            │
│ paper-analysis skill → PAPER_SPEC.md                             │
│ Human gate: confirm parameters                                   │
└──────────────────────────────────────────────────────────────────┘
                              ↓
┌──────────────────────────────────────────────────────────────────┐
│ PHASE B: GEOMETRY                                                │
├──────────────────────────────────────────────────────────────────┤
│ Topology sketch (SVG / Fig. trace)                               │
│ geometry-reconstruction → Build*.java or SW STEP                 │
│ COMSOL_READY.mph + STEP export                                   │
│ geometry-checklist.md                                            │
└──────────────────────────────────────────────────────────────────┘
                              ↓
┌──────────────────────────────────────────────────────────────────┐
│ PHASE C: PHYSICS & MESH                                          │
├──────────────────────────────────────────────────────────────────┤
│ Template: hangyezhang-style spf + ht (+ nitf1)                     │
│ OR graft: mmc_COMSOL_first_try / mmc_hangyezhang_graft_for_assem │
│ mesh-checklist.md + physics-checklist.md                         │
└──────────────────────────────────────────────────────────────────┘
                              ↓
┌──────────────────────────────────────────────────────────────────┐
│ PHASE D: SOLVE                                                   │
├──────────────────────────────────────────────────────────────────┤
│ simulation-workflow.md Stage 4 (staged solve)                    │
│ comsolbatch + simulation-log-template.md                         │
│ On failure → debugging-workflow.md                               │
└──────────────────────────────────────────────────────────────────┘
                              ↓
┌──────────────────────────────────────────────────────────────────┐
│ PHASE E: VERIFY & COMMUNICATE                                    │
├──────────────────────────────────────────────────────────────────┤
│ verification-workflow.md → VALIDATION_REPORT.md                  │
│ replicate/REPLICATE_SCORECARD.md                                 │
│ scientific-figure skill → exports + captions                     │
│ academic-prose-gate (academic-scrub) on narrative artifacts      │
└──────────────────────────────────────────────────────────────────┘
                              ↓ (only if replicate-before-optimize)
┌──────────────────────────────────────────────────────────────────┐
│ PHASE F: OPTIMIZE (optional)                                     │
├──────────────────────────────────────────────────────────────────┤
│ parameter-optimize → optimize/OPTIMIZE_RUN_LOG.md                │
│ Numeric and/or pixel compare; no EXACT promotion from pixels     │
└──────────────────────────────────────────────────────────────────┘
                              ↓
┌──────────────────────────────────────────────────────────────────┐
│ PHASE G: DELIVERY                                                │
├──────────────────────────────────────────────────────────────────┤
│ delivery skill → VERIFIED_USE_THESE (REPLICATE_* / OPTIMIZED_*)  │
└──────────────────────────────────────────────────────────────────┘
```

## Decision Tree: Geometry Source

```text
Paper gives explicit dimensions for 2D topology?
  YES → COMSOL Java Block/Union (Tan2019 Fig.2 pattern)
  NO  → Is CAD available?
          YES → SolidWorks → STEP → COMSOL import + fluid carve
          NO  → Request human figure trace; do not invent topology
```

## Decision Tree: Model Fidelity

```text
Whole device temperature map needed?
  YES → Homogenized channel bed OR explicit multi-cell (costly)
  NO  → Single unit cell with explicit microchannels (Lee2026 strict cell)

Microchannel width < 50 μm across full chip?
  YES → Warn: full explicit CFD may need HPC; propose homogenized tier
```

## Decision Tree: Coupling Strategy

```text
First solve on new geometry?
  YES → std_flow only, low u_in
  Flow stable?
    YES → std_heat_stable
    NO  → debug (geometry/BC before coupling)
  Paper requires coupled CHT?
    YES → nitf1 after staged success
```

## Artifact Traceability Matrix

| Phase | Primary artifact | Traceable to |
|-------|------------------|--------------|
| 0 | EVIDENCE_LEDGER.md / DECISION_LOG.md | Paper + official docs / user |
| A | PAPER_SPEC.md | Ledger claim_ids + paper table/fig |
| B | Build*.java | PAPER_SPEC |
| B | STEP | COMSOL geom export or SW |
| C | COMSOL_READY.mph | Builder + checklists |
| D | *_FLOW_SOLVED.mph | batch log |
| E | VALIDATION_REPORT.md / REPLICATE_SCORECARD.md | Metrics + paper |
| E | Figures | mph dataset + caption template |
| F | OPTIMIZE_RUN_LOG.md | Baseline scorecard + ledger |
| G | VERIFIED_USE_THESE | Delivery checklist + prose scrub log |

## Parallel Tracks (common in practice)

| Track | Example | Notes |
|-------|---------|-------|
| Paper Fig.2 topology | Tan2019 five models | Split flow/heat |
| Fig.3 replica + CHT patch | lateral veiny embedded | Patch chain |
| MMC whole chip | Lee2026 | Homogenized + half-area variant |
| STEP graft | MMC + valve | hangyezhang template copy |

## AI Session Starter

```text
1. Read workflows/transformer-pipeline.md
2. deep-search → EVIDENCE_LEDGER — then decision-gate (or waiver)
3. paper-analysis from ledger → PAPER_SPEC.md — STOP for human
4. After approval: geometry-reconstruction + simulation-workflow
5. validation → REPLICATE_SCORECARD; only then parameter-optimize if requested
6. academic-prose-gate before delivery; never skip solve logs
```

## Success Definition

A paper-to-simulation project is **complete** only when:

1. `final-delivery-checklist.md` all required items checked
2. Validation status explicitly stated (not implied)
3. Human sign-off recorded or waived in writing
4. `VERIFIED_USE_THESE/` contains only current best mph with README
5. Ledger + decision log present (or explicit waiver)
6. Narrative README/reports passed `academic-prose-gate` when prose is shipped
7. If optimized variants shipped: replicate-before-optimize checklist passed

## Philosophy Reminder

> AI assists reasoning and workflow; human validates physics and engineering correctness.
