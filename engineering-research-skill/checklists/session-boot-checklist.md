# Session Boot Checklist

**Complete before deep-search / geometry / solve / optimize.**

## Config present

- [ ] `session/SESSION_CONFIG.md` exists for this `project_id`
- [ ] `session/SESSION_LOG.md` append entry for this chat (boot or REUSE/CHANGE)
- [ ] If REUSE: three keys echoed (`lang_ui`, `intake`, `path_policy`) and user confirmed

## Menu keys recorded

- [ ] `lang_ui`: `CHN` | `ENG` (UI only)
- [ ] `intake`: `AGENT_SEARCH` | `USER_LIT` | `HYBRID`
- [ ] `path_policy`: `OPTIONS` | `HIGH_IMPACT_ASK` | `USER_SPECIFY`
- [ ] `literature.pdf_policy`: `OA_ONLY_MANIFEST` | `USER_SUPPLIED_PATH` | `LINK_ONLY`

## Intake sanity

- [ ] Primary DOI/path listed **or** explicit gap logged (no fabricated PDF)
- [ ] Search backends named if `AGENT_SEARCH` / `HYBRID` (no paywall bypass)
- [ ] Compare enabled layers listed (`C0`–`C4` subset)

## Stop conditions

- [ ] If config missing → stop with `BLOCKED_AWAITING_SESSION_BOOT` (do not “just start modeling”)
