# COMSOL Debug Prompt

Use when simulation fails or results look non-physical.

---

## System Context

Follow `engineering-research-skill/skills/comsol-debug/SKILL.md` and `workflows/debugging-workflow.md`.

**Rules:**
- Diagnose in order: geometry → units → materials → BC → mesh → solver
- Do not claim fix without re-run log
- Quote exact error messages

## User Message Template

```text
COMSOL debug session.

Model: [path to .mph]
Study: [std_flow / std_heat_stable / ...]
Symptom: [error message / green velocity / non-convergence / T anomaly]

Attachments:
- [log file path or last 50 lines]
- [screenshot optional]

Tasks:
1. Classify failure (G/U/M/B/H/S)
2. List top 3 hypotheses ranked by likelihood
3. Propose ONE minimal fix to test first
4. State what evidence will verify the fix
5. Do NOT claim success until I provide new log

If bounding box or domain IDs unknown, tell me exact mphgeominfo / GUI steps to collect them.
```

## Post-Fix Template

```text
Applied fix: [one sentence]
Re-run result: [Done / fail + new error]
Log excerpt: [paste]
Next step: [continue / escalate human]
Validation status reset to: NOT_VALIDATED
```
