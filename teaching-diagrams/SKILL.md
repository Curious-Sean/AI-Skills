---
name: teaching-diagrams
description: Turn learning material into a teaching diagram in the vault, built as a map with offloaded detail. Use when the user wants the relationships between concepts drawn, or when tutor offers a diagram.
---

# Teaching diagrams

Learning material becomes one diagram note in the vault, built as a **map** with **offloads**. Learning material is required: a lecture note, a PDF or another file the user passes at invocation or earlier in the session. The conversation alone is not a source.

The medium is Mermaid. It renders in Obsidian without a plugin, and a syntax error shows itself, where wrong CSS renders wrongly in silence. Use an `html` block only when the user names HTML.

At a direct invocation, load [`didactics/SKILL.md`](../didactics/SKILL.md) in full and the subject file `../learning-goals/faecher/<subject>.md` yourself: a diagram needs the yardstick of what is worth showing. A session summary belongs to a guided session and does not happen here.

## Step 1: Pretest

Announce at the start of the session that a short recall comes first. Then run [`free-recall`](../free-recall/SKILL.md) in pretest mode: opening question, comparison against `Success looks like`, one short gap feedback. No hint loop, no probing.

The gaps are said here. The finished picture shows the complete target without marking which parts came from the recall.

## Step 2: Analyse

Examine the structure and the patterns of the material and match them against `Success looks like` to find the main concepts and relationships. Analyse only the parts a learning goal claims, per **Analyse before acting** in `didactics`.

## Step 3: Propose outlines

Read [`reference/type-inventory.md`](reference/type-inventory.md).

Offer two or three **complete** outline variants, each with its reasoning, its blocks, and the diagram type chosen for each block. The number of blocks follows the material, not a rule. Justify the form in one sentence per variant: "Ich zeige das als X, weil die Y, nicht die Z, die Erkenntnis trägt." One variant answers with a type other than `flowchart`, so the habit form has to win against a real alternative.

Where a variant's map type cannot carry the colour coupling, say so with the variant rather than after building it. The inventory says which types carry it.

Wait for the user to choose or adjust before drawing anything.

## Step 4: Draw

Read [`reference/drawing-conventions.md`](reference/drawing-conventions.md) and the one example in [`examples/`](examples/) whose map type fits the chosen variant.

The structure follows the logic of the material. `Success looks like` is the guard rail, not the outline template.

| Rule | How it holds |
|---|---|
| Build | The note is frontmatter, then the map heading `# <span style="color:#000000">Karte</span>`, then the offloads as headings one level below it. Obsidian titles the note from its filename, so the map heading is the first line after the frontmatter. An offload may itself be a map and carry its own offloads, one level deeper again. Every heading under the map is an offload or belongs to one; material that bears on the whole subject gets its own `#` heading after the offloads |
| Map | The map carries the relationships **between** the groups, the offload carries the inside of one group |
| Coupling | An offload and its place in the map carry the same colour and the same word. In practice a coloured detail heading, `<span style="color:#hex">Titel</span>`, in the hex the container carries in the map. Where the map type takes no colour, per the inventory, the word alone couples and the heading stays black, as it does at the map and at any `#` heading beside it. No number needed |
| Cross-reference | Allowed. Inside an offload it stays visible when a concept belongs to another group. How, you decide |
| Colour | Each colour carries exactly one meaning, sayable in one sentence and tied to a learning goal. The coupling above is one such system, not the only allowed one |
| Density | No node count. A picture that grows too dense gets offloaded. As an option, show the same material a second time in another type at another level |
| Nodes | Concepts, never instance data. A case example may illustrate, never form the structure |

**Relation check, first.** Walk the drawn lines once as a reader and say aloud what each one claims. Three findings end the walk: a line whose claim does not come out as one sentence, which gets a label, another style, or removal; a relation of the material that the picture leaves to adjacency, which gets drawn; and a relation already drawn somewhere else in the same form, which gets deleted at one of the two places. Another type at another level is the second showing **Density** allows, where it adds granularity the first cannot carry. The doubled one hides across levels, so read map, offload and table against each other, and check at both ends of every line whether it means the node or its whole frame. A comparison counts as a relation: two concepts the learner has to tell apart belong in one frame, on one line, or in one table.

**Remove test, second.** Can a node go? Can two nodes become one because they always appear together? Can an arrow go because the arrangement already shows the relationship? Can a label go?

**Coverage check closes this step.** every concept that `Success looks like` marks as relevant appears in the document.

## Step 5: Save

Run `scripts/check-mermaid.sh <file>` and `scripts/check-blanks.sh --fix <file>` before saving. The first has to pass, the second normalises the blank lines and says what it changed.

Both are text checks, so the picture stays unproven: a renderer drops styling it does not support in silence. Ask the user to open the saved note once in Obsidian and report whether every coloured container shows its colour and whether the map stays legible. What fails there goes back to the type choice in Step 3.

One new note per invocation, in the subject's vault folder, named after the topic. Mark the AI provenance per [`didactics/reference/source-marking.md`](../didactics/reference/source-marking.md). Called from `tutor`, also write a wikilink to the new note from the running note.
