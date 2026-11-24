# humanizer-skills

Nine Agent Skills that make AI-drafted work read like a careful person made it, for Claude chat (claude.ai / Claude Desktop) and Claude Code.

They remove the patterns readers recognize as chatbot output (stock words like *delve* and *underscore*, "it's not X, it's Y" contrasts, bold-label bullet walls, emoji headings, slogan closers, "I hope this helps" residue, hardcoded spreadsheet totals, step-narrating code comments) while keeping every fact, number, citation and the writer's own voice.

They do **not** promise to beat AI detectors, and they never invent facts, sources, data or personal stories to sound human.

## The skills

| Skill | For | Main fixes |
|---|---|---|
| `humanizer` | Anything; routes to the right genre rules | 25 cross-genre tells, rewrite workflow, fact check |
| `humanize-spreadsheets` | Excel, Google Sheets, CSV, dashboards | Live formulas instead of pasted numbers, plain headers with units, no emoji or "Key Insights" filler, honest precision |
| `humanize-slides` | PowerPoint, Google Slides, Keynote, pitch decks | Claim-style titles (assertion–evidence), one idea per slide, no emoji bullets or filler slides |
| `humanize-documents` | Reports, memos, proposals, READMEs, SOPs | Bottom line first, fewer headings, prose over bold-label bullets |
| `humanize-research-papers` | Papers, abstracts, theses, grants | Remove measured "excess vocabulary," keep real hedging, never touch citations or results |
| `humanize-emails` | Email, Slack/Teams, cover letters, outreach | Ask in line one, cut stock openers and closers, no report formatting in short notes |
| `humanize-essays` | Essays, blogs, op-eds, personal statements | Break the five-paragraph template, take a position, vary rhythm, ask for real details |
| `humanize-word-choice` | A quick vocabulary-only pass | Era-by-era AI word list with plain replacements |
| `humanize-code` | Code, comments, docstrings, commits, PRs | Comments that explain *why*, repo-matching names, no swallowed errors, human commit messages; behavior unchanged |

Every skill ships with `references/core-patterns.md` and `references/word-list.md`, so each zip works on its own.

## Install

### Claude chat (claude.ai or Claude Desktop)

1. Go to **Settings → Capabilities** (called *Features* or *Skills* on some plans) and make sure Skills are enabled.
2. Upload a zip from `dist/`. Upload `humanizer.zip` for the all-rounder, and any genre zips you want; each one is a separate skill.
3. Use it by asking naturally: "Humanize this email," "De-AI my slide titles," "Fix the word choice in this paragraph."

Menu names change between app versions; if you can't find the upload button, search the Claude help center for "custom skills."

### Claude Code

**Option A: plugin (from GitHub, after you push this repo):**

```
/plugin marketplace add krishnpatel-atp/humanizer-skills
/plugin install humanizer-skills@humanizer-skills
```

**Option B: copy the folders (works offline, no GitHub needed):**

```bash
mkdir -p ~/.claude/skills && cp -R skills/* ~/.claude/skills/
```

For one project only, copy into `.claude/skills/` inside that project instead. Restart Claude Code; skills are picked up automatically, and you can call one directly with `/humanizer`, `/humanize-code`, etc.

## Put it on GitHub

```bash
cd humanizer-skills
git init && git add . && git commit -m "Initial humanizer skills"
gh repo create humanizer-skills --public --source=. --push
```

Then replace `krishnpatel-atp` in `.claude-plugin/marketplace.json` and this README. Anyone can then download the repo with **Code → Download ZIP**, or install it as a Claude Code plugin.

`dist/` is git-ignored. To publish the zips, attach them to a GitHub Release, or remove `dist/` from `.gitignore`.

## Editing and rebuilding

- Edit the shared lists in `shared/` and the genre rules in `skills/<name>/SKILL.md`.
- Run `bash scripts/build.sh`. It copies the shared references into every skill, copies each genre's rules into `skills/humanizer/references/`, and rebuilds every zip in `dist/`.

## Layout

```
humanizer-skills/
├── .claude-plugin/        plugin.json, marketplace.json (Claude Code plugin)
├── shared/                core-patterns.md, word-list.md (single source)
├── skills/
│   ├── humanizer/         SKILL.md + references/ (all genres)
│   ├── humanize-spreadsheets/
│   ├── humanize-slides/
│   ├── humanize-documents/
│   ├── humanize-research-papers/
│   ├── humanize-emails/
│   ├── humanize-essays/
│   ├── humanize-word-choice/
│   └── humanize-code/
├── scripts/build.sh
└── dist/                  upload-ready zips (one per skill + all-in-one)
```

## Research basis

Cross-genre patterns and the word list:
- Wikipedia, ["Signs of AI writing"](https://en.wikipedia.org/wiki/Wikipedia:Signs_of_AI_writing), WikiProject AI Cleanup. Source of the era-by-era vocabulary table and the warning that no single sign is proof.
- [blader/humanizer](https://github.com/blader/humanizer) (MIT). The pattern taxonomy here builds on its 26 patterns.
- Kobak et al. (2024), [Delving into ChatGPT usage in academic writing through excess vocabulary](https://arxiv.org/abs/2406.07016).
- Juzek & Ward (2024), [Why does ChatGPT "delve" so much?](https://arxiv.org/abs/2412.11385)
- Kousha (2025), LLM-associated terms across scholarly databases ([Scientometrics](https://link.springer.com/article/10.1007/s11192-026-05601-5)).
- Language Log, [Are LLMs writing PubMed articles?](https://languagelog.ldc.upenn.edu/nll/?p=64877), a caution that "delve" was rising before 2022.

Genre-specific:
- Spreadsheets: ICAEW, [AI in Excel: the pros and cons](https://www.icaew.com/insights/viewpoints-on-the-news/2026/jan-2026/ai-in-excel-the-pros-and-cons) and [the best and worst GenAIs for spreadsheets](https://www.icaew.com/insights/viewpoints-on-the-news/2025/oct-2025/the-best-and-worst-genais-for-spreadsheets); Microsoft, [COPILOT function](https://support.microsoft.com/office/copilot-function-5849821b-755d-4030-a38b-9e20be0cbf62) guidance to use native formulas when accuracy matters.
- Slides: Plus AI, [How to make AI-generated slides that don't look like AI slop](https://plusai.com/blog/how-to-make-ai-slides-that-dont-look-like-ai-slop); Presentations.AI, [Common AI presentation mistakes](https://www.presentations.ai/blog/common-ai-presentation-mistakes); NCC Group, [Unmasking techno-sophists](https://www.nccgroup.com/media/l5cjcey2/unmasking_techno_sophists.pdf) (emoji bullets); Michael Alley's assertion–evidence approach.
- Emails: PCWorld, [6 red flags that message was written by ChatGPT](https://www.pcworld.com/article/3101116/busted-6-red-flags-that-message-was-written-by-chatgpt.html); QuillBot, [How can you tell an email was written using generative AI?](https://quillbot.com/blog/frequently-asked-questions/how-can-you-tell-an-email-may-have-been-written-using-generative-ai)
- Essays: QuillBot, [Burstiness and perplexity](https://quillbot.com/blog/ai-writing-tools/burstiness-and-perplexity/); [AI-generated essays: characteristics and implications](https://arxiv.org/pdf/2410.17439); VU Amsterdam, [guide to spotting AI writing](https://vu.nl/en/about-vu/more-about/alp-guide-spotting-ai-writing).
- Code: Greptile, [How to detect AI-generated code](https://www.greptile.com/content-library/how-to-detect-ai-generated-code); DEV Community, [Why AI-generated code feels weird](https://dev.to/unknown_destroyer_f353870/why-ai-generated-code-feels-weird-1bd2).

Most genre-specific sources are practitioner write-ups, not controlled studies. Treat the tells as editing prompts, not detection rules.

## License

MIT. See [LICENSE](LICENSE).
