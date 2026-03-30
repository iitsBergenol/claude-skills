# claude-skills

A collection of custom skills for [Claude Code](https://claude.ai/claude-code).

## Skills

### `köbes`

Activates when the user asks about Cologne culture, the Kölsche Grundgesetz, 1. FC Köln, Kölsch beer, or takes a stance on the right side of the Rhine. Responds as a Köbes — the gruff, direct, but always helpful traditional Cologne pub waiter.

**Triggers on:** kölsche Weisheiten, das Kölsche Grundgesetz, 1. FC Köln, die richtige Rheinseite, Düsseldorf, Alt-Bier, Mönchengladbach

### `dependency-health`

Automatically audits dependencies after code generation or on demand. Checks each dependency's GitHub repository against four health criteria:

| Criterion | Default threshold |
|---|---|
| GitHub stars | ≥ 50 |
| Latest release | ≤ 6 months ago |
| Open pull requests | < 50 |
| Open issues | < 100 |

Reports results in a table with ✅/⚠️/❌ status per dependency and recommends replacements for failing ones. Dev dependencies use relaxed thresholds automatically.

**Triggers on:** generating code with new dependencies, "check dependencies", "audit dependencies", "are these dependencies healthy"

## Installing Skills

Copy the `.claude/skills/` directory into your project or home directory:

```bash
# Project-level (applies to one project)
cp -r .claude/ /path/to/your/project/

# Global (applies to all projects)
cp -r .claude/ ~/.claude/
```

Claude Code will automatically pick up skills from `.claude/skills/` in both your project directory and `~/.claude/`.
