# PROJECT_LAYOUT (storage map)

Canonical on-disk layout for an ERS project. Skill repo stores **templates only**; simulation outputs live under the project root (`storage.root` in `SESSION_CONFIG`).

```text
<PROJECT_ID>/
├── session/                      # boot + interaction policy
│   ├── SESSION_CONFIG.md
│   └── SESSION_LOG.md
├── references/                   # PDFs, DOI notes, OA manifest
│   ├── pdfs/
│   └── LITERATURE_MANIFEST.md    # optional download provenance
├── evidence/                     # Encoder
│   └── EVIDENCE_LEDGER.md
├── decisions/                    # Decision
│   ├── OPTION_CARD.md
│   └── DECISION_LOG.md
├── compare/                      # closed-loop compare
│   ├── COMPARE_LOG.md
│   └── vision/                   # optional VLM inputs/outputs
├── replicate/
│   └── REPLICATE_SCORECARD.md
├── optimize/
│   ├── OPTIMIZE_RUN_LOG.md
│   └── baseline/                 # locked mph copies
├── prose_scrub/
│   ├── SCRUB_LOG.md
│   └── backup_YYYYMMDD_HHMMSS/
├── figures/
├── cad_solidworks_step/
├── comsol_models/                # working mph + .status + stdout
├── builders_logs/
├── VERIFIED_USE_THESE/           # human-approved only
│   ├── REPLICATE_*.mph
│   └── OPTIMIZED_*.mph
├── PAPER_SPEC.md
├── model_equation_audit.md
├── model_run_log.md
├── model_output_reliability.md   # optional
├── VALIDATION_REPORT.md
└── README.md                     # English archive (L3)
```

## Rules

1. **No large binaries in the skill git repo** — mph/STEP/PDF stay in the project tree or lab archive.
2. **Never overwrite** locked COMSOL sessions; write a new staged filename.
3. **`VERIFIED_USE_THESE/`** is the only handoff folder for “use these first”.
4. **Session + compare** are required when shipping claims that depend on boot policy or figure/QoI comparison.
5. Init empty tree with `scripts/init-project-storage.ps1` (or `.sh`).
