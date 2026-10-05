# Priority markers

Shared tag semantics for the markers the user writes into their own notes. Single source of truth for what each marker means and which skill acts on it. Read by `structure-clinical-notesv2`.

A marker does two things: it scopes when external research is warranted, and it triggers or proposes a follow-up action on an annotated note.

## Marker table

| Marker | Meaning | Consequence |
|---|---|---|
| `#_1_` | Does not understand the subtopic | Explain, research if needed |
| `#_1Beg_` | Term unclear | Research, then explain |
| `#_1Nachschlag_` | Wants to look it up, unclear point to be settled | **Auto-research in the note's own PDF or document first**; report the result briefly; a correction still needs confirmation |
| `#_1Nachschlag_S_` | Wants to look it up personally | **No AI action.** Marker only |
| `#_1Frag_` | A specific question | Answer it, research if needed |
| `#_1Unsicher_` | Unsure whether this is correct | **Auto-research in the note's own PDF first**; offer a correction |
| `#_1Unsicher_S_` | Unsure, and **no AI action** wanted | Marker only, no automatic research |
| `#_1Wisdom_` | Wants a wisdom deep dive | In `teach-md-light`: two or three case examples plus error analysis |
| `#_1Unsortiert_` | State marker: the note or passage is unsorted | `structure-clinical-notesv2`: propose a full restructuring; once done, **propose** removing the marker (needs confirmation, recorded in the change table) |

**The `_S` suffix means skill-respected:** the AI does not process this marker. No automatic action, no proposed change.

## Which skill acts on which marker

**Explanation markers** (`#_1_`, `#_1Beg_`, `#_1Frag_`, `#_1Wisdom_`) belong to `teach-md-light`, which closes the gap. For `#_1Wisdom_` it runs two or three case examples plus an error analysis instead of a recall sequence, per the table row above.

**State and fact markers** (`#_1Unsortiert_`, `#_1Unsicher_`, `#_1Nachschlag_`) stay with `structure-clinical-notesv2`, either as a restructuring pass or as auto-research in the PDF first.

`structure-clinical-notesv2` reports explanation markers collectively at the end and points to `teach-md-light`, rather than processing them. `quiz-from-notes` asks a wisdom marker as one ordinary application question.

**One deep dive only.** The wisdom deep dive (two or three case examples plus error analysis) happens exactly once, in `teach-md-light`. `quiz-from-notes` and `structure-clinical-notesv2` do not duplicate it.

## Zustands-Marker-Regel

Transient state markers (currently only `#_1Unsortiert_`) describe the state of the note, not its knowledge content, so the AI may propose removing one once the action is done.

Content, priority and source markers stay as they are: never removed, never renamed. One exception, only with confirmation and recorded in the change documentation: a resolved content marker that has an AI line next to it may be replaced by `#source_KI` (form in [`source-marking.md`](source-marking.md)).

Every removal proposal needs confirmation and goes into the skill's change documentation.

## Spelling variants

`#2Unsortiert_` and `#_2Unsortiert_` are older forms of `#_1Unsortiert_` and are treated the same way. Bases views filter by substring, the skills match exactly.

## Labelling research results

When a marker triggers research, the result carries the shared inline form and cites the source: `#source_KI <Text> (Quelle: ...)`. Form: [`source-marking.md`](source-marking.md).
