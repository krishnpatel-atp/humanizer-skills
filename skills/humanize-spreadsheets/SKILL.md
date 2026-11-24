---
name: humanize-spreadsheets
description: Make spreadsheets, CSVs, tables and dashboards look built by a careful analyst instead of generated - live formulas instead of pasted numbers, plain sentence-case headers, no emoji or "Key Insights" filler, honest precision, cited assumptions. Use when the user asks to humanize, clean up, de-AI or make professional an Excel/Google Sheets file, table, chart labels or a summary tab, or when reviewing an AI-built workbook.
license: MIT
metadata:
  version: "1.0.0"
---

# Humanize spreadsheets

A spreadsheet reads as machine-made less from its words than from its structure: dead numbers where formulas should be, decoration standing in for organization, and summary prose nobody asked for. Also read `references/core-patterns.md` for text inside the sheet (notes, summary tabs, chart titles).

## Never change

- Data values, row order or meaning. If you think a number is wrong, flag it; don't "fix" it silently.
- A formula's result. If you restructure a formula, confirm the outputs match before and after.
- Sheet or column names that other sheets, scripts or pivot tables reference, unless you update every reference.

## Tells and fixes

| Tell | Why it reads as generated | Fix |
|---|---|---|
| ★ Hardcoded totals and derived values | AI tools often paste computed numbers instead of formulas; changing an input leaves the total wrong (reported by ICAEW and others) | Replace with live formulas (`=SUM(B2:B13)`). Check a few cells: formula or value? |
| ★ Placeholder rows | "Item 1, Item 2", "Client A", "$X,XXX", "TBD" left in | Fill from the user's data, or ask. Never invent rows |
| Uncited, too-neat numbers | Growth of exactly 15%, 25%, 40% with no source | Move assumptions to a labelled Assumptions block with a source or "estimate (owner, date)" |
| False precision | 37.4829% next to rounded inputs | Match precision to the data: whole % or one decimal; currency to cents only if it matters |
| Emoji in headers or status | ✅ Done, 🚀 Revenue, 📈 Growth | Plain text; use conditional formatting or a Status column with fixed values (Done / In progress / Blocked) |
| Title Case Every Header | "Total Monthly Recurring Revenue Amount" | Short sentence case with units: "MRR ($)" or "Monthly revenue (USD)" |
| Units buried or missing | "Revenue" with no currency/period | Put units in the header: "Revenue (USD, thousands)" |
| "Key Insights" / "Summary" text box of AI prose | Restates the chart in inflated words ("showcasing robust growth") | Delete, or replace with 1–3 plain lines carrying a number each: "Q3 revenue up 12% vs Q2, driven by the EU launch." |
| Rainbow formatting | Every row a different fill, borders on everything, bold everywhere | One header style, light banding or none, highlight only what needs attention |
| Merged cells for looks | Breaks sorting, filtering and formulas | Use "Center across selection" or leave unmerged |
| Notes column of filler | "This represents a key metric that is crucial for tracking" | Notes only where something is unusual: source, caveat, exception |
| Chart titles as headlines-with-colons | "Revenue Trends Over Time: A Comprehensive Overview" | Title states the finding: "Revenue grew every month except August" |
| Overbuilt structure | 7 tabs for a 40-row dataset; dashboards nobody requested | Fewest tabs that work: Data, Calculations (if needed), Summary |
| Inconsistent conventions | Mixed date formats, "N/A", "-", "0", blank for missing | One date format (ISO `2026-11-23` or the user's locale), one missing-value convention, stated once |

## How a human analyst lays it out

- Inputs and assumptions in one clearly labelled place, visually distinct (e.g., blue font for hardcoded inputs, black for formulas, a common finance convention).
- Calculations reference inputs; nothing typed twice.
- A short README or Notes tab only if the workbook will be handed to someone: purpose, source, date pulled, owner.
- Names that match how the team talks ("Churned accounts," not "Customer Attrition Count Metric").

## Workflow

1. Open every sheet. List formulas vs hardcoded values in calculated columns.
2. Fix structure first (formulas, units, consistent formats), then text (headers, notes, titles), then formatting.
3. Recalculate and compare key totals to the original. They must match unless you flagged an error.
4. Report: what changed, any numbers you think are wrong, any assumptions that need a source.

For CSVs: there's no formatting or formulas, so focus on header names, units, consistent values and missing-data conventions.
