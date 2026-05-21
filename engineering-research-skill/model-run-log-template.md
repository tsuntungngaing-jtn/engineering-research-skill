# Model Run Log

**Log ID:** `RUN-YYYYMMDD-###`  
**Linked audit:** `model_equation_audit.md` (Audit ID: `________`)  
**Operator:** `________________`

---

## Run Info

| Field | Value |
|-------|-------|
| Tool | COMSOL / Mathematica / MATLAB / Python / other |
| Input model / script | |
| Output artifacts | |
| Start time | |
| End time | |
| Exit status | success / failed / warning |

## Command or Action

```text
(paste batch command, study name, or script invocation)
```

**Evidence:** log path, `.status`, LASTEXITCODE, stdout excerpt

---

## Intent

<!-- What this run was trying to answer — link to Research Question in audit -->


## Pre-Run Audit Gates

- [ ] `model_equation_audit.md` Steps 1–6 reviewed
- [ ] Units and coordinates confirmed
- [ ] BC/IC unchanged or re-audited

## Parameters Changed

| Parameter | Old | New | Reason |
|-----------|-----|-----|--------|
| | | | |

## Solver / Numerical Outcome

| Item | Value |
|------|-------|
| Convergence | pass / warning / fail |
| Final residual / tolerance | |
| Iterations | |
| Warnings | |
| Extrapolation detected | yes / no |

## Spot Checks

| Check | Pass? | Note |
|-------|-------|------|
| Outputs in valid range | | |
| No unit mismatch in exports | | |
| Post-processing frame correct | | |

## Reliability Impact

| Output | Previous grade | New grade | Reason |
|--------|----------------|-----------|--------|
| | | | |

## Next Steps

- ...

---

**Reviewer:** ___________ **Date:** ___________
