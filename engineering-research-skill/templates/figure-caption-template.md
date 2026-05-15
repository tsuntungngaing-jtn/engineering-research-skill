# Figure Caption Template

**Nature / IEEE laboratory style — claim-first captions.**

---

## Structure

```text
Figure [N]. [Main claim in one sentence ending with period]
(a) [Panel a content]. (b) [Panel b content]. (c) [Panel c content].
[Simulation conditions sentence.]
[Color scale / scale bar sentence.]
[Uncertainty or validation caveat if needed.]
```

---

## Example — Multi-panel COMSOL

```text
Figure 3. Lateral-veiny microchannel heat sink exhibits lower peak temperature than parallel-channel baseline under matched inlet conditions.
(a) Computational fluid domain (gray) and 6063-Al solid (outline). (b) Mesh on symmetry plane (min quality 0.21). (c) Steady-state velocity magnitude |U| on fluid domains. (d) Fluid temperature T at mid-channel height.
Simulations: water at T_in = 293.15 K, u_in = 0.444 m/s (0.1 L/min equivalent), q'' = 100 W/cm² on 10 mm × 10 mm heated footprint; laminar flow (Re ≈ ___).
Color ranges: |U| = 0–0.5 m/s; T = 293–330 K (identical across panels c–d for comparison).
Validation status: FLOW_VALIDATED, THERMAL_VALIDATED; not mesh-independent (see Supplementary Note S1).
```

---

## Panel Label Rules

| Rule | Specification |
|------|---------------|
| Label format | **(a)**, **(b)** — bold lowercase, parentheses |
| Position | Top-left of panel, 8–10 pt inset |
| Order | Left→right, top→bottom |
| Geometry first | Layout or mesh before fields |

---

## Colorbar Sentence Templates

**Sequential (T, |U|):**
```text
Color scale indicates [variable] in [units], ranging from [min] to [max].
```

**Comparison across cases:**
```text
Identical color limits ([min]–[max] [units]) used for (c) and (d) to enable direct comparison.
```

**Diverging (ΔP, deviation):**
```text
Diverging scale centered at [reference]; blue/red indicate below/above [reference].
```

---

## Conditions Block (required)

Always include:

- Fluid and T_in
- Inlet velocity or ṁ
- Heat flux or wall T
- Solid material
- Steady / transient
- Re or flow regime if non-obvious

---

## Caveat Block (when applicable)

```text
Note: Results from decoupled flow/heat studies; full CHT not performed.
```

```text
Note: Topology replicated from Fig. 2(b); quantitative ΔP comparison not claimed.
```

---

## Anti-Patterns

| Avoid | Use instead |
|-------|-------------|
| "Simulation results." | State the engineering finding |
| Rainbow without range | State min/max and units |
| "COMSOL screenshot" | Name the physical variable |
| Marketing adjectives | Numbers and conditions |

---

## Subfigure File Naming

```text
Fig<N><letter>_<variable>_<case>.png
Example: Fig3d_T_lateral_veiny_v2.png
```

---

*engineering-research-skill/templates/figure-caption-template.md*
