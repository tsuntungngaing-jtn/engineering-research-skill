# Geometry Checklist

**Complete before assigning physics or mesh.** Sign each item or mark N/A with reason.

## Paper Traceability

- [ ] `PAPER_SPEC.md` exists and is human-approved
- [ ] Every dimension in builder traces to CONFIRMED or INFERRED (labeled) source
- [ ] Topology matches target figure (sketch or SVG attached)
- [ ] Flow direction inlet → outlet documented

## Units & Scale

- [ ] COMSOL `lengthUnit` = mm (or consistent alternative documented)
- [ ] STEP import scale verified (bounding box O(1–50) mm for chip-scale)
- [ ] `Scale` node applied if CAD exported in meters
- [ ] Global parameters use unit syntax (`10[mm]`, `0.444[m/s]`)

## Fluid–Solid Topology

- [ ] Solid outer body defined
- [ ] All fluid channels in Union list (`uni_fluid`)
- [ ] `Difference`: solid − fluid; `keepsubtract` = true
- [ ] `geom.run()` completes without errors
- [ ] Fluid domain is connected from inlet to outlet
- [ ] No unintended voids or duplicate domains

## Ports & Features

- [ ] Inlet port extends beyond chip for BC face selection
- [ ] Outlet port extends beyond chip
- [ ] Channel width/height match paper (± stated tolerance)
- [ ] Heat source footprint matches heated area (e.g. 10×10 mm)

## Selections

- [ ] `bnd_inlet` Box selection on fluid inlet face
- [ ] `bnd_outlet` Box selection on fluid outlet face
- [ ] `bnd_heat` on bottom heated face (solid or interface per model)
- [ ] Selections use `intersects` condition; coordinates logged

## Export & Reproducibility

- [ ] Builder script saved (`Build*.java` or documented GUI steps)
- [ ] `*_COMSOL_READY.mph` saved
- [ ] STEP exported to `cad_solidworks_step/` (if applicable)
- [ ] `GEOMETRY_NOTES.md` lists deviations from paper figure

## SolidWorks (if used)

- [ ] Cavities are open grooves, not water-filled solids
- [ ] Assembly alignment reference documented
- [ ] STEP filename ASCII, no spaces

## Gate

| Result | Action |
|--------|--------|
| All critical items pass | Proceed to physics checklist |
| Scale or fluid domain fail | **STOP** — `comsol-debug` / geometry-reconstruction |
| Topology uncertain | Human review before solve |

**Reviewer:** _______________ **Date:** _______________
