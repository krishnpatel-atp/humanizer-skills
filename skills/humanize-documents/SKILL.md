---
name: humanize-documents
description: Rewrite reports, memos, proposals, READMEs, wiki pages and other workplace documents so they read like a clear human author - bottom line first, sentence-case headings, prose instead of bold-label bullet walls, no "This document outlines" or "In today's evolving landscape" filler, no inflated significance. Use when the user asks to humanize, tighten, de-AI or make professional a doc, report, memo, proposal, policy, SOP or README.
license: MIT
metadata:
  version: "1.0.0"
---

# Humanize documents

Generated documents over-structure and under-say: many headings, bold-label bullets, a summary that summarizes nothing, and sentences about the document instead of the subject. Also read `references/core-patterns.md` and `references/word-list.md`.

## Structure

- **Bottom line up front.** The first paragraph says the conclusion, decision or request. Background comes after, and only as much as the reader needs.
- **Headings only where a reader would navigate.** A two-page memo may need none. Sentence case: "Costs and timeline," not "Costs And Timeline Overview."
- **Prose for reasoning, lists for parallel items.** Steps, requirements and options can be lists. An argument is a paragraph.
- **No mirror sections.** "Introduction" that previews, "Conclusion" that repeats. If the doc is short, cut both.
- **Tables when comparing on several attributes.** Not for two items with one attribute.

## Tells and fixes

| Tell | Example | Fix |
|---|---|---|
| ★ Writing about the document | "This document outlines…", "The following section will explore…" | Delete; start with the content |
| ★ Bold-label bullet walls | "**Efficiency:** The system enhances…" ×8 | Plain bullets or two paragraphs |
| ★ Generic opener | "In today's rapidly evolving landscape…" | Start with the specific situation |
| Executive summary that lists topics | "This report covers costs, risks and next steps." | Give the findings: "Costs rise 8%; the main risk is vendor lock-in; we recommend option B." |
| Inflated significance | "a pivotal milestone that underscores our commitment" | What happened and what it changes |
| Challenges-then-optimism formula | "Despite these challenges, the future looks bright." | State the risk and the plan for it |
| Heading repeated in first line | "## Budget" → "The budget is an important consideration." | First line carries new information |
| Vague owners and dates | "Steps will be taken soon." | Who does what by when |
| Passive hiding the actor | "Mistakes were made." | Name the actor when it matters |
| Emoji headings and arrows | "🚀 Next Steps →" | Plain heading |
| Horizontal rule between every section | `---` everywhere | Remove; headings already separate |
| Over-hedged recommendations | "It may potentially be worth considering…" | "We recommend…" (keep real uncertainty, stated once, with its reason) |

## READMEs and technical docs

- Open with what it is and who it's for in one or two sentences, then install and a working example.
- Cut "🚀 Features" emoji lists, badges nobody maintains, and "Contributing" boilerplate for a personal project.
- Every command should be copy-pasteable and tested. Don't invent flags or config keys.

## Workflow

1. Find the one thing the reader must take away. Put it first.
2. Collapse unnecessary headings; convert bold-label bullets to prose or plain bullets.
3. Run the tell scan; rewrite paragraphs as wholes.
4. Keep all facts, figures, names, dates, links, defined terms, legal or policy wording, and required template sections. If a template mandates a heading, keep it and make its content better.
