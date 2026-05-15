---
name: scientific-figure
description: >-
  Generate Nature/IEEE-style scientific figures from COMSOL results: consistent
  colormaps, subplot layout, panel labels, caption hierarchy, and physics-forward
  visual claims. Avoid PPT-style saturated rainbows and undocumented color scales.
---

# Scientific Figure Skill

## Role

Turn validated simulation data into **publication-grade** figures where color encodes physics with defined limits—not decoration.

## Design Principles (Nature / IEEE lab standard)

1. **Claim-first** — Each figure answers one engineering question
2. **Consistent visual system** — Same colormap family across a paper series
3. **Calibrated color** — Colorbar min/max stated; symmetric diverging only when justified
4. **Readable at print size** — 85 mm (single column) or 180 mm (double) at 300 dpi
5. **No chartjunk** — No 3D extrusion, no heavy shadows, no default COMSOL rainbow without audit

## Figure Types for Thermal–Fluidics

| Panel | Variable | Recommended display |
|-------|----------|---------------------|
| A | Geometry / mesh | Outline or slice, neutral gray |
| B | Velocity | `spf.U` magnitude on fluid domains only |
| C | Temperature | `T` on fluid or cut plane through solid |
| D | Streamlines / arrows | Seed on inlet; limit density |
| E | Line plots | ΔP, T along centerline |
| F | Validation | Sim vs paper bar/parity plot |

## Colormap Rules

| Field | Recommended | Avoid |
|-------|-------------|-------|
| Temperature | Sequential: Viridis, Inferno, or COMSOL Thermal | Jet/rainbow as default |
| Velocity | Sequential, zero at inlet shade | Full-green saturation |
| Pressure | Diverging if ΔP small relative to mean | Unbounded autoscale hiding gradients |
| Mesh quality | Discrete bands | Continuous rainbow on bad cells |

**Always set manual color range** when comparing cases (same `T_min`, `T_max` across subplots).

## Layout Template (multi-panel)

```text
┌─────────────┬─────────────┐
│  (a) Geom   │  (b) Mesh   │
├─────────────┼─────────────┤
│  (c) |U|    │  (d) T      │
└─────────────┴─────────────┘
```

- Panel labels: **bold lowercase** `(a)`, `(b)` — top-left, 8–10 pt offset
- Shared colorbars where possible; otherwise annotate ranges in caption
- Scale bar or axis labels with units (mm, m/s, K)

## COMSOL Export Workflow

1. Hide solids in velocity plot (fluid-only)
2. Dataset: cut plane or surface on fluid domain
3. Export: PNG 300 dpi + source `.mph` plot group name logged
4. Post-process in Python/MATplotlib or Illustrator for final touch (optional)

## Caption Hierarchy

Use `templates/figure-caption-template.md`:

```text
Figure X. [One-sentence main claim]. (a) ... (b) ... 
Conditions: u_in = ..., q'' = ..., material = ....
Scale bars / color ranges stated.
```

## Anti-Patterns

| PPT style | Lab style |
|-----------|-----------|
| Neon rainbow, no colorbar | Colorbar + units + range |
| Velocity on solid block | Fluid domain mask |
| Screenshot with UI chrome | Cropped export |
| "Pretty" without ΔP number | Panel (e) quantifies claim |

## Agent Behavior

When asked to "make figures":

1. Confirm validation status ≥ `FLOW_VALIDATED`
2. List which plot groups / datasets to export
3. Propose layout sketch (ASCII or panel list)
4. Draft caption with conditions and uncertainty
5. Do not fabricate figure files—if export not run, say **"caption and layout spec only"**

## Tools

- COMSOL Results → Export Image
- Python: matplotlib + cmocean/viridis
- SVG topology: paper figure tracing (e.g. Tan Fig.2 JS/SVG pipeline)
