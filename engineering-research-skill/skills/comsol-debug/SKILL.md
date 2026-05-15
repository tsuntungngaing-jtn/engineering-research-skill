---
name: comsol-debug
description: >-
  Diagnose COMSOL geometry, material, boundary, mesh, and solver failures for
  microfluidic CHT models. Use when studies fail to converge, velocity plots are
  uniform green, temperature is non-physical, or batch logs show errors. Never
  claim fix without re-run evidence.
---

# COMSOL Debug Skill

## Role

Systematic root-cause analysis for multiphysics simulation failures. **Diagnose before patching.**

## Triage Order (always follow)

```
1. Geometry / domain topology
2. Unit scale & coordinate system
3. Material assignment (fluid vs solid)
4. Boundary conditions & selection scope
5. Mesh quality & resolution
6. Solver sequence & coupling strategy
```

Do not jump to solver tweaks if fluid is solved on solid domains.

## Symptom → Likely Cause Matrix

| Symptom | First checks |
|---------|----------------|
| Velocity field all one color on entire block | `spf` selection includes solid; STEP scale wrong |
| "Material property k missing" | `ht` on wrong domain; solid/fluid split incomplete |
| Max Newton iterations | Coupled CHT at high u_in; bad initial guess; duplicate studies (sol2/s1) |
| Pressure singular / zero flow | Disconnected fluid; blocked topology; outlet not on fluid |
| T below T_in or >> boiling | BC sign error; heat flux on wrong face; unit W/cm² vs W/m² |
| Low element quality warning | Sharp hex corners; honeycomb intersections — may still solve; document |
| GUI reopen triggers old solver | Split flow/heat mph; rebuild study from READY file |

## Scale Failure Mode (critical)

Imported CAD at **meter** coordinates in a **mm** model produces Re, mesh, and BC areas wrong by 10³–10⁶.

**Fix pattern:**

```text
Geometry → Scale → factor = 0.001  (if CAD was meters, target mm)
Rebuild → reassign all selections
```

Verify: bounding box ~ O(10) mm not O(10³) mm.

## Fluid Domain Verification

1. `spf` → Domain selection must be **only** fluid (`geom1_uni_fluid_dom` or equivalent)
2. Water material on same domain set
3. Plot geometry with "show remaining domains" after Difference
4. Expected DOF: drop from ~10⁷ to ~10⁵–10⁶ after fix (order-of-magnitude check)

## Solver Strategy (robust CHT)

Do **not** start full coupled steady at target `u_in`.

```text
Stage A: spf only, u_in = 0.05 → 0.1 → 0.2 → target (continuation)
Stage B: ht only with frozen flow OR one-way coupling
Stage C: NonIsothermalFlow / fully coupled (optional, paper-grade)
```

Separate studies:

- `std_flow` — solve spf, disable ht
- `std_heat_stable` — solve ht, disable spf

Prevents GUI from chaining broken `sol2` sequences.

## Log Analysis Requirements

When user provides `.log` / stdout:

- Quote exact error line
- State study name and last converged step
- Report `LASTEXITCODE` for batch runs
- If no log exists, state: **"Convergence not verified — no log provided"**

## Patch Discipline

1. One hypothesis per patch
2. Save new file suffix: `_PATCH_<issue>_<date>.mph`
3. Re-run batch; attach new log
4. Update README if superseding old SOLVED file

## Prohibited

- "Should converge now" without running solver
- Deleting warnings from log summary
- Increasing tolerance to force "converged" with high residual
- Presenting rainbow plot as success

## Checklists & Workflows

- `checklists/convergence-checklist.md`
- `workflows/debugging-workflow.md`
- `prompts/comsol-debug-prompt.md`

## Escalation to Human

Escalate when:

- Topology intentionally differs from paper (blocked transition loops, etc.)
- Need experimental data not in paper
- Mesh-independent study required for publication
