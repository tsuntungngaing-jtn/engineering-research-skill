# Project Storage Workflow

Maps **where** ERS artifacts live. Skill git repo holds Markdown templates/scripts only; mph/PDF/STEP stay in the project or lab archive.

## Init

```powershell
powershell -ExecutionPolicy Bypass -File scripts/init-project-storage.ps1 `
  -ProjectRoot "D:\work\<PROJECT_ID>" `
  -LangUi ENG -Intake USER_LIT -PathPolicy OPTIONS
```

```bash
bash scripts/init-project-storage.sh /path/to/<PROJECT_ID> ENG USER_LIT OPTIONS
```

Seeds folders + copies templates listed in `templates/PROJECT_LAYOUT.md`.

## Folder → stage

| Folder | Pipeline stage | Primary files |
|--------|----------------|---------------|
| `session/` | Boot | `SESSION_CONFIG.md`, `SESSION_LOG.md` |
| `references/` | Intake / literature | PDFs, `LITERATURE_MANIFEST.md` |
| `evidence/` | Encoder | `EVIDENCE_LEDGER.md` |
| `decisions/` | Decision | `OPTION_CARD.md`, `DECISION_LOG.md` |
| `compare/` | Compare closed loop | `COMPARE_LOG.md`, `vision/` |
| `replicate/` | Decoder · Replicate | `REPLICATE_SCORECARD.md` |
| `optimize/` | Decoder · Optimize | `OPTIMIZE_RUN_LOG.md`, `baseline/` |
| `prose_scrub/` | Prose gate | `SCRUB_LOG.md` |
| `comsol_models/` | Solve working set | `.mph`, `.status`, stdout |
| `VERIFIED_USE_THESE/` | Delivery | `REPLICATE_*`, `OPTIMIZED_*` |

## Hard storage rules

1. Do not commit commercial mph or licensed PDFs into the **skill** repository.
2. Prefer new filenames over in-place overwrite of open COMSOL models.
3. Close-out requires `session/SESSION_CONFIG.md` when the project used boot policy.
4. Close-out requires `compare/COMPARE_LOG.md` when replicate/optimize claims cite QoI or figures.
5. `layout_version` in `SESSION_CONFIG` tracks this map (currently `1`).

## Related

- Design: `docs/superpowers/specs/2026-10-24-session-boot-design.md`
- `skills/delivery/SKILL.md`
- `checklists/final-delivery-checklist.md`
