# Compare Closed-Loop Checklist (C0–C4)

Design: `docs/superpowers/specs/2026-10-24-session-boot-design.md` §4.

**Default:** run **C0 → C1 → C2**. Open C3/C4 only when needed.  
**Forbidden:** skip C0/C2 and declare replicate success from C4 alone.

## Plan

- [ ] Enabled layers listed in `SESSION_CONFIG` and/or `compare/COMPARE_LOG.md`
- [ ] Claim ceilings understood: pixel/vision ≤ `digitized_estimate` / qualitative

## Layers

| Layer | Done? | Result code | Notes |
|-------|-------|-------------|-------|
| C0 equations / coords / BC form | [ ] | `EQUATION_MATCH` / `GAP` / `NOT_RUN` | |
| C1 parameter tables (`reported`) | [ ] | `NUMERIC_PASS` / `FAIL` / `N/A` | |
| C2 exported QoI (ΔP, T, …) | [ ] | `NUMERIC_PASS` / `FAIL` / `N/A` | primary replicate |
| C3 curves / functions | [ ] | points=`reported` or `digitized_estimate` | |
| C4 field / pixels / VLM | [ ] | `TREND` / `INTERVAL` / `INCONCLUSIVE` only | never EXACT VALIDATED |

## Gates

- [ ] C2 FAIL without written waiver → **no** `parameter-optimize`
- [ ] Figure-only paper (no numbers) → scorecard ceiling `FIGURE_TREND_ONLY` or `REPLICATE_PASS_WITH_GAPS` (not publication VALIDATED)
- [ ] Any VLM/pixel call logged with `output_claim_ceiling`
- [ ] Optimize using pixels only as **auxiliary** constraint; user acceptance under `path_policy`

## Coursework examples (names only)

- Mesh CSV from `MESH_EXPORT` / `mesh_convergence_results.csv` → supports C2 mesh sanity, not paper EXACT
- Pareto / PreferenceLock packs → **decision** artifacts after scorecard; not C2 substitute
