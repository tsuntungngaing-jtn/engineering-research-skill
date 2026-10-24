# Courseware pointer: MFE209TC

**Pointers and checklists only.** Do not vendor coursework binaries into this repository.

## Local archive (example host path)

Obsidian (authoritative for *course* files on the lab PC that ran the 2026-10-24 backup):

```text
<Obsidian Vault>/Courses/MFE209TC/backup_YYYYMMDD/
```

Typical pack names (examples — may be renamed by locale):

| Pack (name contains) | Use in ERS |
|----------------------|------------|
| `MODEL_DEFINITION_EXPORT` | Materials / interfaces / probes CSV → ledger & equation audit |
| `MESH_EXPORT` / `mesh_convergence_results.csv` | Mesh checklist + convergence evidence |
| `Pareto` / `PreferenceLock` | Optimize **after** replicate scorecard; preference lock is a decision, not validation |
| `MATLAB_EN_figures` / sparse figures | `scientific-figure` + `academic-prose-gate` on captions |
| 作业过程归档 / process archive | Timeline / handoff notes; not solver proof |

## Suggested ERS path for a coursework sprint

```text
session-boot (SESSION_CONFIG)
  → deep-search / USER_LIT (course brief + any paper)
  → decision-gate (path_policy)
  → Decoder·Replicate (geometry → solve → validation → REPLICATE_SCORECARD)
  → (optional) parameter-optimize / Pareto preference lock
  → academic-prose-gate on EN report + captions
  → delivery (VERIFIED_USE_THESE) + Obsidian course backup
```

## Course delivery verification extras

Tick in addition to `checklists/final-delivery-checklist.md`:

- [ ] Mesh family documented (`coarse` / `medium` / `fine`) with element counts from export CSV
- [ ] Pareto / preference-lock artifacts labeled **decision**, not `PAPER_COMPARABLE`
- [ ] English report body scrubbed (`academic-prose-checklist.md`); process chat not in final PDF
- [ ] Figure index lists source pack folder names (for TA audit)
- [ ] Large solvers kept outside git; only manifests / CSV / small PNG in course zip if required

## Prose gate example (fictional paths)

```text
Project: MFE209TC_GroupCoursework_<ID>/
  reports/IEEE_Report_Draft_EN.md          → academic-prose-gate
  figures/captions.md                      → academic-prose-gate
  prose_scrub/SCRUB_LOG.md                 → required before close-out
```

Upstream scrub skill: https://github.com/tsuntungngaing-jtn/academic-scrub
