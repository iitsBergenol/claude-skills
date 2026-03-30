#!/bin/bash
source="$(dirname "$0")/.claude/skills"
destination="$HOME/.claude/skills"

mkdir -p "$destination"
cp -rf "$source"/. "$destination/"
echo "Skills copied to $destination"
