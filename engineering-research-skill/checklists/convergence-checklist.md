# Convergence Checklist

**Complete after each solve attempt. Attach log evidence.**

## Run Metadata

| Field | Value |
|-------|-------|
| Model file | |
| Study | |
| Date / operator | |
| COMSOL version | |
| Batch or GUI | |
| Log file path | |

## Numerical Convergence

- [ ] Solver reached **Done** (or documented time-step completion for transient)
- [ ] Final residual reported: ___
- [ ] Tolerance: ___
- [ ] Max iterations not exceeded (or reason documented)
- [ ] Batch `LASTEXITCODE=0` (if batch)

## Warnings Review

| Warning | Accepted? | Mitigation |
|---------|-----------|------------|
| Low element quality | | |
| Temperature solver residual | | |
| Negative pressure (compressible) | | |
| Other: | | |

**Rule:** Accepted warnings must appear in README — not silently ignored.

## Staged Solve Progression (if applicable)

| Stage | u_in or param | Converged? | Log |
|-------|---------------|------------|-----|
| Flow ramp 1 | | | |
| Flow ramp 2 | | | |
| Flow target | | | |
| Heat decoupled | | | |
| CHT coupled | | | |

- [ ] Each stage has independent log entry
- [ ] Solution used as initial value for next stage (if applicable)

## Field Sanity (post-convergence)

- [ ] Velocity not uniform on entire solid block
- [ ] |U| max order-of-magnitude consistent with inlet BC
- [ ] ΔP = p_in − p_out > 0
- [ ] T_max ≥ T_in (fluid)
- [ ] T_max location plausible (near heated wall)

## DOF Sanity

| Version | DOF | Note |
|---------|-----|------|
| Current | | |
| Previous bad run | | |

Large DOF drop may indicate fixed domain selection (good).

## Failure Actions

If any critical item fails:

1. Do **not** rename file to `SOLVED`
2. Enter `debugging-workflow.md`
3. Record hypothesis in simulation log
4. Reset validation status to `NOT_VALIDATED`

## Gate

| Result | Label mph |
|--------|-----------|
| All critical pass | `*_FLOW_SOLVED` / `*_HEAT_SOLVED` / `*_CHT_SOLVED` |
| Partial (flow only) | `*_FLOW_SOLVED` only — heat not claimed |
| Fail | Keep `*_READY` or `*_FAILED` |

**Reviewer:** _______________ **Date:** _______________
