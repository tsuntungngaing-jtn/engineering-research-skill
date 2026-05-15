# Mesh Checklist

**Complete before first production solve (or document exploratory coarse mesh).**

## Strategy

- [ ] Mesh type chosen (free tet / swept / boundary layer) and justified
- [ ] Finer mesh at fluid–solid interface
- [ ] Finer mesh at inlet and reentrant corners (if high ΔP region)
- [ ] Channel height H has ≥ ___ elements across (record number: ___)

## Size Control

- [ ] Global size level documented (e.g. `autoMeshSize(8)`)
- [ ] Local refinements named and scoped to selections
- [ ] Max element growth rate acceptable (< 5–10 typical target)

## Quality Metrics (post-build)

| Metric | Value | Threshold | Pass? |
|--------|-------|-----------|-------|
| Element count | | — | |
| Min element quality | | > 0.1 warn; > 0.3 preferred | |
| Max growth rate | | < 10 | |
| Degenerate elements | | 0 | |

- [ ] Low quality locations identified (geometry tag or coords)
- [ ] Honeycomb/fractal warnings documented if accepted

## Physics Resolution

- [ ] Mesh resolves boundary layer order-of-magnitude (laminar: height-based criterion stated)
- [ ] Thermal boundary layer: at least qualitative resolution at heated wall
- [ ] If CHT: mesh consistent on both sides of fluid–solid interface

## Mesh Independence (publication path)

- [ ] Baseline mesh solved
- [ ] Refined mesh (+30–50% elements or half max size) solved
- [ ] ΔP change: ___ %
- [ ] T_max change: ___ %
- [ ] Conclusion: independent / not yet independent

**If exploratory only:** mark `[MESH INDEPENDENCE NOT PERFORMED]` in validation report.

## Gate

| Result | Action |
|--------|--------|
| Quality OK, resolution stated | Proceed to solve |
| Widespread quality < 0.1 | Refine or fix geometry |
| Publication required & not independent | Plan refinement study |

**Reviewer:** _______________ **Date:** _______________
