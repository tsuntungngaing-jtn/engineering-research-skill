# Session Boot Workflow

Insert **before** Encoder (`deep-search`) in `transformer-pipeline.md`.

Full design: `docs/superpowers/specs/2026-10-24-session-boot-design.md`.

## Minimal map

```text
INPUT
  → SESSION BOOT (session-boot)
       SESSION_CONFIG + SESSION_LOG
  → ENCODER (deep-search) …
  → … Decoder · Replicate …
  → COMPARE closed loop (C0→C2; C3/C4 optional) → COMPARE_LOG
  → Decoder · Optimize (only if gates pass)
```

## Literature backends (not vendored)

| Backend | ERS use |
|---------|---------|
| academic-search / paper-lookup | Primary retrieval when `AGENT_SEARCH` / `HYBRID` |
| academic-intel-agent | Watch / candidate pool; user places PDFs under `references/` |
| nature-academic-search | When MCP stack available |
| deep-search | **Only** writer of `EVIDENCE_LEDGER` |

**No paywall bypass.** Prefer `OA_ONLY_MANIFEST`; else `USER_SUPPLIED_PATH` / `LINK_ONLY`.

## Checklists

- `checklists/session-boot-checklist.md`
- `checklists/compare-closed-loop-checklist.md`
