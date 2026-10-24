# Versioning: GitHub vs Obsidian

**GitHub is authoritative.** Obsidian is a **readable snapshot cabinet** for humans (changelog narrative, course forks, side-by-side diffs). It does **not** replace `git tag` / PR review.

## Layers

| Layer | Location | Role |
|-------|----------|------|
| Source of truth | This repo on GitHub + annotated tags | Reproducible skill text |
| Readable cabinet | Obsidian Vault `Skills/engineering-research-skill/snapshots/YYYYMMDD_<hash>/` | Frozen tree for teaching / audit |
| Changelog (human) | Obsidian `_changelog.md` **and/or** git commit messages | Why a change happened |
| Runtime | `~/.cursor/skills/*` or project `.cursor/skills/` | What the agent loads |

## Snapshot procedure (tested on Windows)

1. `git pull` (or clone) at the commit you want to freeze.
2. Copy `engineering-research-skill/` → Obsidian  
   `Skills/engineering-research-skill/snapshots/YYYYMMDD_<short-hash>/`  
   (exclude `.git`).
3. Append Obsidian `_changelog.md` using the template below.
4. Optionally `git tag vX.Y.Z && git push --tags`.
5. Course deliverables belong under Obsidian `Courses/<COURSE_ID>/backup_YYYYMMDD/` — **never** commit large MPH/zip into this skill repo.

## Changelog entry template

```markdown
## YYYY-MM-DD — snapshot `<short-hash>` / tag `vX.Y.Z` (optional)

- Motivation:
- Files touched:
- Affects courses?: MFE209TC | none | …
- Runtime install refreshed?: yes/no (`~/.cursor/skills`)
- Risk / rollback:
```

## Forbidden

- Editing files inside an Obsidian `snapshots/` tree and treating that as upstream.
- Shipping course binaries (`.mph`, bulk `.png` packs, `.zip`) in git “for completeness”.
- Claiming a skill version is “released” without a git commit (Obsidian-only copy).
