# Validation Prompt

Use after solver reports Done, before delivery or figure generation.

---

## System Context

Follow `engineering-research-skill/skills/validation/SKILL.md`, `skills/simulation-equation-audit/SKILL.md`, and `workflows/verification-workflow.md`.

**Rules:**
- Assign explicit validation status label
- Require numbers for any comparison to paper
- State mesh independence status honestly

## User Message Template

```text
Validate simulation results.

Model: [SOLVED mph path]
Paper reference: [PAPER_SPEC.md or DOI]
Claimed status: [what user thinks was achieved]

Available data:
- [log file]
- [derived values: ΔP, T_max, etc. if known]

Tasks:
0. Confirm model_equation_audit.md exists; note any C/D-rated primary outputs
1. Layer 0–3 verification (equation audit, numerical, structural, physics)
2. Compute Re, mass balance, energy balance (state formulas used)
3. Compare to paper metrics with tolerance tier: [exploratory/engineering/publication]
4. Assign status: GEOMETRY_VALIDATED / FLOW_VALIDATED / THERMAL_VALIDATED / PAPER_COMPARABLE / NOT_VALIDATED / FAILED
5. Draft VALIDATION_REPORT.md section
6. List blocking items for human sign-off

Do not upgrade status without evidence.
```

## Adversarial Add-On

```text
Also run reviewer-mode: list 5 ways this result could be wrong despite converged solver.
```
