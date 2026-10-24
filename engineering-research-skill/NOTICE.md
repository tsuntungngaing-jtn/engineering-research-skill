# NOTICE

## Upstream language skill

Journal-language / process-contamination scrubbing is **not** reimplemented in this
repository. Delivery prose gates call:

**https://github.com/tsuntungngaing-jtn/academic-scrub**

Install as a separate Cursor/agent skill (`academic-scrub`). See
`skills/academic-prose-gate/SKILL.md` and `checklists/academic-prose-checklist.md`.

`academic-scrub` retains its own license and terms. This repository only provides
an integration workflow (when to run, which project files, ERS epistemic invariants).

## Transformer pipeline

Encoder → Decision → Decoder naming is a **workflow metaphor** only. This project
does not train or ship Transformer neural network weights.

## Project storage vs skill repo

Large artifacts (`.mph`, STEP, licensed PDFs) belong in the **research project
directory** created by `scripts/init-project-storage.*`, not in this skill
repository. See `templates/PROJECT_LAYOUT.md` and `workflows/project-storage.md`.

Optional literature tooling (separate repos/skills; not vendored here):

- https://github.com/tsuntungngaing-jtn/academic-intel-agent
- `paper-lookup` / `academic-search` / `nature-academic-search` (agent skills)
