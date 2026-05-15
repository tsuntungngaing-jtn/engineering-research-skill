---
name: geometry-reconstruction
description: >-
  Build SolidWorks/COMSOL geometry from confirmed paper specifications using
  parametric blocks, Union/Difference fluid domains, and STEP export. Use for
  microchannel heat sinks, MMC manifold layouts, and bio-inspired channel
  topologies. Requires completed paper-analysis with human sign-off.
---

# Geometry Reconstruction Skill

## Role

Convert **confirmed** `PAPER_SPEC.md` into reproducible 3D geometry: COMSOL Java API builders, COMSOL native features, or SolidWorks → STEP import.

## Prerequisites

- [ ] `paper-analysis` table human-approved
- [ ] Unit system fixed (default: **mm** in COMSOL `lengthUnit`)
- [ ] Topology diagram or Fig. 2 sketch available

## Architecture Pattern (COMSOL Java)

Standard builder structure used in validated projects:

```
params() → geometry() → selections() → materials() → physicsStudies() → save/export
```

### Fluid–solid separation (mandatory)

```
1. solid_outer (Block or imported STEP)
2. fluid channels (Blocks / swept segments / Union)
3. uni_fluid = Union(all fluid features); intbnd=false
4. dif_solid = Difference(solid_outer, uni_fluid); keepsubtract=true
5. geom.run()
```

**Never** assign `spf` to the entire imported STEP without carving fluid domain.

### STEP import path

If using SolidWorks export:

1. Verify coordinate system and scale in COMSOL (watch **m vs mm** — apply `Scale` factor 0.001 if needed)
2. Form Union / Compose; build all
3. Create fluid envelope − solid = water domain
4. Run `mphgeominfo(model,'geom1')` or GUI to list domain IDs

## SolidWorks Guidelines

- Export **open cavity** parts (grooves), not water-filled solids
- Prefer single assembly STEP with aligned inlet/outlet ports
- Name reference points for valve/MMC junction alignment
- File names: ASCII, no spaces (`Tan2019_Fig2_b_lateral_veiny.STEP`)

## Parametric Topology (bio-inspired channels)

Represent each channel segment as `(x1,y1,x2,y2,width)`:

- Main collector: high width (~0.45 mm for Tan 10 mm chip)
- Branch segments: rotate Block about Z at segment midpoint
- Honeycomb/spider: deduplicate edges with coordinate keys

Export paired artifacts:

- `*_COMSOL_READY.mph`
- `*_SolidWorks_geometry.STEP`

## Selection Sets (build with geometry)

Create **Box** selections for robust BC assignment:

| Selection | Typical use |
|-----------|-------------|
| `bnd_inlet` | Velocity + inlet temperature |
| `bnd_outlet` | Pressure outlet + outlet thermal BC |
| `bnd_heat` | Bottom heat flux (chip footprint) |

Prefer named selections over raw boundary IDs (IDs change after rebuild).

## Pre-Build Checklist

Run `checklists/geometry-checklist.md` before `physicsStudies()`.

## Anti-Patterns

| Wrong | Right |
|-------|-------|
| Fluid domain = whole import | Explicit fluid union − solid |
| Mix μm literals with mm unit | Single unit + param expressions |
| Skip port inlet/outlet blocks | Extend ports beyond chip for BC faces |
| Copy domain IDs from another model | Re-query after every `geom.run()` |

## Deliverables

- Builder source: `Build<Paper>*.java` or documented GUI steps
- `*_GEOMETRY_READY.mph` or `*_COMSOL_READY.mph`
- STEP in `cad_solidworks_step/`
- Short `GEOMETRY_NOTES.md`: assumptions, topology deltas from paper figure

## Downstream

- `simulation-workflow.md` — physics and mesh
- `comsol-debug` — if `geom.run()` fails or voids appear
