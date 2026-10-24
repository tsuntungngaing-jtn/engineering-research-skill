# COMPARE_LOG

> Copy to `<PROJECT_ID>/compare/COMPARE_LOG.md`. Claim ceilings: see design spec §4.

## Plan

| Layer | Enabled | Owner artifact | Status |
|-------|---------|----------------|--------|
| C0 equations | yes/no | model_equation_audit.md | NOT_RUN / EQUATION_MATCH / EQUATION_GAP |
| C1 parameters | yes/no | PAPER_SPEC / ledger | NOT_RUN / NUMERIC_PASS / NUMERIC_FAIL |
| C2 QoI | yes/no | VALIDATION_REPORT / probes | NOT_RUN / NUMERIC_PASS / NUMERIC_FAIL |
| C3 curves | yes/no | digitize notes | NOT_RUN / … |
| C4 pixel/vision | yes/no | figures + vision_call | NOT_RUN / TREND / INTERVAL / INCONCLUSIVE |

**Scorecard ceiling allowed this run:** `REPLICATE_PASS` | `REPLICATE_PASS_WITH_GAPS` | `FIGURE_TREND_ONLY` | `FAIL`

## C2 numeric rows (primary)

| QoI | paper value | origin | model value | unit | rel err | pass? |
|-----|-------------|--------|-------------|------|---------|-------|
| | | reported/derived | | | | |

## C4 / vision calls (if any)

```text
vision_call:
  model:
  input:
  task: axis_read | field_similarity
  output_claim_ceiling: digitized_estimate | qualitative_only
  result:
```

| fig id | method | claim ceiling | conclusion |
|--------|--------|---------------|------------|
| | pixel_sample / VLM / human | digitized_estimate | |

## Gate

- [ ] Did not declare EXACT VALIDATED from C4 alone
- [ ] C2 FAIL without waiver → optimize blocked
- [ ] Digitized values remain `digitized_estimate`
