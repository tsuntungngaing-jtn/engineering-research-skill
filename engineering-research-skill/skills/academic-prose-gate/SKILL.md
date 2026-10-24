---
name: academic-prose-gate
description: >-
  Language gate for engineering-research deliverables: scrub process contamination
  and AIGC defensive tone from reports, captions, README, and option narratives
  using tsuntungngaing-jtn/academic-scrub. Use before delivery or when user asks
  ?AI? / journal-language audit on project prose. Does not change numbers or citations.
---

# Academic Prose Gate (fused academic-scrub)

## Role

Apply **[academic-scrub](https://github.com/tsuntungngaing-jtn/academic-scrub)** to
project prose so Decoder / Delivery text reads as research, not assignment, chat,
or reviewer-response packaging.

This skill is the **ERS integration layer**. Scrub **authority** lives upstream;
do not fork a weaker rule set here.

| Upstream file | Use |
|---------------|-----|
| `SKILL.md` | Workflow: backup ? audit ? revise L0–L4 ? residual scan ? quality test |
| `semantic-rules.md` | Function-based contamination layers (authority) |
| `reference-patterns.md` | Search cues / defensive lexicon density |
| `examples.md` | Before/after (illustrative only) |

Install beside Cursor skills (required dependency):

```powershell
git clone https://github.com/tsuntungngaing-jtn/academic-scrub.git $env:USERPROFILE\.cursor\skills\academic-scrub
```

If `~/.cursor/skills/academic-scrub/SKILL.md` (or equivalent agent skill path) is missing,
**STOP** and ask the user to install it. Do not improvise a substitute scrub.

## When to run (Transformer / ERS stages)

| Stage | Artifacts to scrub |
|-------|--------------------|
| After `decision-gate` | `OPTION_CARD.md` narratives (keep evidence ids; remove lab-notebook fluff) |
| After `validation` | `VALIDATION_REPORT.md`, `result-report` drafts |
| After `scientific-figure` | Captions / legend essays / in-figure annotation language |
| After `parameter-optimize` | `OPTIMIZE_RUN_LOG.md` claim language; preference write-ups |
| Before `delivery` | `README.md` / `README_????.md` (**required** when narrative ships) |

Checklist: `checklists/academic-prose-checklist.md`.

## Hard constraints (inherit + ERS)

From academic-scrub:

- Judge **function**, not banned words
- Do not invent literature, evidence, causal claims, limitations, or stronger verbs than evidence earns
- Do not change numbers, equations, units, citation keys, figure/table numbers, or technical terms (except proven typos)
- Course/rubric wording stays out of body; keep required AI-declaration cover text
- Intervention order: delete ? rewrite framing ? lexical swap last
- Default: drop prose em dash `—`; numeric ranges may use en dash `–`
- Missing symbols / broken placeholders ? `[AUTHOR CHECK: …]`; never guess

ERS-specific (never “scrub away” epistemic labels):

- Keep `origin=` labels, `NOT_RUN`, `INCONCLUSIVE`, `BLOCKED`, ledger `claim_id` references
- Do not rephrase `digitized_estimate` into “paper reports” / `reported` / EXACT `VALIDATED`
- Keep explicit **REPLICATE** vs **OPTIMIZED** status wording
- Keep quantitative tolerances, mesh stats, and solver evidence pointers

## Workflow

1. **Backup** targets under `prose_scrub/backup_YYYYMMDD_HHMMSS/` (or sidecar `.bak`).
2. **Load and follow** installed `academic-scrub` end-to-end:
   - Audit (excerpt ? function ? keep/delete/rewrite; do not edit yet)
   - Revise L0 ? L4 per `semantic-rules.md`
   - Residual scan + three post-edit questions per revised paragraph
3. **Deliver** scrub output as required by upstream:
   - Full manuscript / ?? / ?AI??? ? Parts A–D
   - Short excerpt ? revised text + short layer changelog
4. Write `prose_scrub/SCRUB_LOG.md`: files touched, L0–L4 hits, retained defensive cues (justify), residual risks, path to upstream skill version/commit if known.
5. Return to `delivery` / `final-delivery-checklist.md`.

## Output placement

```text
<PROJECT_ID>/prose_scrub/
??? backup_YYYYMMDD_HHMMSS/
??? SCRUB_LOG.md
??? optional *_scrubbed copies of long reports
```

## Out of scope

- Physics validation, mesh, mph packaging (other ERS skills)
- Gaming AI detectors or “sounding more human” as a goal
- Venue style polish (`nature-polishing`) or grant voice (`academic-humanizer`) unless the user explicitly requests those too
- Translating entire papers unless the user asked

## Related

- Upstream: https://github.com/tsuntungngaing-jtn/academic-scrub
- `workflows/transformer-pipeline.md` (Prose gate stage)
- `skills/delivery/SKILL.md`
- `skills/scientific-figure/SKILL.md`
- `checklists/final-delivery-checklist.md`
- `checklists/academic-prose-checklist.md`
