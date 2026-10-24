# Transformer Pipeline Workflow

**Metaphor only — no ML model training.**  
Map: **Input ? Encoder(Deep Search) ? Decision ? Decoder(Replicate ? Optimize)**  
Language gate: **academic-prose-gate** (fused [academic-scrub](https://github.com/tsuntungngaing-jtn/academic-scrub)).

## Stage map

```text
INPUT
  Paper / DOI / research question + optional COMSOL version
        |
        v
ENCODER — deep-search
  ? evidence/EVIDENCE_LEDGER.md
  Literature + official manuals; origin & locus on every claim
        |
        v
DECISION — decision-gate
  ? OPTION_CARD.md ? user SELECT / SENSITIVITY / REFUSE
  REFUSE ? accountable self-iterate (?3) else BLOCKED
  ? DECISION_LOG.md
        |
        v
DECODER · REPLICATE
  paper-analysis ? geometry-reconstruction ? solve / comsol-debug
  ? simulation-equation-audit ? validation
  ? replicate/REPLICATE_SCORECARD.md
  Optional prose scrub on validation narrative
        |
        |  (only if scorecard allows)
        v
DECODER · OPTIMIZE — parameter-optimize
  Numeric and/or pixel compare; baseline locked
  ? optimize/OPTIMIZE_RUN_LOG.md
        |
        v
PROSE GATE — academic-prose-gate (academic-scrub)
  README, captions, reports: remove process / AIGC packaging
  ? prose_scrub/SCRUB_LOG.md
        |
        v
DELIVERY — delivery
  VERIFIED_USE_THESE/REPLICATE_* and OPTIMIZED_*
```

## Relation to `paper-to-simulation.md`

| Legacy phase | Transformer stage |
|--------------|-------------------|
| (new) | Encoder + Decision |
| Phase A Knowledge | Decoder · Replicate (`paper-analysis` from ledger) |
| Phase B–D Geometry / Physics / Solve | Decoder · Replicate |
| Phase E Verify & communicate | Scorecard + figures + prose gate |
| (new) | Decoder · Optimize |
| Delivery | Extended archive layout |

Use this file for full projects that need search ? choice ? replicate ? optimize.  
Use `paper-to-simulation.md` alone only when ledger/decision already exist or user waives Encoder/Decision in writing.

## Hard rules

1. Replicate before optimize (`replicate-before-optimize-checklist.md`).
2. Self-iterate uses ledger only; no invented numbers.
3. Pixel comparisons stay `digitized_estimate`.
4. Refuse ? “pick the prettiest figure match”.
5. Prose close-out requires academic-scrub via `academic-prose-gate` (`academic-prose-checklist.md`).

## Minimal dry-run (fictional)

See `workflows/examples/transformer-pipeline-dry-run.md`.
