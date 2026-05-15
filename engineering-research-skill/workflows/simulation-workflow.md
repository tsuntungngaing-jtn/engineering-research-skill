# Simulation Workflow

**Stage-gate process for paper-driven COMSOL multiphysics simulation.**

## Overview

```mermaid
flowchart TD
  S0[Stage 0: Paper Analysis] --> G0{Human approves PAPER_SPEC?}
  G0 -->|No| S0
  G0 -->|Yes| S1[Stage 1: Geometry]
  S1 --> G1{Geometry checklist pass?}
  G1 -->|No| S1
  G1 -->|Yes| S2[Stage 2: Physics & Materials]
  S2 --> G2{Physics checklist pass?}
  G2 -->|No| S2
  G2 -->|Yes| S3[Stage 3: Mesh]
  S3 --> S4[Stage 4: Solve - staged]
  S4 --> G3{Converged with log?}
  G3 -->|No| DBG[Debug Workflow]
  DBG --> S4
  G3 -->|Yes| S5[Stage 5: Validation]
  S5 --> G4{Validation pass?}
  G4 -->|No| S4
  G4 -->|Yes| S6[Stage 6: Figures & Delivery]
```

## Stage 0 — Paper Analysis

**Skill:** `paper-analysis`  
**Output:** `PAPER_SPEC.md`  
**Gate:** Human confirms dimensions, BCs, materials

## Stage 1 — Geometry

**Skill:** `geometry-reconstruction`  
**Tools:** COMSOL Java API, SolidWorks STEP  
**Output:** `*_COMSOL_READY.mph`, STEP  
**Checklist:** `checklists/geometry-checklist.md`

Key actions:

- Parametrize all lengths in `model.param()`
- Union fluid → Difference from solid
- Box selections for inlet/outlet/heat

## Stage 2 — Physics & Materials

**Reference:** COMSOL microchannel heat sink tutorial pattern

| Interface | Domain | Key BCs |
|-----------|--------|---------|
| `spf` Laminar Flow | Fluid only | Inlet velocity, outlet p=0 |
| `ht` Heat Transfer | Fluid + solid | Inlet T, heat flux bottom |
| `nitf1` Non-Isothermal | Coupling | Optional; staged later |

Water: ρ, μ, Cp, k — note T-dependence if CHT  
Solid: Si, Al 6063, Cu per paper

**Checklist:** `checklists/physics-checklist.md`

## Stage 3 — Mesh

- Free tetrahedral or swept in long channels
- Refine at fluid–solid interface and inlet
- Target: resolve channel height with ≥3–5 elements across H (exploratory); more for publication

**Checklist:** `checklists/mesh-checklist.md`

## Stage 4 — Solve (staged)

### 4a Flow-only

```text
Study: std_flow
u_in: ramp 0.05 → target via parametric or manual steps
```

### 4b Thermal

```text
Study: std_heat_stable
Use frozen velocity field OR one-way coupling first
```

### 4c Coupled CHT (optional)

```text
NonIsothermalFlow + continuation
```

**Checklist:** `checklists/convergence-checklist.md`  
**Log:** `templates/simulation-log-template.md`

## Stage 5 — Validation

**Skill:** `validation`  
**Workflow:** `verification-workflow.md`

## Stage 6 — Figures & Delivery

**Skills:** `scientific-figure`, `delivery`  
**Templates:** `result-report-template.md`, `final-delivery-checklist.md`

## COMSOL Batch Command Pattern

```bat
comsolbatch -inputfile model_COMSOL_READY.mph -study std_flow -batchlog solve_flow.log
```

Record `LASTEXITCODE` in simulation log.

## Rules of Engagement for AI

1. Never skip Stage 0 gate
2. Never run Stage 4 without geometry + physics checklists
3. State validation status on every result message
4. If batch not executed, prefix results with **"PREVIEW / NOT SOLVED"**

## Domain Applications

- MMC manifold microchannels (Lee 2026)
- Bio-inspired channel networks (Tan 2019)
- Fractal microchannels (Sci. Reports 2020)
- SolidWorks STEP + graft from `hangyezhang.m` template
