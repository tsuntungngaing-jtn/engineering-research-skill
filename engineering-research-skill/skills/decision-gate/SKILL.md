---
name: decision-gate
description: >-
  Decision stage after deep-search: present 2–4 accountable option cards for user
  choice; on refuse or inability to choose, self-iterate only inside the evidence
  ledger. Use before geometry build or optimize. Never invent missing research inputs.
---

# Decision Gate Skill (Attention / Choice)

## Role

Map the evidence ledger into **explicit alternatives**, wait for user selection, or
**accountably self-iterate** when the user refuses / cannot choose. This is the
pipeline **Decision** block (attention over encoded evidence).

## Prerequisites

- [ ] `evidence/EVIDENCE_LEDGER.md` exists and passed `deep-search-checklist`
- [ ] Conflicts listed; high-impact gaps tagged with `blocks`

## Outputs

| File | Purpose |
|------|---------|
| `decisions/OPTION_CARD.md` | 2–4 mutually exclusive schemes + evidence pointers |
| `decisions/DECISION_LOG.md` | Append-only: choice, refuse, or self-iterate rounds |

Use templates under `templates/`.

## Option card rules

Each option must state:

1. **Geometry / BC / material stance** in one paragraph
2. **Evidence ids** used (`E###`)
3. **Open gaps** still `conflict` or `digitized_estimate`
4. **Admit path** if COMSOL MCP is used: `admit_single_value` vs `admit_with_sensitivity`
5. **What it is *not*** claiming (one line, scientific scope—not defensive fluff)

Do not emit more than 4 options. Prefer 2 when conflict is binary.

## User paths

| User action | Next |
|-------------|------|
| Selects option *k* | Log `user_selected`; hand off to `paper-analysis` / replicate decoder |
| Approves sensitivity bracket | Log `sensitivity`; replicate may run endpoints; no EXACT figure claim |
| Refuses / cannot choose / AFK | Enter **self-iterate** (below) |
| Explicit waiver of human gate | Log `waived`; still keep ledger origins |

High-impact items: **no silent default** when user is AFK. Mirror policy C from comsol-automatic underspec loop.

## Self-iterate (accountable only)

When refuse / unable:

1. Re-read ledger only — **no new invented numbers**.
2. Optional: targeted deep-search refresh for *named* missing loci (new rows must get new `claim_id`).
3. Recombine existing candidates into a revised `OPTION_CARD.md` (mark `self_iterate_round = n`).
4. Cap: **max 3** self-iterate rounds per contested quantity set.
5. If still unresolved ? status `BLOCKED_AWAITING_USER`; do **not** proceed to geometry admit or optimize.

Prohibited: “pick the option that looks closest to the paper figure” without user approval.

## Downstream

- Selected ? Decoder **Replicate** (`paper-analysis` ? geometry ? solve ? `validation`)
- Only after replicate scorecard ? `parameter-optimize`
