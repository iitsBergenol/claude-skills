---
name: dependency-health
description: Activate this skill after generating code that introduces new dependencies, or when the user asks to check, audit, or validate dependencies. Checks each dependency's GitHub repo for stars, recency of latest release, open pull requests, and open issues.
version: 1.0.0
---

# Dependency Health Check

After generating code with dependencies, automatically audit each dependency against the health criteria below. Do this without being asked.

## Thresholds (defaults — override if the user specifies different values)

| Criterion | Threshold |
|---|---|
| Minimum GitHub stars | ≥ 50 |
| Latest release age | ≤ 6 months |
| Open pull requests | < 50 |
| Open issues | < 100 |

## Process

1. **Identify all dependencies** introduced or present in the generated code. Check the relevant manifest file for the project's ecosystem:
   - JavaScript/TypeScript: `package.json`
   - Python: `requirements.txt`, `pyproject.toml`, `Pipfile`
   - Java/Kotlin: `pom.xml`, `build.gradle`
   - Go: `go.mod`
   - Rust: `Cargo.toml`
   - Ruby: `Gemfile`
   - .NET: `*.csproj`, `packages.config`

2. **Find the GitHub repository** for each dependency. Use `WebSearch` to locate it if not immediately obvious from the package name.

3. **Fetch health data** for each dependency using `WebFetch` on the GitHub API:
   - Stars: `https://api.github.com/repos/{owner}/{repo}`
   - Latest release date: `https://api.github.com/repos/{owner}/{repo}/releases/latest`
   - Open PRs: `https://api.github.com/repos/{owner}/{repo}/pulls?state=open&per_page=1` — use the `Link` header to get the total count, or fetch `https://api.github.com/search/issues?q=repo:{owner}/{repo}+type:pr+state:open`
   - Open issues: `https://api.github.com/search/issues?q=repo:{owner}/{repo}+type:issue+state:open`

4. **Evaluate each dependency** against all four thresholds.

5. **Report results** in a concise table (see format below).

6. **Recommend action** for any dependency that fails one or more checks.

## Output Format

Present results as a markdown table:

```
## Dependency Health Check

| Dependency | Stars | Latest Release | Open PRs | Open Issues | Status |
|---|---|---|---|---|---|
| example-lib | ⭐ 1.2k | 2 months ago | 12 | 34 | ✅ OK |
| old-package | ⭐ 23 | 14 months ago | 67 | 210 | ❌ FAIL |
```

For each failing dependency, add a brief note below the table:

```
### Issues found

- **old-package**: Only 23 stars (min: 50), last release 14 months ago (max: 6), 67 open PRs (max: 50), 210 open issues (max: 100). Consider replacing with [alternative] or verify this is intentional.
```

## Status icons

- ✅ **OK** — passes all checks
- ⚠️ **WARN** — fails 1 check
- ❌ **FAIL** — fails 2 or more checks

## Notes

- If a dependency has no GitHub repository (e.g. it's on GitLab, Bitbucket, or a private registry), note this and skip the GitHub-specific checks. Check for an equivalent public page if possible.
- If the GitHub API rate limit is hit (HTTP 403/429), note it and check as many dependencies as possible before stopping.
- Dev dependencies (devDependencies, test-only, build tools) can use relaxed thresholds — halve the star minimum (≥ 25) and double the issue/PR limits — since they do not ship to production. Mention this distinction in the report.
- If the user specifies custom thresholds (e.g. "minimum 500 stars"), use those instead of the defaults for the entire session.
