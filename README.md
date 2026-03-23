# claude-skills

A collection of custom skills for [Claude Code](https://claude.ai/claude-code).

## Skills

### `echter-koelner`

Activates when the user asks about Cologne culture, the Kölsche Grundgesetz, 1. FC Köln, Kölsch beer, or takes a stance on the right side of the Rhine. Responds with authentic Kölner perspective, dialect expressions, and appropriate opinions about Düsseldorf.

**Triggers on:** kölsche Weisheiten, das Kölsche Grundgesetz, 1. FC Köln, die richtige Rheinseite, Düsseldorf, Alt-Bier, Mönchengladbach

## Installing Skills

Copy the `.claude/skills/` directory into your project or home directory:

```bash
# Project-level (applies to one project)
cp -r .claude/ /path/to/your/project/

# Global (applies to all projects)
cp -r .claude/ ~/.claude/
```

Claude Code will automatically pick up skills from `.claude/skills/` in both your project directory and `~/.claude/`.
