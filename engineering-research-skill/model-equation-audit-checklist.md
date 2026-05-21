# Model Equation Audit Checklist

**Use before solve, after solve, and before delivery.**  
**Skill:** `simulation-equation-audit`  
**Output:** `model_equation_audit.md`

---

## Problem Definition

- [ ] Controlled inputs listed
- [ ] Unknown outputs listed
- [ ] Purpose stated (trend / quantitative / design / debug)
- [ ] Not reduced to "simulation completed"

## Coordinates and DOF

- [ ] Global axes defined
- [ ] Local frames defined with origins
- [ ] Rotation axis direction and center verified
- [ ] Angle sign convention documented
- [ ] Allowed DOF matches experiment or device

## Parameters and Units

- [ ] Geometry table complete with units
- [ ] Material table complete with units
- [ ] mm/m and deg/rad consistency checked
- [ ] All domains have materials assigned
- [ ] No silent default material values

## Equations and Implementation

- [ ] Governing equations written in math form
- [ ] Model type classified (FEM / analytical / empirical / hybrid)
- [ ] Math ↔ software mapping table filled
- [ ] Direct-solve vs post-process variables distinguished

## IC, BC, Post-processing

- [ ] Initial conditions documented
- [ ] Boundary conditions traceable to spec or paper
- [ ] Post-processing formulas with frame and unit
- [ ] No global/local component confusion

## Scans and Numerics

- [ ] Scan variables, range, step documented (if applicable)
- [ ] Scan meaning stated (imposed vs candidate vs optimization)
- [ ] Interpolation range documented; extrapolation flagged
- [ ] Solver warnings reviewed and linked to logs
- [ ] Convergence status recorded

## Outputs and Judgment

- [ ] Every output file graded A/B/C/D
- [ ] No **A** where extrapolation, warnings, or frame errors exist
- [ ] Assumptions and limitations listed
- [ ] Final judgment: yes / partially / no
- [ ] Human sign-off block ready

---

**Quick fail — stop and fix before claiming trust:**

- Unit mismatch (e.g. mm imported as m)
- Missing fluid/solid domain assignment
- Extrapolation in post-processing without disclaimer
- Torque/force computed in wrong coordinate frame
- Parameter scan treated as measured trajectory without justification
