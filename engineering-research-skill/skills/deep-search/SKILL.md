---
name: deep-search
description: >-
  Encoder stage: deep-search academic literature and official technical docs into
  an accountable EVIDENCE_LEDGER before planning or modeling. Use at project start,
  when parameters conflict, or before decision-gate. Never invent page numbers or
  values; every entry needs origin and locus.
---

# Deep Search Skill (Encoder)

## Role

Turn an **input question / reference paper** into a machine- and human-readable
**accountable evidence store**. This is the Transformer-pipeline **Encoder**:
retrieve and encode evidence; do not yet build geometry or claim validation.

## When to Use

- New paper replication or optimization study
- Conflicting numbers between table, equation, and figure
- Before emitting option cards (`decision-gate`)
- When official COMSOL / material-library guidance must anchor API choices

## Inputs

1. Research question (1–2 sentences)
2. Primary paper (PDF / DOI / local path)
3. Optional: COMSOL version, modules, prior project folder

## Source hierarchy (search order)

1. **Paper tables** — dimensions, BC, operating points
2. **Paper body / methods / CFD setup** — physics assumptions, solver notes
3. **Figure captions + axes** — topology, ranges (values from pixels ? later as `digitized_estimate` only)
4. **Supplementary material**
5. **Official technical docs** — installed COMSOL Application Library / versioned manuals; Material Library provenance
6. **Secondary literature** — only to propose candidates; never override (1)–(5) without labeling conflict

## Output

Write `evidence/EVIDENCE_LEDGER.md` using `templates/EVIDENCE_LEDGER.md`.

Each row / block must include:

| Field | Meaning |
|-------|---------|
| `claim_id` | Stable id (e.g. E012) |
| `quantity` | What is asserted |
| `value` / `unit` | Or interval |
| `origin` | `reported` \| `derived` \| `digitized_estimate` \| `manual_official` \| `library` \| `user_supplied` \| `inferred_candidate` |
| `certainty` | `high` \| `medium` \| `low` \| `conflict` |
| `paper_locus` or `doc_locus` | Table/Fig/Sec or manual path + version |
| `conflicts` | Pointers to other claim_ids |
| `blocks` | `none` \| `geometry` \| `bc` \| `claim` \| `optimize` |

## Hard rules

- No silent fill. Missing ? `[NOT FOUND]` with search notes.
- Digitized colorbar/axis ? `digitized_estimate` with uncertainty; **never** upgrade to `reported`.
- Official-manual entries require product version string.
- Deep search **stops** at ledger + short conflict summary; next stage is `decision-gate`.

## Downstream

1. `decision-gate` — options from ledger
2. `paper-analysis` — consolidate confirmed rows into `PAPER_SPEC.md`
3. Align epistemic policy with comsol-automatic underspec (policy C) when MCP is used

## Checklist

See `checklists/deep-search-checklist.md`.
