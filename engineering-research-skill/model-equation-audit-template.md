# Model Equation Audit

**Audit ID:** `AUDIT-YYYYMMDD-###`  
**Model / study:** `________________`  
**Toolchain:** COMSOL | Mathematica | MATLAB | Python | Fluent | Ansys | SolidWorks Motion | other  
**Operator:** `________________`  
**Last updated:** `________________`

---

## 1. Research Question

**Controlled input:**

- ...

**Unknown output:**

- ...

**Purpose:**

- [ ] trend judgment
- [ ] quantitative prediction
- [ ] visualization
- [ ] parameter screening
- [ ] final engineering design basis

**Current model status:** preliminary | validated | final | debug only

**What question does this model answer?**

<!-- One paragraph — not "simulation completed" -->


---

## 2. Coordinate System and DOF

### Global frame

| Axis | Direction / definition |
|------|-------------------------|
| X | |
| Y | |
| Z | |

### Local frame(s)

| Frame | x | y | z | Origin |
|-------|---|---|---|--------|
| local_1 | | | | |
| local_2 | | | | |

**Reference point / origin:** ...

**Rotation / translation axis:** direction = ... ; passes through correct center? yes / no

**Allowed DOF:** translation / rotation / 1-DOF / rigid unconstrained / unknown

**Coordinate risks:**

- ...

---

## 3. Geometry and Material Parameters

### Geometry

| Parameter | Value | Unit | Source |
|-----------|------:|------|--------|
| length | | | |
| width | | | |
| height | | | |
| radius | | | |
| thickness | | | |
| center | | | |

### Material

| Parameter | Value | Unit | Source |
|-----------|------:|------|--------|
| density | | | |
| Young's modulus | | | |
| viscosity | | | |
| thermal conductivity | | | |
| magnetic remanence Br | | | |
| relative permeability μr | | | |

**Unit consistency:** pass / warning / fail

**Unit risk notes:** mm vs m, degree vs radian, mixed SI, CAD import scale

---

## 4. Physical Model

**Model type:** FEM | analytical | reduced-order | point-source | empirical | hybrid

**Governing equations:**

<!-- Write math, not only software interface names -->

- Fluid: ...
- Heat: ...
- Magnetics: ...
- Solid mechanics: ...
- Dynamics: ...

**Assumptions:**

- ...

**Neglected effects:**

- ...

**Validity range:**

- ...

---

## 5. Software Implementation Mapping

| Mathematical item | Software location | Variable name | Direct solve or post-processing |
|-------------------|-------------------|---------------|--------------------------------|
| | | | |

### COMSOL (if applicable)

- Physics interface: ...
- Domains included: ...
- Boundary conditions: ...
- Exported variables: ...

### Scripts (if applicable)

| File | Key functions | Inputs | Outputs |
|------|---------------|--------|---------|
| | | | |

**Mapping risks:** equation correct but not implemented in software

---

## 6. Initial and Boundary Conditions

**Initial conditions:**

| Quantity | Value | Unit | Frame |
|----------|------:|------|-------|
| position | | | |
| velocity | | | |
| angle | | | |
| temperature | | | |
| pressure | | | |
| magnetic orientation | | | |

**Boundary conditions:**

| Boundary | Type | Value | Paper / spec source |
|----------|------|-------|---------------------|
| | fixed / inlet / symmetry / ... | | |

**Constraint conditions:** ...

**Potential risks:** swapped inlet/outlet, default BC, wrong domain type

---

## 7. Post-processing Equations

| Quantity | Formula | Coordinate frame | Unit | Validity / notes |
|----------|---------|------------------|------|------------------|
| force | | global / local | | |
| torque | | global / local | | |
| pressure drop | | | | |
| average T | | | | |
| efficiency | | | | |
| Nu, Re | | | | |

**Warning:** Global components must not be interpreted as local-axis components unless transformed.

---

## 8. Parameter Scan / Optimization

| Variable | Min | Max | Step | Unit | Meaning |
|----------|-----|-----|------|------|---------|
| | | | | | imposed / candidate pose / trajectory / optimization |

**Scan interpretation:** ...

**Periodicity (0° = 360°):** handled / not handled / N/A

**Scan risks:** static scan ≠ dynamics; candidate pose ≠ real motion

---

## 9. Numerical Method and Stability

**Solver:** FindRoot / NDSolve / FEM / optimization / other

**Mesh (if FEM):** element count, min quality, refinement note

**Interpolation:**

- Range: ...
- Extrapolation disabled? yes / no

**Warnings (from logs):**

- ...

**Convergence:** pass / warning / fail

**Out-of-range values:** none / detected (list)

**result_status:** reliable | trend-only | debug-only | invalid

---

## 10. Output Reliability

| Output file | Content | Reliability | Reason |
|-------------|---------|-------------|--------|
| | | A / B / C / D | |

**Scale:** A = quantitative conclusion | B = trend | C = debug | D = invalid / rerun

---

## 11. Assumptions and Limitations

- ...
- ...

*(Optional CSV: `model_assumption_table.csv`)*

---

## 12. Validation Checklist

- [ ] Coordinate axes verified
- [ ] Local/global frame transformation verified
- [ ] Units verified
- [ ] Material domains assigned
- [ ] Boundary conditions verified
- [ ] Initial conditions verified
- [ ] Solver warnings checked
- [ ] No interpolation extrapolation (or flagged)
- [ ] Output variables within valid range
- [ ] Post-processing formulas checked
- [ ] Simplified model compared with FEM or experiment (if applicable)
- [ ] Result reliability classified

---

## 13. Final Judgment

**Current model conclusion:**

- ...

**Can the result be trusted?** yes / partially / no

**Usable for:**

- [ ] trend observation
- [ ] debugging
- [ ] report figure (with disclaimer)
- [ ] quantitative prediction
- [ ] design decision

**Next required fix:**

- ...

---

## Human Equation Audit Sign-Off

- [ ] I verified coordinate frames and DOF
- [ ] I verified math ↔ software mapping for critical outputs
- [ ] I accept reliability grades: ___________
- **Reviewer:** ___________ **Date:** ___________
