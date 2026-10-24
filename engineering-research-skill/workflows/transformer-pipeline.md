# Transformer Pipeline Workflow

**Metaphor only — no ML model training.**  
Map: **Input → Encoder(Deep Search) → Decision → Decoder(Replicate → Optimize)**  
Language gate: **academic-prose-gate** (fused [academic-scrub](https://github.com/tsuntungngaing-jtn/academic-scrub)).  
Storage: **`workflows/project-storage.md`** + `templates/PROJECT_LAYOUT.md`.

## Stage map

```text
STORAGE INIT (once per PROJECT_ID)
  scripts/init-project-storage.* → session/ references/ evidence/ …
  map: templates/PROJECT_LAYOUT.md | workflows/project-storage.md
        |
        v
INPUT + SESSION BOOT (config in session/SESSION_CONFIG.md)
  Skill: `session-boot` · checklist: `session-boot-checklist.md` · map: `workflows/session-boot.md`
  Paper / DOI / research question + optional COMSOL version
        |
        v
ENCODER — deep-search
  → evidence/EVIDENCE_LEDGER.md
  Literature + official manuals; origin & locus on every claim
        |
        v
DECISION — decision-gate
  → decisions/OPTION_CARD.md → user SELECT / SENSITIVITY / REFUSE
  REFUSE → accountable self-iterate (≤3) else BLOCKED
  → decisions/DECISION_LOG.md
        |
        v
DECODER · REPLICATE
  paper-analysis → geometry-reconstruction → solve / comsol-debug
  → simulation-equation-audit → validation
  → compare/COMPARE_LOG.md (C0–C4 as enabled; `compare-closed-loop-checklist.md`)
  → replicate/REPLICATE_SCORECARD.md
  Optional prose scrub on validation narrative
        |
        |  (only if scorecard allows)
        v
DECODER · OPTIMIZE — parameter-optimize
  Numeric and/or pixel compare; baseline locked
  → optimize/OPTIMIZE_RUN_LOG.md
        |
        v
PROSE GATE — academic-prose-gate (academic-scrub)
  README, captions, reports: remove process / AIGC packaging
  → prose_scrub/SCRUB_LOG.md
        |
        v
DELIVERY — delivery
  VERIFIED_USE_THESE/REPLICATE_* and OPTIMIZED_*
  Must include session/ (+ compare/ when claims cite QoI/figures)
```

## Relation to `paper-to-simulation.md`

| Legacy phase | Transformer stage |
|--------------|-------------------|
| (new) | Storage init + Session boot |
| (new) | Encoder + Decision |
| Phase A Knowledge | Decoder · Replicate (`paper-analysis` from ledger) |
| Phase B–D Geometry / Physics / Solve | Decoder · Replicate |
| Phase E Verify & communicate | Compare + scorecard + figures + prose gate |
| (new) | Decoder · Optimize |
| Delivery | Extended archive layout |

Use this file for full projects that need search → choice → replicate → optimize.  
Use `paper-to-simulation.md` alone only when ledger/decision already exist or user waives Encoder/Decision in writing.

## Hard rules

1. Replicate before optimize (`replicate-before-optimize-checklist.md`).
2. Self-iterate uses ledger only; no invented numbers.
3. Pixel comparisons stay `digitized_estimate`; C4 alone cannot yield EXACT `VALIDATED` (`compare-closed-loop-checklist.md`).
4. Refuse ≠ “pick the prettiest figure match”.
5. Prose close-out requires academic-scrub via `academic-prose-gate` (`academic-prose-checklist.md`).
6. Project storage stays outside the skill git repo; init with `scripts/init-project-storage.*`.
7. Obsidian snapshots are readable cabinets only; GitHub remains authoritative (`docs/versioning-obsidian.md`).

## Minimal dry-run (fictional)

See `workflows/examples/transformer-pipeline-dry-run.md`.
