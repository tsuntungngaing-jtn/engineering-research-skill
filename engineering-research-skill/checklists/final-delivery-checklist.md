# Final Delivery Checklist

**Complete before marking project done or pushing to `VERIFIED_USE_THESE/`.**

## Documentation

- [ ] `README.md` in project folder (English archive; L3)
- [ ] `session/SESSION_CONFIG.md` + `SESSION_LOG.md` (or written boot waiver)
- [ ] `evidence/EVIDENCE_LEDGER.md` (or Phase-0 waiver on file)
- [ ] `decisions/DECISION_LOG.md` (or Phase-0 waiver on file)
- [ ] `compare/COMPARE_LOG.md` if QoI or figure claims are shipped
- [ ] `references/LITERATURE_MANIFEST.md` if PDFs were fetched or supplied
- [ ] `PAPER_SPEC.md` archived
- [ ] `model_equation_audit.md` complete (sections 1–13, A/B/C/D grades) when equation audit is in scope
- [ ] `VALIDATION_REPORT.md` complete
- [ ] `replicate/REPLICATE_SCORECARD.md` if replication claimed
- [ ] `optimize/OPTIMIZE_RUN_LOG.md` if any `OPTIMIZED_` file shipped
- [ ] `prose_scrub/SCRUB_LOG.md` if narrative README/reports shipped (`academic-prose-gate` + `academic-prose-checklist.md`)
- [ ] Storage layout matches `templates/PROJECT_LAYOUT.md` / `workflows/project-storage.md`
- [ ] Coursework extras (if MFE209TC-like): mesh CSV cited; Pareto/preference-lock labeled **decision** not paper EXACT (`courseware/MFE209TC/README.md`)
- [ ] Superseded mph files listed with reason
- [ ] Primary files explicitly named ("use these first"); `REPLICATE_` vs `OPTIMIZED_` distinguished

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

- [ ] `session-boot-checklist.md` (or written boot waiver)
- [ ] `deep-search-checklist.md` (or Phase-0 waiver)
- [ ] `geometry-checklist.md`
- [ ] `physics-checklist.md`
- [ ] `mesh-checklist.md`
- [ ] `convergence-checklist.md`
- [ ] `model-equation-audit-checklist.md` (or root `model-equation-audit-checklist.md` if that layout is used)
- [ ] `compare-closed-loop-checklist.md` (if QoI/figure comparison claimed)
- [ ] `replicate-before-optimize-checklist.md` (if optimize shipped)
- [ ] `academic-prose-checklist.md` (if narrative shipped)

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
- [ ] Captions passed `academic-prose-gate` (no process / defensive essays)
- [ ] Fluid-only velocity plots verified
- [ ] Pixel-based claims labeled `digitized_estimate` (never as paper-reported)

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
