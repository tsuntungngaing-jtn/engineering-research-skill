---
name: session-boot
description: >-
  Normalize every engineering-research-skill session: UI language, literature
  intake, path policy, SESSION_CONFIG. Run before deep-search, geometry, solve,
  or optimize. Use when starting a new chat/project or when SESSION_CONFIG is missing.
---

# Session Boot

Design authority: `docs/superpowers/specs/2026-10-24-session-boot-design.md`.

## When

Before Encoder (`deep-search`) / geometry admit / solve / optimize.  
Missing `session/SESSION_CONFIG.md` → status `BLOCKED_AWAITING_SESSION_BOOT`.

## Flow

```text
Same PROJECT_ID + SESSION_CONFIG exists?
  Yes → ask REUSE | CHANGE (echo lang_ui, intake, path_policy)
  No  → full menu
① LANG: CHN | ENG          (chat UI only; archives stay English)
② INTAKE: AGENT_SEARCH | USER_LIT | HYBRID
③ PATH: OPTIONS | HIGH_IMPACT_ASK | USER_SPECIFY
→ Write session/SESSION_CONFIG.md ; append session/SESSION_LOG.md
→ Proceed to deep-search (or USER_LIT consumption)
```

## Hard rules

- Do not invent primary paper PDFs; no paywall bypass (`pdf_policy`).
- Changing `PROJECT_ID` forbids silent carry-over of prior config.
- `USER_SPECIFY` → never auto-pick high-impact forks; await user.
- Compare layers declared in config; pixel/vision cannot alone yield EXACT `VALIDATED` (see `compare-closed-loop-checklist.md`).

## Templates / checklists

- `templates/SESSION_CONFIG.md`
- `templates/SESSION_LOG.md`
- `checklists/session-boot-checklist.md`
- `workflows/session-boot.md`
