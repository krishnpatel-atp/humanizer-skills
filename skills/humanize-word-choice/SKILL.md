---
name: humanize-word-choice
description: Do a focused vocabulary pass that replaces stock AI words and phrases (delve, crucial, pivotal, underscore, leverage, seamless, robust, tapestry, testament, landscape, foster, showcase, "plays a key role", "serves as", "it's important to note") with plain, precise words chosen by meaning, without restructuring the text. Uses an era-by-era word list drawn from Wikipedia's "Signs of AI writing" and corpus studies of post-2022 writing. Use when the user asks to fix word choice, remove AI words, simplify vocabulary or "make it sound less like ChatGPT" at the word level.
license: MIT
metadata:
  version: "1.0.0"
---

# Humanize word choice

A light-touch pass: change words and phrases, keep structure. For deeper rewrites, use the genre skills or the main `humanizer` skill.

The full list with replacements is in `references/word-list.md`. Read it before starting.

## Rules

1. **Density matters, not single words.** One "crucial" in a long document is normal English. Flag clusters: several list words in one paragraph, or the same word repeated.
2. **Replace by meaning.** Ask what the word is doing. "Plays a pivotal role in" usually means "causes," "controls" or "is part of." Pick the precise verb.
3. **Prefer cutting to swapping.** "It is important to note that the deadline moved" → "The deadline moved."
4. **Use "is" and "has."** "serves as" → "is"; "boasts" → "has."
5. **Don't swap tic for tic.** Replacing every "crucial" with "critical" changes nothing. Vary, and often delete.
6. **Respect technical senses.** "robust regression," "key" in databases, "landscape" mode, "underscore" character, "leverage ratio" in finance.
7. **Respect quotes, titles and names.** Never edit words inside quotations or proper nouns.
8. **Keep register.** Don't make formal text slangy or casual text stiff.

## Fast checklist (highest-yield words first)

delve · underscore · highlight (verb) · crucial · pivotal · vital · key (adj.) · leverage · utilize · facilitate · enhance · bolster · foster · robust · seamless · comprehensive · intricate · nuanced · multifaceted · landscape · realm · tapestry · testament · showcase · garner · boast · meticulous · vibrant · navigate · embark · additionally · furthermore · moreover · notably · ultimately · myriad · plethora · ever-evolving · game-changer · cutting-edge · unlock · elevate · empower · quietly · align with · interplay

Phrases: "in today's … world" · "it's worth noting" · "when it comes to" · "plays a … role in" · "serves as a testament to" · "a deep dive" · "navigate the complexities" · "in the realm of" · "at the end of the day" · "stay ahead of the curve"

## Output

Return the edited text. If the user wants to see changes, list them as `old → new` pairs, grouped, with a count. Don't restructure sentences beyond what the replacement needs; if structure is the real problem, say so and suggest the fuller humanizer pass.
