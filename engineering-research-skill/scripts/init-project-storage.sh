#!/usr/bin/env bash
# Create canonical ERS project storage folders and seed templates.
# Usage: ./scripts/init-project-storage.sh /path/to/PROJECT_ID [LANG] [INTAKE] [PATH_POLICY]
set -euo pipefail

PROJECT_ROOT="${1:?Project root required}"
LANG_UI="${2:-ENG}"
INTAKE="${3:-USER_LIT}"
PATH_POLICY="${4:-OPTIONS}"
PROJECT_ID="$(basename "$PROJECT_ROOT")"
SKILL_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
STAMP="$(date -u +%Y-%m-%dT%H:%M:%SZ)"

mkdir -p "$PROJECT_ROOT"/{session,references/pdfs,evidence,decisions,compare/vision,replicate,optimize/baseline,prose_scrub,figures,cad_solidworks_step,comsol_models,builders_logs,VERIFIED_USE_THESE}

copy_tpl() {
  local name="$1" dest="$2"
  if [[ ! -f "$dest" && -f "$SKILL_ROOT/templates/$name" ]]; then
    cp "$SKILL_ROOT/templates/$name" "$dest"
  fi
}

copy_tpl SESSION_CONFIG.md "$PROJECT_ROOT/session/SESSION_CONFIG.md"
copy_tpl SESSION_LOG.md "$PROJECT_ROOT/session/SESSION_LOG.md"
copy_tpl COMPARE_LOG.md "$PROJECT_ROOT/compare/COMPARE_LOG.md"
copy_tpl EVIDENCE_LEDGER.md "$PROJECT_ROOT/evidence/EVIDENCE_LEDGER.md"
copy_tpl OPTION_CARD.md "$PROJECT_ROOT/decisions/OPTION_CARD.md"
copy_tpl DECISION_LOG.md "$PROJECT_ROOT/decisions/DECISION_LOG.md"
copy_tpl REPLICATE_SCORECARD.md "$PROJECT_ROOT/replicate/REPLICATE_SCORECARD.md"
copy_tpl OPTIMIZE_RUN_LOG.md "$PROJECT_ROOT/optimize/OPTIMIZE_RUN_LOG.md"
copy_tpl LITERATURE_MANIFEST.md "$PROJECT_ROOT/references/LITERATURE_MANIFEST.md"
copy_tpl PROJECT_LAYOUT.md "$PROJECT_ROOT/PROJECT_LAYOUT.md"

CFG="$PROJECT_ROOT/session/SESSION_CONFIG.md"
if [[ -f "$CFG" ]]; then
  sed -i.bak \
    -e "s/project_id: REPLACE_ME/project_id: ${PROJECT_ID}/" \
    -e "s/lang_ui: ENG/lang_ui: ${LANG_UI}/" \
    -e "s/intake: USER_LIT/intake: ${INTAKE}/" \
    -e "s/path_policy: OPTIONS/path_policy: ${PATH_POLICY}/" \
    -e "s/updated_at: 2026-10-24T00:00:00Z/updated_at: ${STAMP}/" \
    -e "s/updated_by: session-boot/updated_by: init-project-storage.sh/" \
    "$CFG" && rm -f "${CFG}.bak"
fi

echo "| ${STAMP} | BOOT_CREATE | — → initial | init-project-storage.sh |" >> "$PROJECT_ROOT/session/SESSION_LOG.md"
echo "Initialized ERS storage at: $PROJECT_ROOT"
