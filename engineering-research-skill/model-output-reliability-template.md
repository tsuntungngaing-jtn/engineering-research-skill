# Model Output Reliability Summary

**Study:** `________________`  
**Audit reference:** `model_equation_audit.md`  
**Date:** `________________`

## Reliability Scale

| Level | Use |
|-------|-----|
| A | Quantitative conclusion |
| B | Trend reference only |
| C | Debug / exploratory |
| D | Invalid — do not use; rerun |

## Output Register

| Output file | Description | Reliability | Blocking issues | Usable for |
|-------------|-------------|-------------|-----------------|------------|
| | | A/B/C/D | | trend / figure / design / none |

## Downgrade Rules Applied

<!-- List any warnings that forced C or D -->


- Extrapolation: ...
- Solver non-convergence: ...
- Unit / coordinate issues: ...
- Unverified post-processing: ...

## Publication / Delivery Gate

- [ ] No **D** outputs in `VERIFIED_USE_THESE` or final report without explicit waiver
- [ ] **A** outputs have completed audit sections 4–7 and 9
- [ ] Figures from **B** outputs carry trend-only caption disclaimer

## Overall Study Reliability

**Highest defensible level for primary claim:** A / B / C / D

**Summary sentence:**


---

*Derived from `simulation-equation-audit` skill — update when any output or model changes.*
