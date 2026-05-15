# Publish to GitHub (tsuntungngaing-jtn)

## One-time setup

```powershell
# 1. Install Git (if needed)
winget install Git.Git

# 2. Login GitHub CLI
gh auth login
# Choose: GitHub.com → HTTPS → Login with browser

# 3. Close and reopen terminal so `git` is on PATH
```

## Create repository and push

```powershell
cd f:\juntong-fan\engineering-research-skill

git init
git add -A
git commit -m "Initial release: AI Engineering Research Skill System"
git branch -M main

gh repo create engineering-research-skill --public --source=. --remote=origin --push
```

Repository URL will be:

**https://github.com/tsuntungngaing-jtn/engineering-research-skill**

## Alternative: Web upload

1. Open https://github.com/new
2. Repository name: `engineering-research-skill`
3. Public → Create repository
4. Upload folder contents (drag & drop) or upload `engineering-research-skill.zip`

## Install as Cursor skills (after clone)

```powershell
git clone https://github.com/tsuntungngaing-jtn/engineering-research-skill.git
xcopy /E /I engineering-research-skill\skills %USERPROFILE%\.cursor\skills
```

Or per-project:

```powershell
xcopy /E /I engineering-research-skill\skills your-project\.cursor\skills
```
