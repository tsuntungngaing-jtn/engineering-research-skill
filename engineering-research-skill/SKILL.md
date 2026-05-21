---
name: validation
description: >-
  Physics validation for COMSOL microfluidic thermal simulations: Reynolds and
  Peclet checks, energy balance, comparison to reference paper, mesh sanity,
  and explicit validation status reporting. Use after solve and before delivery.
  Human must sign off on VALIDATED or NOT VALIDATED status.
---

# Validation Skill

## Role

Determine whether simulation results are **physically credible** and **comparable** to the reference paper—not merely whether the solver finished.

**Prerequisite:** Complete `simulation-equation-audit` (`model_equation_audit.md`) with output reliability grades. Do not assign `PAPER_COMPARABLE` if primary metrics are graded **C** or **D**.

## Validation Status Labels

Use exactly one per study:

| Status | Meaning |
|--------|---------|
| `GEOMETRY_VALIDATED` | Build matches spec; connectivity checked |
| `FLOW_VALIDATED` | Inlet/outlet mass balance; Re regime; no stagnant false fluid |
| `THERMAL_VALIDATED` | Energy sensible; T field plausible; heat path correct |
| `PAPER_COMPARABLE` | Quantitative metrics within stated tolerance vs paper |
| `NOT_VALIDATED` | Missing data, failed checks, or qualitative only |
| `FAILED` | Solver or physics check failed |

**Never** use `VALIDATED` without listing which checks passed.

## Mandatory Physics Checks

### 1. Dimensionless numbers

Compute and report:

```text
Re = ρ u L / μ        (channel or hydraulic diameter)
Pe = ρ cp u L / k     (if thermal advection matters)
```

State laminar/turbulent assumption vs Re.

### 2. Mass balance

```text
|ṁ_in − ṁ_out| / ṁ_in < 1%  (steady, incompressible)
```

If unmet → BC or domain leak; not a plotting issue.

### 3. Energy balance (CHT)

```text
Q_flux ≈ ṁ cp (T_out − T_in) + losses
```

Document if adiabatic external walls assumed.

### 4. Temperature sanity

- T ≥ T_in on fluid path (except expansion work negligible cases—justify)
- T_max location consistent with heat input face
- No unphysical spikes at reentrant corners without mesh refinement note

### 5. Pressure

- ΔP > 0 for flow from inlet to outlet
- Order-of-magnitude vs paper (factor 2–5 may be mesh/BC; factor 100+ → investigate)

## Comparison to Paper

| Metric | Paper value | Simulation | Δ% | Acceptable? |
|--------|-------------|------------|-----|-------------|
| ΔP | | | | |
| T_max or T_avg | | | | |
| Nu or h | | | | |

Tolerance must be stated (e.g. "topology replication only, ±30% expected").

## Mesh Validation

Minimum for publication path:

- Report element count, min quality, max growth rate
- One refinement step: ΔP or T_max change < X% (user-defined, typically 5–10%)

For exploratory replication, document **"mesh-independent study not performed"**.

## Evidence Package

Include in validation report:

1. Solver log excerpt (final residual or "Done")
2. `.mph.status` or batch stdout with `LASTEXITCODE=0`
3. Derived quantities table (not screenshots alone)
4. Assumptions and known deviations from paper

## Human Sign-Off Block

```markdown
## Human Physics Sign-Off
- [ ] I reviewed domain assignments and BCs
- [ ] I accept validation status: ___________
- Reviewer: ___________  Date: ___________
```

## Downstream

- `skills/simulation-equation-audit/SKILL.md`
- `verification-workflow.md`
- `checklists/physics-checklist.md`
- `checklists/model-equation-audit-checklist.md`
- `prompts/validation-prompt.md`
- `prompts/reviewer-mode-prompt.md`

## Prohibited

- "Matches paper well" without numbers
- Cherry-picking best-case flow rate
- Hiding solver warnings that affect temperature DOFs
