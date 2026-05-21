# Debugging Workflow

**Structured COMSOL failure response — no guessing, no fake fixes.**

## Trigger Conditions

Enter this workflow when any of:

- Study status ≠ Done
- Residual stagnation / max Newton iterations
- Non-physical fields (uniform velocity, T < T_in)
- Material / selection COMSOL errors
- User reports "全绿" / full-green velocity plot
- Batch `LASTEXITCODE ≠ 0`

## Step 1 — Capture Evidence (5 min)

Collect before changing model:

```text
[ ] Error message (exact text)
[ ] Study name (std_flow / std_heat_stable / ...)
[ ] COMSOL version
[ ] mph filename and whether GUI or batch
[ ] Last 50 lines of log
[ ] Screenshot optional — not substitute for log
```

Use `prompts/comsol-debug-prompt.md` to structure agent analysis.

## Step 2 — Classify Failure

| Class | Code | Primary skill action |
|-------|------|----------------------|
| G | Geometry | Rebuild fluid union; check connectivity |
| U | Units | Scale factor; param unit audit |
| M | Material | Domain assignment matrix |
| B | Boundary | Selection boxes; inlet/outlet on fluid faces |
| H | Mesh | Quality, size, boundary layer |
| S | Solver | Study split, continuation, initial values |

## Step 3 — Geometry & Units (always first)

### 3.1 Bounding box test

```text
Expected chip: O(1–50) mm
If O(100–1000) mm → scale error
```

### 3.2 Fluid domain test

```text
spf selection entity count
Water material domains == spf domains
Solid has NO spf feature
```

### 3.3 Topology test

- Inlet connected to outlet through fluid union
- No isolated fluid islands (unless intentional)

## Step 4 — Materials & BCs

- List each domain ID → material → physics features
- Verify heat flux units: `100[W/cm^2]` not `100[W/m^2]` by mistake
- Inlet: fully developed vs uniform — match paper method

## Step 5 — Mesh

- Min element quality < 0.1 → localize bad elements
- Honeycomb/fractal: warnings may be acceptable if solve completes — document
- Refine if temperature residual high with flow converged

## Step 6 — Solver

### Split studies

Remove coupled solve until flow stable:

```text
std_flow: spf on, ht off
std_heat_stable: ht on, spf off
```

### Continuation

```text
u_scale * u_in_target, ramp u_scale: 0.05 → 1.0
```

### Duplicate solver cleanup

If GUI loads old `sol2/s1`:

- Save from READY mph
- Batch solve fresh
- Deliver in `VERIFIED_USE_THESE/`

## Step 7 — Verify Fix

**One change → one re-run → one log entry.**

Do not batch multiple fixes without intermediate verification.

Pass criteria:

```text
[ ] Log: Done or converged per tolerance
[ ] LASTEXITCODE=0 (batch)
[ ] Velocity non-uniform on fluid (unless symmetric case)
[ ] ΔP > 0
[ ] T field plausible
```

## Step 8 — Document

Update:

- `templates/simulation-log-template.md`
- README superseded files note
- Validation status → reset to `NOT_VALIDATED` until re-validation

## Escalation

| Situation | Action |
|-----------|--------|
| Fix attempts > 3 without progress | Pause; human reviews geometry intent |
| Paper method unclear | Return to `paper-analysis` |
| Publication-grade mesh needed | Plan mesh independence study |

## Anti-Patterns

- Raising tolerance to "get green checkmark"
- Plotting without fixing selection
- Claiming success from partial time step
