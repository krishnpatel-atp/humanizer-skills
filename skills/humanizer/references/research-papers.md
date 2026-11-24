
# Humanize research papers

Academic writing has real conventions (hedging, passive voice in methods, formal register). Those are not tells. What gives generated academic text away is a specific excess vocabulary, inflated framing, and residue from the chat. Also read `references/core-patterns.md` and `references/word-list.md`.

## What the research shows

- Kobak et al. (2024), "Delving into ChatGPT usage in academic writing through excess vocabulary": ~14M PubMed abstracts, 2010–2024; at least 10% of 2024 abstracts estimated as LLM-processed, up to ~30% in some subgroups. The signal was style words, not content words.
- Juzek & Ward (2024), "Why does ChatGPT 'delve' so much?": "delve," "intricate," "nuanced" and similar spiked in 2023–24 abstracts.
- Kousha (2025): across six databases, "delve" +1,500%, "underscore" +1,000%, "intricate" +700% after ChatGPT's release.
- Published papers have been caught with chatbot residue ("Certainly, here is a possible introduction for your topic") and fabricated references. Reviewers now look for both.

## Hard rules for academic text

1. **Never add, change or "fix" a citation** you can't verify. Never invent a reference, DOI, page number, author or year. If a citation looks wrong, flag it for the user.
2. **Never change results.** Numbers, p-values, CIs, sample sizes, units, variable names and statistical terms stay exactly as written.
3. **Keep calibrated hedging.** "suggests," "is consistent with," "may" are correct when the evidence is limited. Remove only stacked or empty hedges ("could potentially possibly").
4. **Keep discipline terms of art** even if they're on the word list ("robust standard errors," "key informant").
5. **Disclosure.** Most journals and publishers (and ICMJE guidance) ask authors to disclose substantive AI use, and none allow AI as an author. Mention this once if the user is preparing a submission; check the venue's policy.

## Tells and fixes by section

| Section | Tell | Fix |
|---|---|---|
| Title | "Unveiling," "Delving into," "Navigating the Landscape of," colon + "A Comprehensive Review" | Say what was studied and found: "Sleep loss reduces working memory in adolescents: a cohort study" |
| Abstract | "In recent years, X has garnered significant attention" | Open with the specific gap or question |
| Abstract | "This study delves into… shedding light on… underscoring the pivotal role of…" | "We measured X in Y. X increased by Z." |
| Introduction | Funnel from "the ever-evolving field of" to the topic over a full page | Start one or two steps above your gap, not at "science" |
| Introduction | "Despite significant advances, challenges remain" | Name the specific missing piece and who noticed it (with citation) |
| Literature review | Strings of "Smith (2020) highlighted… Jones (2021) underscored…" | Synthesize by idea: "Three studies found X (A; B; C), but all used self-report." |
| Methods | Sales language ("meticulously designed," "robust framework") | Describe what was done so it can be replicated |
| Results | Interpretation and adjectives in results ("a remarkable increase") | Report the number; interpret in Discussion |
| Discussion | "These findings underscore the crucial importance of…" | State what the findings mean and their limits, with effect sizes |
| Discussion | "Paves the way for," "opens new avenues," "a significant contribution to the field" | Name one concrete next study |
| Limitations | A generic list (sample size, generalizability) disconnected from the study | The specific weaknesses of this design and their likely effect |
| Conclusion | Repeats the abstract with more adjectives | One short paragraph: answer to the question, implication, limit |
| Anywhere | "It is important to note that," "Notably," "Moreover," sentence-initial "Additionally" in every paragraph | Cut; let logic connect sentences |
| Anywhere | ★ Residue: "Certainly, here is…", "As an AI language model", "I cannot access…", "[insert citation]" | Delete; ask the user for the missing citation |

## Academic voice that reads as human

- Specific nouns: "the 2019 Finnish birth cohort," not "the dataset."
- First person where the field allows: "We tested…" is clearer than "It was tested…" outside the methods.
- Claims sized to the evidence, with numbers.
- Paragraphs of different lengths; one idea each, topic sentence first.
- Field-standard words used precisely, not reached for: "shows" vs "suggests" vs "proves" mean different things.

## Workflow

1. Read the full section and its citations. List every number and citation so you can check them afterward.
2. Scan for the excess vocabulary and residue. Rewrite paragraphs, not just words.
3. Preserve the argument order unless the user asked for restructuring.
4. Diff your list of numbers and citations against the rewrite. They must be identical.
5. Return the edit and a short list of anything you flagged (suspicious citations, unsupported claims, placeholders).
