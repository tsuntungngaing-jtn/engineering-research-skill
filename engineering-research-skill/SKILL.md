---
name: engineering-research-skill
description: >-
  End-to-end engineering research pipeline for paper→evidence→decision→COMSOL
  simulation→validation→compare→prose gate→delivery, including optional
  manuscript export (Markdown → LaTeX typesetting → Word/PDF). Use for blind
  paper replication, accountable FEA, and case-study archive packaging.
license: MIT
metadata:
  display_name: Engineering Research Skill
  based_on: tsuntungngaing-jtn/engineering-research-skill
---

# Engineering Research Skill

Transformer-style pipeline (see `README.md`, `workflows/transformer-pipeline.md`):

```text
session-boot → deep-search → decision-gate → paper-analysis
  → geometry / solve / comsol-debug → validation + compare
  → academic-prose-gate → delivery → manuscript-export (optional)
```

## Skill index

| Skill | Role |
|-------|------|
| `session-boot` | Language / intake / path policy |
| `deep-search` | EVIDENCE_LEDGER (Encoder) |
| `decision-gate` | OPTION_CARD / DECISION_LOG |
| `paper-analysis` | PAPER_SPEC |
| `geometry-reconstruction` | Geometry from ledger |
| `comsol-debug` | Solve / repair |
| `validation` | Physics + paper compare status |
| `scientific-figure` | Figure export |
| `parameter-optimize` | Only after replicate |
| `academic-prose-gate` | Scrub narrative |
| `delivery` | Archive package (MD-first) |
| **`manuscript-export`** | **MD → LaTeX → PDF + Word (.docx)** |

## Manuscript / Word policy

- Default working and archive prose remain **Markdown** (ledger, decisions, validation).
- When the user needs a **Word manuscript**, run `skills/manuscript-export`:
  1. Pandoc Markdown → **LaTeX** (`ctexart` / XeLaTeX for Chinese)
  2. Compile **PDF** (proves LaTeX typesetting)
  3. Export **Word `.docx`** from the LaTeX stage (or Pandoc DOCX with the same media)
- Do **not** silently invent a `.docx` without the LaTeX intermediate when the user asked for “经 LaTeX 排版的 Word”.
- Do **not** change scientific conclusions / QoI tables during export.

## Hard rules (unchanged)

- No silent parameter fill; origin/certainty stay distinct.
- Solver done ≠ scientific VALIDATED.
- Pixel/figure compare alone ≠ EXACT VALIDATED.
- Optimize only after replicate scorecard.

## Related

- `skills/delivery/SKILL.md`
- `skills/manuscript-export/SKILL.md`
- `scripts/export_manuscript.ps1`
- Upstream execution: [comsol-automatic](https://github.com/tsuntungngaing-jtn/comsol-automatic)
