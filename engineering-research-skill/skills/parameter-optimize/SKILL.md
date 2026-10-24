---
name: parameter-optimize
description: >-
  Decoder optimize stage after successful replication: compare model outputs to
  paper via numeric tables or pixel/colorbar analysis, then search parameters on
  the replicate baseline. Blocked until REPLICATE_SCORECARD exists. Digitized
  values stay digitized_estimate; never promote to paper-reported VALIDATED.
---

# Parameter Optimize Skill (Decoder · Optimize)

## Role

After a **replication baseline** exists, improve design metrics by accountable
parameter search. Comparison may be:

- **Numeric** — table / text values with `origin=reported` or `derived`
- **Pixel** — figure axis / colorbar sampling with `origin=digitized_estimate` + uncertainty

Overall philosophy: **replicate first, then optimize**.

## Hard gate (replicate-before-optimize)

Do **not** start until `replicate/REPLICATE_SCORECARD.md` shows one of:

- `REPLICATE_PASS` — primary QoI within stated tolerance vs paper numeric targets, or
- `REPLICATE_PASS_WITH_GAPS` — executable + documented NOT_RUN items, human waiver for optimize, or
- `REPLICATE_BASELINE_LOCKED` — human explicitly locks baseline for design exploration (not EXACT figure match)

If status is `REPLICATE_FAIL` / missing scorecard ? **STOP**.

Checklist: `checklists/replicate-before-optimize-checklist.md`.

## Comparators

| Comparator | Allowed claim | Forbidden |
|------------|---------------|-----------|
| Numeric vs `reported` | Relative error, pass/fail vs threshold | Inventing paper numbers |
| Numeric vs `derived` | Same, label derived | Calling it “paper-reported” |
| Pixel / colorbar | Interval match, trend, `SENSITIVITY` / `INCONCLUSIVE` | Upgrading to `reported` or EXACT VALIDATED |

Log every comparison in `optimize/OPTIMIZE_RUN_LOG.md` (`templates/OPTIMIZE_RUN_LOG.md`).

## Optimize loop

```text
Lock baseline mph (copy under optimize/baseline/)
? Declare objective (?P, T_max, heff, …) and free parameters
? Propose bracket / DOE from ledger + decision log only
? Solve children (one identifiable change per run when debugging)
? Compare (numeric and/or pixel)
? Update Pareto / preference note
? Stop on budget, convergence of QoI, or BLOCKED
```

## Prohibited

- Tuning parameters solely to match a digitized figure and labeling parent case `VALIDATED` / EXACT replication
- Overwriting the replicate baseline mph in place
- Using evidence not in ledger / decision log without a new deep-search row
- Skipping `academic-prose-gate` on narrative claims in optimize reports before delivery

## Handoff

- Best optimized variant ? `VERIFIED_USE_THESE/OPTIMIZED_...` only if scorecard + optimize log + validation status are present
- Prose in reports/captions ? `academic-prose-gate` (fused academic-scrub); see `checklists/academic-prose-checklist.md`
