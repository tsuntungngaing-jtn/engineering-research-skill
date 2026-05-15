# Simulation Result Report

**Project ID:** `________________`  
**Date:** `________________`  
**Author:** `________________`  
**Validation Status:** `NOT_VALIDATED | FLOW_VALIDATED | THERMAL_VALIDATED | PAPER_COMPARABLE | FAILED`

---

## 1. Executive Summary

<!-- 3 sentences max: objective, main numerical result, validation status -->

---

## 2. Reference & Objective

| Field | Value |
|-------|-------|
| Paper | |
| DOI | |
| Target figure / claim | |
| Fidelity tier | exploratory / engineering / publication |
| PAPER_SPEC version | |

**Objective:**


---

## 3. Model Summary

### 3.1 Geometry

| Parameter | Value | Unit | Source |
|-----------|-------|------|--------|
| | | | |

**Deviations from paper:**


### 3.2 Materials

| Domain | Material | Properties |
|--------|----------|------------|
| Fluid | | |
| Solid | | |

### 3.3 Physics

| Interface | Settings |
|-----------|----------|
| spf | |
| ht | |
| nitf1 | |

### 3.4 Boundary Conditions

| BC | Value | Face / selection |
|----|-------|------------------|
| Inlet velocity | | |
| Inlet temperature | | |
| Outlet pressure | | |
| Heat flux | | |

### 3.5 Mesh

| Metric | Value |
|--------|-------|
| Elements | |
| Min quality | |
| Mesh independence | performed / not performed |

### 3.6 Solver

| Study | Status | Log |
|-------|--------|-----|
| std_flow | | |
| std_heat | | |

---

## 4. Results

### 4.1 Hydrodynamic

| Quantity | Value | Unit |
|----------|-------|------|
| ΔP | | Pa |
| U_max | | m/s |
| Re_in | | — |
| ṁ balance error | | % |

### 4.2 Thermal

| Quantity | Value | Unit |
|----------|-------|------|
| T_max | | K |
| T_out − T_in | | K |
| Q_flux applied | | W/cm² |

### 4.3 Comparison to Paper

| Metric | Paper | Simulation | Δ% | Within tolerance? |
|--------|-------|------------|-----|-------------------|
| | | | | |

---

## 5. Figures

| Figure | File | Panel description |
|--------|------|-------------------|
| Fig. 1 | | |

---

## 6. Assumptions & Limitations

- 
- 

## 7. Uncertainty

- Numerical: 
- Modeling: 
- Experimental comparison gap: 

---

## 8. Reproduction

```bash
# Build
# Solve
# Export
```

**Files:**
- Builder: 
- READY: 
- SOLVED: 

---

## 9. Human Sign-Off

| Role | Name | Date | Accept status |
|------|------|------|---------------|
| Engineer | | | |
| PI (optional) | | | |

**Statement:** I have reviewed domain assignments, BCs, and validation evidence for the stated purpose.

---

*Generated per engineering-research-skill/templates/result-report-template.md*
