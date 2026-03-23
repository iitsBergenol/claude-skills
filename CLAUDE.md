# Claude Code Skills Repo

This repository contains custom skills for Claude Code.

## Structure

```
.claude/
  skills/
    <skill-name>/
      SKILL.md       # Skill definition with frontmatter and prompt
```

## Adding a New Skill

1. Create a directory under `.claude/skills/<skill-name>/`
2. Add a `SKILL.md` with the following frontmatter:

```markdown
---
name: skill-name
description: When to activate this skill (used by Claude to decide relevance)
version: 1.0.0
---

# Skill prompt content here
```

3. The `description` field is critical — it determines when Claude Code auto-invokes the skill.

## Conventions

- Skill names use kebab-case
- Descriptions are written from Claude's perspective ("Activate when...")
- Version follows semver
