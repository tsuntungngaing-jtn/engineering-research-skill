# SESSION_CONFIG

> Copy to `<PROJECT_ID>/session/SESSION_CONFIG.md`. Archives stay English (lang_ui is chat only).

```yaml
project_id: REPLACE_ME
lang_ui: ENG   # CHN | ENG - conversation only; archive files always English
intake: USER_LIT   # AGENT_SEARCH | USER_LIT | HYBRID
path_policy: OPTIONS   # OPTIONS | HIGH_IMPACT_ASK | USER_SPECIFY
literature:
  primary_doi_or_path: ""
  search_backends:
    - paper-lookup
    # - academic-search
    # - nature-academic-search
    # - academic-intel-agent
  pdf_policy: OA_ONLY_MANIFEST   # OA_ONLY_MANIFEST | USER_SUPPLIED_PATH | LINK_ONLY
  intel_agent_root: ""
compare:
  enabled_layers: [C0, C1, C2]
  # optional: C3, C4
  vision_model: none   # model name or none
storage:
  root: .   # project root; relative paths below are under this root
  layout_version: 1
updated_at: 2026-10-24T00:00:00Z
updated_by: session-boot
```
