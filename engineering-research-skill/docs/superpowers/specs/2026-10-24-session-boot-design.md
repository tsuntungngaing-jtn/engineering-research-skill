# Design: Session Boot Protocol + Literature Intake + Compare Closed Loop

**Date:** 2026-10-24  
**Status:** Approved in dialogue (§1–§4 OK); awaiting user review of this file before implementation plan  
**Repo:** [engineering-research-skill](https://github.com/tsuntungngaing-jtn/engineering-research-skill)  
**Approach:** A — lightweight `session-boot` skill + `SESSION_CONFIG` (not per-skill hard gates, not Cursor-rule-only)

## Goals

1. Normalize every ERS interaction with an explicit boot menu.
2. Separate **UI language** from **archive language**.
3. Make intake and fork policy explicit and auditable.
4. Route literature search/download through existing skills/agents without paywall bypass.
5. Define a compare closed loop (equation → numeric QoI → optional pixel/vision) that cannot launder figure similarity into EXACT validation.

## Non-goals (this iteration)

- Embedding OpenAlex/DeepSeek crawler code inside ERS
- Paywall circumvention
- Chinese formal archive bodies (archives stay English under L3)
- Duplicating the boot menu inside every downstream skill

## Decisions locked in dialogue

| Topic | Choice |
|-------|--------|
| Structure | C — intake then path policy |
| When to prompt | 3 — new chat may REUSE; new `PROJECT_ID` must reselect |
| Intake menu | I1 — `AGENT_SEARCH` / `USER_LIT` / `HYBRID` |
| Path menu | P1 — `OPTIONS` / `HIGH_IMPACT_ASK` / `USER_SPECIFY` |
| Language | L3 — chat UI may be CHN/ENG; **all archive files English** |
| Implementation shape | A — `session-boot` + config files |
| Compare policy | §4 below (C0–C4 ladder; pixel/vision capped) |

---

## §1 Session boot flow

On any ERS-related task, run **session-boot before** deep-search / geometry / solve.

```text
Incoming message
  → Same PROJECT_ID and SESSION_CONFIG exists?
       Yes → ask REUSE | CHANGE (echo current keys)
       No / new project → full menu
  → ① LANG: CHN | ENG
  → ② INTAKE: AGENT_SEARCH | USER_LIT | HYBRID
  → ③ PATH: OPTIONS | HIGH_IMPACT_ASK | USER_SPECIFY
  → Write session/SESSION_CONFIG.md ; append SESSION_LOG.md
  → Proceed to Encoder (deep-search) …
```

### Menu keys

| Step | Key | Meaning |
|------|-----|---------|
| ① | `CHN` / `ENG` | Conversation language only |
| ② | `AGENT_SEARCH` | Direction only; agent searches literature |
|  | `USER_LIT` | User supplies papers + requirements |
|  | `HYBRID` | User materials first; agent may fill gaps + official manuals |
| ③ | `OPTIONS` | Forks → OPTION_CARD; user selects |
|  | `HIGH_IMPACT_ASK` | Ask only on high-impact / blocking items; else decide and log |
|  | `USER_SPECIFY` | No agent pick; missing instruction → `BLOCKED_AWAITING_USER` |

### Hard rules

- Missing `SESSION_CONFIG` → do not start geometry admit / solve / optimize.
- `REUSE` must display the three keys for confirmation.
- Changing `PROJECT_ID` forbids silent carry-over of prior project config.

---

## §2 Config schema + literature stack

### `SESSION_CONFIG.md` (English keys; chat may be Chinese)

```yaml
project_id: <string>
lang_ui: CHN | ENG
intake: AGENT_SEARCH | USER_LIT | HYBRID
path_policy: OPTIONS | HIGH_IMPACT_ASK | USER_SPECIFY
literature:
  primary_doi_or_path: <optional>
  search_backends: [paper-lookup | academic-search | nature-academic-search | academic-intel-agent]
  pdf_policy: OA_ONLY_MANIFEST | USER_SUPPLIED_PATH | LINK_ONLY
  intel_agent_root: <optional path>
compare:
  enabled_layers: [C0, C1, C2, C3?, C4?]
  vision_model: <optional name or none>
updated_at: <ISO-8601>
```

Paths:

- `<PROJECT>/session/SESSION_CONFIG.md`
- `<PROJECT>/session/SESSION_LOG.md` (append-only)

### Backend comparison (reference only; not vendored)

| Source | Strength | ERS use |
|--------|----------|---------|
| [academic-intel-agent](https://github.com/tsuntungngaing-jtn/academic-intel-agent) | OpenAlex watch, interest match, link-not-login, local `data/pdfs` + figures | Candidate pool / monitoring; user places PDFs under `references/` |
| `academic-search` / `paper-lookup` | Multi-source search, dedupe, OA PDF + manifest, provenance | Primary Encoder retrieval |
| `nature-academic-search` | PubMed/Crossref/arXiv MCP | When MCP stack is available / biomedical |
| `deep-search` | Evidence hierarchy + ledger | **Only writer** of `EVIDENCE_LEDGER` |

### Intake × actions

| intake | Agent does | Stop condition |
|--------|------------|----------------|
| `AGENT_SEARCH` | Search via backends → candidate rows in ledger; prefer OA; else LINK_ONLY | No primary PDF when table numbers needed → `blocks` + path_policy |
| `USER_LIT` | Consume user DOI/PDF/requirements; manuals may add `manual_official` | Missing files → list gaps; do not invent a substitute primary paper |
| `HYBRID` | User materials win; search fills gaps; optional intel-agent watch | Conflicts → decision-gate |

Default `pdf_policy`: `OA_ONLY_MANIFEST`. User says “I will download” → `USER_SUPPLIED_PATH`. Intel monitoring → `LINK_ONLY`.  
**No paywall bypass.**

### Path × decision-gate

| path_policy | Behavior |
|-------------|----------|
| `OPTIONS` | Any `conflict` / high-impact gap → OPTION_CARD |
| `HIGH_IMPACT_ASK` | Ask only if `blocks ∈ {geometry,bc,claim}` or high-impact; else decide + `DECISION_LOG` |
| `USER_SPECIFY` | Never auto-pick; await user |

---

## §3 Repository placement

### Add

| Path | Role |
|------|------|
| `skills/session-boot/SKILL.md` | Boot protocol |
| `templates/SESSION_CONFIG.md` | Config template |
| `templates/SESSION_LOG.md` | Log template |
| `templates/COMPARE_LOG.md` | Compare closed-loop log |
| `checklists/session-boot-checklist.md` | Boot checklist |
| `checklists/compare-closed-loop-checklist.md` | C0–C4 checklist |
| `workflows/session-boot.md` | Boot + literature backend map |
| `docs/superpowers/specs/2026-10-24-session-boot-design.md` | This document |

### Edit (thin wiring)

| Path | Change |
|------|--------|
| `workflows/transformer-pipeline.md` | Insert SESSION BOOT before Encoder; note compare stages |
| `workflows/paper-to-simulation.md` | Require `SESSION_CONFIG` before Phase 0/A |
| `skills/deep-search/SKILL.md` | Read intake/pdf_policy; external backends as sources; still ledger-only writer |
| `skills/decision-gate/SKILL.md` | Honor `path_policy` |
| `skills/parameter-optimize/SKILL.md` | Honor compare ladder / claim ceilings |
| `skills/simulation-equation-audit/SKILL.md` (or root audit docs) | Owns C0 |
| `skills/delivery/SKILL.md` + `final-delivery-checklist.md` | Require `session/` + `COMPARE_LOG` when claims shipped |
| `README.md` + `NOTICE.md` | Optional deps: paper-lookup/academic-search, academic-intel-agent |

### Runtime project layout

```text
<PROJECT_ID>/
├── session/
│   ├── SESSION_CONFIG.md
│   └── SESSION_LOG.md
├── references/
├── evidence/
├── decisions/
├── compare/
│   └── COMPARE_LOG.md
├── replicate/
├── optimize/
└── ...
```

---

## §4 Compare closed loop (content / vision)

### Layer ladder (prefer higher; do not skip to declare success)

| Layer | Compares | Evidence | Allowed conclusion |
|-------|----------|----------|--------------------|
| **C0** | Equations, BC form, coordinates | Text vs equation audit | `EQUATION_MATCH` / `EQUATION_GAP` / `NOT_RUN` |
| **C1** | Parameter tables | `reported` numbers | relative error → `NUMERIC_PASS/FAIL` |
| **C2** | Exported QoI (ΔP, T_max, …) | probes vs paper numbers | primary replicate criterion |
| **C3** | Functions/curves | table points or digitized curves | points=`reported`; from figure=`digitized_estimate` |
| **C4** | Field plots / pixels | axis/colorbar sample or VLM | `TREND` / `INTERVAL` / `INCONCLUSIVE` only — **never** `EXACT VALIDATED` |

**Default closed loop:** C0 → C1 → C2; open C3/C4 only when needed.  
**Forbidden:** skip C0/C2 and declare replicate success from C4 alone.

### No numeric parameters — pixel allowed under demotion

| Case | Rule |
|------|------|
| Paper has table/text numbers | Must run C1/C2; pixel at most auxiliary |
| Figure-only, no numbers | C4 allowed; scorecard ceiling `REPLICATE_PASS_WITH_GAPS` or `FIGURE_TREND_ONLY` |
| Optimize using pixels | Auxiliary constraint only; user must accept under path_policy; log `digitized_estimate` |
| Pixel match → VALIDATED | **Forbidden** |

### Vision model (VLM) policy

Optional tool — **not** ground truth.

| Use | Allowed? | Claim ceiling |
|-----|----------|---------------|
| Read colorbar/axis ranges | Yes | `digitized_estimate` + uncertainty + fig id |
| Field “looks similar” | Yes | qualitative only |
| Invent precise params as `reported` | **No** |
| Replace equation audit or probe QoI | **No** |

Log every call:

```text
vision_call:
  model: <name>
  input: paper_fig_path + sim_export_path
  task: axis_read | field_similarity
  output_claim_ceiling: digitized_estimate | qualitative_only
```

No VLM available → pixel script or human read; same ceilings.

### Compare state machine

```text
Declare enabled layers in SESSION_CONFIG / COMPARE_LOG
  → Run available layers
  → Write compare/COMPARE_LOG.md
  → C2 FAIL without waiver → repair / re-decide; no optimize
  → Only C4 available → FIGURE_TREND_ONLY; ask before baseline lock
  → Pass → parameter-optimize may start
```

Interaction with `path_policy`:

- `USER_SPECIFY` — compare plan needs user OK  
- `HIGH_IMPACT_ASK` — must ask when C4 is primary evidence or locking baseline without C2  
- `OPTIONS` — no numeric QoI → OPTION_CARD (accept trend replicate / stop / search more)

### One-line rule

> Equations and numeric QoI first; if parameters are missing, pixel/vision compare is allowed only for trend/interval claims labeled `digitized_estimate`, and cannot alone support EXACT replicate or publication-grade VALIDATED.

---

## Error / stop conditions

| Condition | Status |
|-----------|--------|
| No session config | `BLOCKED_AWAITING_SESSION_BOOT` |
| Paywall / no OA | `LINK_ONLY` + user path; do not fabricate PDF |
| Self-iterate cap (existing) | max 3; then `BLOCKED_AWAITING_USER` |
| C2 fail, no waiver | no optimize |
| Vision used without claim ceiling in log | treat as protocol FAIL; redo log |

## Testing / acceptance (for implementation plan)

1. Dry-run: boot menus + REUSE/CHANGE + new PROJECT_ID forces reselect.  
2. Dry-run: each intake path writes correct pdf_policy behavior notes.  
3. Dry-run: each path_policy alters decision-gate behavior text.  
4. Dry-run: C4-only case cannot emit EXACT VALIDATED; C2 fail blocks optimize.  
5. Checklist items tickable in `session-boot` and `compare-closed-loop` checklists.

## Implementation note

After user approves **this file**, create an implementation plan via `writing-plans` (do not code until that plan exists and is approved if required by process).
