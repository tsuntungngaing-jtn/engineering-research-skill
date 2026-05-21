# Simulation Log Entry

**Log ID:** `SIM-YYYYMMDD-###`  
**Operator:** `________________`  
**COMSOL version:** `________________`

---

## Session Info

| Field | Value |
|-------|-------|
| Model (input) | |
| Model (output) | |
| Study | |
| Mode | GUI / batch |
| Start time | |
| End time | |

## Command

```bat
comsolbatch -inputfile "..." -study std_flow -batchlog "..."
```

**LASTEXITCODE:** `___`

## Intent

<!-- One sentence: what this run was trying to achieve -->


## Pre-Run Checklist

- [ ] geometry-checklist (or N/A — reason)
- [ ] physics-checklist
- [ ] mesh-checklist

## Parameters Changed This Run

| Parameter | Old | New | Reason |
|-----------|-----|-----|--------|
| | | | |

## Outcome

| Item | Value |
|------|-------|
| Solver status | Done / Failed |
| Final residual | |
| Warnings | |
| DOF | |

## Field Spot-Check

| Check | Pass? | Note |
|-------|-------|------|
| ΔP > 0 | | |
| Velocity on fluid only | | |
| T plausible | | |

## Hypothesis / Debug Notes

<!-- If failed, what was tried; link to next log ID -->


## Validation Impact

- Previous status: 
- New status: 
- Requires re-validation: yes / no

## Artifacts

- Log file: `builders_logs/____________.log`
- Status file: 
- Screenshot (optional): 

---

## Sign-Off

**Reviewer:** _______________ **Date:** _______________

---

*Append multiple entries chronologically in project builders_logs/LOG_INDEX.md*
