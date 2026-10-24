# Dry-run: Transformer pipeline gates (fictional)

**Purpose:** Verify gate text only. Numbers and figures below are invented.

## Input

Replicate inlet velocity for a toy microchannel paper; then optimize channel height.

## Encoder

| claim_id | quantity | value | origin | locus |
|----------|----------|-------|--------|-------|
| E001 | u_in | 0.10 m/s | reported | Table 1 |
| E002 | u_in | 0.12–0.18 m/s | digitized_estimate | Fig. 4 colorbar |
| E003 | H | 0.40 mm | reported | Table 1 |

Conflict: E001 vs E002 ? `certainty=conflict`, `blocks=bc`.

## Decision

Option A: admit E001 (`reported`).  
Option B: sensitivity on E002 endpoints.  
User: `REFUSE` ? self_iterate round 1 rephrases options; still no new numbers.  
User: `SELECT A` ? log and continue.

## Replicate gate

Scorecard: numeric Tw within 5% of Table 2 ? `REPLICATE_PASS`.  
Pixel Fig. 4 trend only as `digitized_estimate` note — **not** EXACT VALIDATED.

## Optimize gate

Allowed: sweep H around 0.40 mm; compare ?P to Table 2 (`reported`).  
Forbidden trigger text if agent tries: “match Fig. 4 colorbar mid and mark VALIDATED” ? **STOP**.

## Prose gate

README draft containing “This assignment demonstrates…” ? academic-scrub removes L1
contamination; numbers and `origin=` labels unchanged. Log under `prose_scrub/SCRUB_LOG.md`.

## Expected stop conditions demonstrated

- [x] Refuse path does not auto-pick Option B
- [x] Optimize blocked until scorecard
- [x] Digitized not promoted to reported
- [x] academic-prose-gate required before delivery close-out
