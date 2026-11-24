
# Humanize slides

Generated decks share a look: topic-label titles, three bullets per slide, emoji or stock-icon bullets, symmetrical layouts, and padding to hit a slide count. A human deck argues something. Also read `references/core-patterns.md` for the wording on each slide.

## The main fix: titles that make a claim

Use the **assertion–evidence** structure (Michael Alley's research on engineering and science talks): the title is a full-sentence claim, the body is the evidence (chart, image, diagram, number), not a pile of bullets.

| Generated title | Human title |
|---|---|
| Market Overview | The mid-market segment grew 3x faster than enterprise last year |
| Key Challenges | Onboarding takes 19 days; competitors do it in 4 |
| Our Solution | Self-serve setup cuts onboarding to under a week |
| Key Takeaways | We need two more engineers to ship by March |

Reading only the titles in order should tell the whole story. Test this.

## Tells and fixes

| Tell | Fix |
|---|---|
| ★ Topic-label titles in Title Case | Sentence-case claims (above) |
| ★ Emoji or icon bullets (🚀 💡 ✅, lightbulb, gear, handshake, rocket) | Remove. Use an image only if it shows the actual thing |
| Exactly three bullets on every slide | As many as the point needs; often zero (a chart) or one sentence |
| Bullets that are full paragraphs | Cut to the phrase the audience must read; move the rest to speaker notes |
| Bold-label bullets ("**Scalability:** Our platform…") | Plain short phrases |
| Metric tiles with uncited numbers ("98% satisfaction", "10x ROI") | Real numbers with source and date in small text, or remove |
| Agenda slide listing every section in Title Case | Cut for short talks; for long ones, a one-line roadmap |
| Filler slides to hit a count ("Why This Matters," "Our Commitment") | Merge or delete. Fewer slides is fine |
| "Conclusion" + "Key Takeaways" + "Thank You!" + "Questions?" | One closing slide: the decision or ask, plus contact if needed |
| Inflated language ("revolutionize," "seamless," "unlock synergies," "cutting-edge") | The concrete effect, with a number |
| Perfect symmetry everywhere (2×2 grids, three columns, same layout every slide) | Layout follows content; a big chart slide next to a one-line slide is normal |
| Speaker notes that repeat the slide or read like an essay | Notes are cues: the extra fact, the transition, the example you'll tell |
| Generic stock photos (handshakes, people pointing at screens) | Product screenshots, real photos, or nothing |

## Speaker notes

Write how the presenter talks: short, spoken sentences, contractions, the specific example. "Mention the Acme pilot here: they went from 3 weeks to 5 days." Not "This slide highlights the transformative impact of our solution."

## Workflow

1. Read every slide title in order. Write the one-sentence argument of the deck. If you can't, ask the user what the deck should convince people of.
2. Rewrite titles as claims that build that argument.
3. Strip each slide to the evidence for its title. Move overflow to notes or an appendix.
4. Cut or merge slides that don't advance the argument; tell the user which and why.
5. Keep all real data, names and figures. Never invent statistics, quotes, logos or customer names to fill a slide.

When editing a .pptx file, change text only unless asked to redesign; preserve the template, theme, and slide master.
