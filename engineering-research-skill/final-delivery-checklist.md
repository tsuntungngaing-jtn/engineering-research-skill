# Final Delivery Checklist

**Complete before marking project done or pushing to `VERIFIED_USE_THESE/`.**

## Documentation

- [ ] `README.md` / `README_使用说明.md` in project folder
- [ ] `PAPER_SPEC.md` archived
- [ ] `model_equation_audit.md` complete (sections 1–13, A/B/C/D grades)
- [ ] `VALIDATION_REPORT.md` complete
- [ ] Superseded mph files listed with reason
- [ ] Primary files explicitly named ("use these first")

## Source & Reproducibility

- [ ] Builder script in `builders_logs/` (`.java`, `.m`, or GUI recipe)
- [ ] Build command documented
- [ ] Solve command documented (`comsolbatch` study name)
- [ ] COMSOL version recorded

## Model Files

| File | Required | Present |
|------|----------|---------|
| `*_COMSOL_READY.mph` | Yes | |
| `*_FLOW_SOLVED.mph` | If flow claimed | |
| `*_HEAT_SOLVED.mph` | If thermal claimed | |
| `*_CHT_SOLVED.mph` | If CHT claimed | |
| STEP geometry | If CAD path | |

- [ ] Files in `VERIFIED_USE_THESE/` are current best versions
- [ ] No `.lock` files without README warning
- [ ] `.status` / stdout logs paired with SOLVED files

## Checklists Completed

- [ ] `geometry-checklist.md`
- [ ] `physics-checklist.md`
- [ ] `mesh-checklist.md`
- [ ] `convergence-checklist.md`
- [ ] `model-equation-audit-checklist.md`

## Validation Status

| Study | Status |
|-------|--------|
| Geometry | |
| Flow | |
| Thermal | |
| Paper comparable | |

- [ ] Status labels match `validation` skill definitions
- [ ] Limitations section lists known gaps
- [ ] No claim of publication readiness without human sign-off

## Results Package

Required derived quantities (as applicable):

- [ ] Pressure drop ΔP (Pa or kPa)
- [ ] T_max, T_avg, T_out − T_in
- [ ] Velocity field summary (U_max, profile note)
- [ ] Re, ṁ balance
- [ ] Mesh stats (elements, min quality)
- [ ] Convergence summary

## Figures (if delivered)

- [ ] 300 dpi or vector export
- [ ] Colorbar ranges documented
- [ ] Captions use `figure-caption-template.md`
- [ ] Fluid-only velocity plots verified

## Human Sign-Off

```text
I confirm this delivery package is acceptable for its stated purpose: ___________

Reviewer: _______________  Date: _______________
Role: PI / engineer / self-review
```

## Prohibited Close-Out

Do **not** close project if:

- [ ] SOLVED label without log evidence
- [ ] Validation status is `NOT_VALIDATED` but README implies success
- [ ] Critical geometry/BC items unchecked

## Archive Location

- [ ] Copied to lab archive path: _______________
- [ ] Git commit / tag (if versioned): _______________
