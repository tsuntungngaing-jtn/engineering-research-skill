---
name: paper-analysis
description: >-
  Extract geometry, dimensions, boundary conditions, materials, and physics
  assumptions from reference papers for COMSOL/SolidWorks microfluidic thermal
  simulation. Use when starting a new paper replication, auditing parameters,
  or before any CAD/COMSOL build. Requires human sign-off on extracted table.
---

# Paper Analysis Skill

## Role

Transform a reference paper into a **traceable simulation specification**. Output is a parameter table with citations—not a model.

## When to Use

- User provides a PDF, DOI, or paper name for replication
- Before writing `Build*.java`, MATLAB, or SolidWorks macros
- When simulation results disagree with paper and parameters must be re-audited

## Human-in-the-Loop Gate

**STOP** after producing the extraction table. Request human confirmation:

> "Please confirm geometry dimensions, BCs, and material properties marked [INFERRED] before I build geometry."

Do not proceed to CAD/COMSOL until confirmed or explicitly waived by the user.

## Extraction Protocol

### 1. Source hierarchy (use in order)

1. Paper **tables** (dimensions, operating conditions)
2. Paper **figure captions** (topology, flow direction)
3. Paper **methods / CFD setup** section (BCs, mesh, solver)
4. Supplementary material
5. **[INFERRED]** — only with explicit label and reasoning

Never copy numbers from memory. Read project PDF text (e.g. `paper_text.txt`) or fetch the paper.

### 2. Required extraction categories

| Category | Fields |
|----------|--------|
| **Geometry** | Footprint, channel W/H, manifold dims, fin pitch, layer stack, inlet/outlet area |
| **Materials** | Solid (Si, Al 6063, Cu), fluid (water/DI), T-dependent properties yes/no |
| **Physics** | Laminar/turbulent, steady/transient, CHT yes/no, compressibility |
| **Boundary conditions** | Inlet u or ṁ, T_in, outlet p, wall heat flux or T, symmetry/adiabatic |
| **Operating point** | Re, Pe, heat flux (W/cm²), flow rate (L/min or mL/min) |
| **Validation targets** | ΔP, T_max, T_uniformity, Nu, h, COP, figures to match |

### 3. Output format

Produce `PAPER_SPEC.md` (or inline table):

```markdown
## Paper: [Authors, Journal, Year, DOI]

### Geometry (source: Table X / Fig. Y)
| Parameter | Value | Unit | Source | Status |
|-----------|-------|------|--------|--------|
| chip_L    | 10    | mm   | Sec 2.1 | CONFIRMED |

### Boundary Conditions
| BC | Expression | Source | Status |
|----|------------|--------|--------|

### Physics Assumptions
- [ ] Steady laminar flow (Re_in = ___ → justify)
- [ ] Single-phase water
- [ ] Negligible ambient losses (if stated)

### Open Questions for Human
1. ...
```

### 4. Anti-hallucination rules

- If a value is not in the paper, write `[NOT IN PAPER]` or `[INFERRED: reason]`
- Do not invent mesh size, solver tolerance, or convergence criteria
- Distinguish **experimental** vs **simulation** conditions in the paper
- Flag unit ambiguities (μm vs mm; W/cm² vs W/m²)

### 5. Cross-checks before handoff

- [ ] All lengths use one CAD unit system (recommend **mm** for microchannels)
- [ ] Inlet area consistent with stated velocity and volumetric flow rate
- [ ] Heat flux area matches heated footprint in figures
- [ ] Material properties match temperature range in paper

## Downstream Handoff

Pass confirmed `PAPER_SPEC.md` to:

- `geometry-reconstruction` — build CAD/COMSOL
- `workflows/paper-to-simulation.md` — full pipeline

## Reference Prompt

See `prompts/paper-analysis-prompt.md`.
