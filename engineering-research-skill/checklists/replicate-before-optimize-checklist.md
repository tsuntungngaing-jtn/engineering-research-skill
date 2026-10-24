# Replicate-Before-Optimize Checklist

**Do not run `parameter-optimize` until all required boxes pass.**

## Required

- [ ] `replicate/REPLICATE_SCORECARD.md` exists
- [ ] Status is `REPLICATE_PASS` **or** `REPLICATE_PASS_WITH_GAPS` with human waiver **or** `REPLICATE_BASELINE_LOCKED` with human waiver
- [ ] Baseline mph path recorded; copy policy understood (optimize uses copies)
- [ ] Numeric paper targets use `reported`/`derived` where claimed EXACT
- [ ] Any pixel comparisons labeled `digitized_estimate`
- [ ] `VALIDATION_REPORT.md` present for the baseline study

## Forbidden if true (stop)

- [ ] Scorecard missing or `REPLICATE_FAIL`
- [ ] Plan to tune only to match a colorbar and call parent VALIDATED
- [ ] Contested high-impact BC still `conflict` without decision log entry

## After optimize (before delivery)

- [ ] `optimize/OPTIMIZE_RUN_LOG.md` complete
- [ ] `academic-prose-gate` + `academic-prose-checklist.md` on narrative claims / README
- [ ] `VERIFIED_USE_THESE` separates `REPLICATE_` and `OPTIMIZED_` names
