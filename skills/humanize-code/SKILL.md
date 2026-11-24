---
name: humanize-code
description: Clean up AI-generated code so it reads like a thoughtful engineer on the team wrote it - comments that explain why instead of restating what, no step-numbered or emoji comments, docstrings sized to the function, names that match the codebase, no defensive try/except that swallows errors, no unused abstractions, plus human commit messages, PR descriptions and READMEs - without changing behavior. Use when the user asks to humanize, de-AI, clean up, de-slop or make idiomatic code, comments, commits, PRs or docs, especially in Claude Code.
license: MIT
metadata:
  version: "1.0.0"
---

# Humanize code

Generated code usually works; its tells are about fit. Comments narrate the obvious and skip the tricky parts, every function gets a docstring, names are either generic (`data`, `result`, `temp`) or sentence-long, errors are caught and logged into silence, and the style doesn't match the rest of the repo. Reviewers notice. Also read `references/core-patterns.md` for the prose parts (commit messages, PRs, docs).

## Prime directive: behavior doesn't change

- Run the tests, linter, type checker and build before and after. If there are no tests, say so, and keep changes to comments, names and dead code.
- Renames: update every reference; check exports and public APIs. Don't rename public interfaces without asking.
- Removing a `try/except` changes behavior. Flag it and propose the change; apply only if the user agrees or the swallow is clearly a bug.
- Match the repo first. Read neighboring files for naming, comment density, docstring style, error handling and formatting. The codebase's conventions beat this list.

## Tells and fixes

### Comments

| Tell | Fix |
|---|---|
| ★ Comments restating the code (`# increment counter` above `i += 1`) | Delete |
| ★ Step narration (`# Step 1: Initialize the list`, `# Now we loop through…`) | Delete; extract a well-named function if the steps matter |
| Emoji or banner comments (`# 🚀 Main logic`, `# ===== HELPERS =====`) in a repo that doesn't use them | Delete |
| Uniform, polished comments on everything; nothing on the tricky part | Comments only where a reader would ask "why?": business rules, workarounds, non-obvious constraints, links to issues |
| Chat residue (`# Here's the updated function`, `# This should fix your issue`, `# You can adjust this as needed`) | Delete |
| Placeholder comments (`# TODO: implement error handling`, `# Add your logic here`) left in finished code | Implement, or turn into a real TODO with owner/issue if the repo does that |

### Docstrings

- Trivial private helpers don't need one. Public functions follow the repo's style (Google, NumPy, JSDoc…).
- Cut docstrings that repeat the signature ("Args: name (str): The name."). Document units, side effects, raised errors, edge cases.

### Names

- Replace generic names (`data`, `result`, `item`, `temp`, `value1`, `obj`) with domain names (`invoices`, `retry_count`).
- Shorten hyper-descriptive names (`user_account_information_dictionary_list` → `accounts`).
- Use the codebase's vocabulary: if the repo says `customer`, don't introduce `client`.

### Structure

| Tell | Fix |
|---|---|
| `try/except Exception: print/log(...)` that swallows errors | Catch specific exceptions, or let them propagate (flag first; behavior change) |
| Redundant checks (`if x is not None and x != None`, validating already-validated input) | Remove when provably redundant |
| Abstractions for one call site (factory, manager class, config object nobody else uses) | Inline, if tests confirm behavior |
| `print` debug lines, verbose logging on every step | Remove or use the project's logger at the right level |
| Imports or APIs that don't exist or aren't installed (hallucinated packages) | Verify every import; fix or flag. Never add a dependency without asking |
| Inconsistent style within a file (some f-strings, some `.format`) | Match the dominant style, ideally via the project's formatter |
| Magic numbers explained by a comment | Named constant |

### Commit messages

- Imperative subject ≤ ~50 chars, no period: `Fix timezone bug in invoice export`. Not "This commit enhances the robustness of…"
- Body (if needed) explains why and anything surprising. No bullet list of every file touched, no emoji unless the repo uses gitmoji, no "Comprehensive refactor to improve maintainability."
- Follow the repo's convention (Conventional Commits etc.) if `git log` shows one.

### Pull request descriptions

- What changed and why, in a few sentences. How it was tested. Anything the reviewer should look at closely.
- Cut "## 🚀 Summary / ## ✨ Changes / ## 🎯 Impact" scaffolding, bold-label bullets and "This PR significantly improves…"
- Use the repo's PR template if it has one.

### READMEs and docs

- First lines: what it does, for whom. Then install, a working example, configuration.
- Every command copy-pasteable and actually tested. Don't invent flags or env vars.
- Cut emoji feature lists and marketing adjectives ("blazing-fast," "seamless," "powerful").

## Workflow (Claude Code)

1. Read the target files and two or three neighbors; note conventions. Check `git log` for commit style.
2. Run the test/lint/build commands and record the baseline.
3. Edit in small passes: comments → names → dead code → structure. Re-run checks after each pass that touches code.
4. List any behavior-affecting change you're proposing (error handling, removed checks) separately and ask before applying.
5. Report what changed, which checks ran and their results, and anything not verified.
