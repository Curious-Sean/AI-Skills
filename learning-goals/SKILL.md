---
name: learning-goals
description: Elicit and record what the user must be able to do in a subject, one goals file per subject. Use when a subject is set up, when its goals change, or when another learning skill finds the subject file missing.
---

# Learning goals

One file per subject carries the yardstick that `tutor`, `free-recall` and `teaching-diagrams` measure every learning action against. This skill writes it together with the user.

The file fits on one screen. Anything longer has stopped being a compass and become a plan.

## Files

Paths are relative to this skill folder, which is mounted in every session.

| Path | Content | Written by |
|---|---|---|
| `jahr.md` | Year level above all subjects, including the depth filter | this skill |
| `faecher/<subject>.md` | Subject goals | this skill |
| `faecher/<subject>-schwaechen.md` | Weakness list of the subject | `tutor`, `free-recall` |

`<subject>` is literally the name of the vault folder holding that subject's PDFs, for example `orl`. There is no registry mapping subject names to folders.

## Step 1: Name the subject

The user names the subject. If no name is given, ask once and wait for the answer. Infer nothing from the conversation so far.

## Step 2: Fit-check

Read `faecher/<subject>.md`, then act by case:

| Case | Action |
|---|---|
| Exists and fits the task at hand | Name the goals that bear on the task and stop. No interview. |
| Exists, one part does not fit | Discuss that part alone, update it, stop. |
| Missing | Go to step 3. |

## Step 3: Interview

Read [`MISSION-FORMAT.md`](MISSION-FORMAT.md) for the field set and the Bloom categories. Walk the seven fields in the order given there, one at a time, and write the user's own words.

Read `jahr.md` first and draft from it every field it already answers, then show the draft for correction. The interview then runs on the fields that have no answer yet.

Three rules the format file does not carry:

- Under `Success looks like`, an entry is an observable performance statement ("can name the four stages of heart failure"), not a topic name ("heart failure").
- The six Bloom categories are a completeness checklist. Read them out so no kind of goal is forgotten. A category that stays empty is a normal result; leave it empty or drop the heading.
- Assign an entry to whichever category comes to mind and move on. No other file reads the category, so the assignment is never worth discussing.

Done when every one of the seven fields carries the user's words or is deliberately empty.

## Step 4: Baseline and sequence

The baseline comes from one short recall, not from a self-rating: what the user produces right now is the more reliable measure, and it costs about the same. Run [`free-recall`](../free-recall/SKILL.md) in pretest mode over the subject as a whole, in writing. A sketch belongs to the first real recall, not to the setup.

Write `Current baseline` from what came back, one line per topic in the user's words. Every topic stays in the `Sequence` and every entry under `Success looks like`, whatever it shows.

Then propose the `Sequence` yourself, derived from `Why`, `Constraints` and `Current baseline`: one line per topic, in working order, topic level only. The user knows the exam dates and the lecture order, so take their correction as given.

## Step 5: Write the file

Write `faecher/<subject>.md` and tell the user the path. Done when the file carries all seven fields with the divider between the compass and the running part, and fits on one screen.

## Cutting under time pressure

When time runs short, `Out of scope` grows and `Success looks like` shrinks. The deadline stays where it is. Every cut is written into the file, so the user sees what they gave up.
