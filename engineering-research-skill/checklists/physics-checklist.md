# Physics Checklist

**Complete before running any study.**

## Materials

### Fluid (water / coolant)

- [ ] Assigned only to fluid domain selection
- [ ] ρ, μ, Cp, k values documented with temperature
- [ ] T-dependent properties enabled if CHT / large ΔT
- [ ] `spf` uses consistent ρ, μ (userdef or from material)

### Solid (Si / Al / Cu)

- [ ] Assigned only to solid domain selection
- [ ] k, ρ, Cp match paper or handbook reference
- [ ] No fluid material on solid domains

## Physics Interfaces

| Interface | Active | Domain selection | Pass? |
|-----------|--------|------------------|-------|
| `spf` Laminar Flow | | Fluid only | |
| `ht` Heat Transfer | | Fluid + solid as intended | |
| `nitf1` Non-Isothermal | | If used | |

- [ ] **spf NOT on solid domains**
- [ ] Weakly compressible / pseudo-time settings documented (if used)
- [ ] Turbulence off for laminar Re (or model justified)

## Boundary Conditions

| BC | Location | Value | Paper source |
|----|----------|-------|--------------|
| Inlet velocity | bnd_inlet | | |
| Outlet pressure | bnd_outlet | 0 Pa gauge | |
| Inlet temperature | bnd_inlet | | |
| Heat flux / T | bnd_heat | | |
| Outer walls | | Adiabatic / symmetry | |

- [ ] Heat flux units verified (W/cm² vs W/m²)
- [ ] Inlet area matches velocity ↔ volumetric flow relation
- [ ] No conflicting BC on same boundary

## Dimensionless Pre-Check

| Quantity | Value | Assumption |
|----------|-------|------------|
| Re_in | | Laminar / turbulent |
| Re_channel | | |
| Pe (if thermal) | | |

- [ ] Regime consistent with paper CFD setup

## Studies

- [ ] `std_flow` solves spf only (ht off) if using staged approach
- [ ] `std_heat_stable` solves ht only if staged
- [ ] No orphan solver sequences from old mph (sol2/s1 issue checked)

## Initial Values

- [ ] T_init = T_in (or justified)
- [ ] Velocity initial guess reasonable for high Re start

## Gate

| Result | Action |
|--------|--------|
| All BCs traceable + fluid-only spf | Proceed to mesh / solve |
| Material on wrong domain | **STOP** — fix before solve |
| Re contradicts turbulence model | Fix physics setup |

**Reviewer:** _______________ **Date:** _______________
