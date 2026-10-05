---
name: tutor
description: Lead a learning session against the user's learning goals and offer the right tool per turn. Use to start a study session on a subject.
argument-hint: <subject>
---

# Tutor

The entry point for a learning session. This file decides the scope, the tool and the end of the session. Everything that works pedagogically lives one level down, in `didactics` and in the tools, so it works on a direct invocation too.

## Step 1: Subject and goals

The user names the subject, written literally as the vault folder holding its PDFs. If it is missing, ask once and wait. Do not infer it from the conversation.

Read `../learning-goals/faecher/<subject>.md`. If the file is missing, load [`learning-goals`](../learning-goals/SKILL.md) and elicit the goals before any content work.

## Step 2: Didactics

Read [`../didactics/SKILL.md`](../didactics/SKILL.md) in full. The tone and every principle of the session come from there and are never restated here, so one change to that file changes every path.

## Step 3: Lead the session

The user names the **scope** of the session: it swings between one question they did not understand and a whole lecture. If they have not named it, ask once.

The scope says which part is on the table, the learning goals say what counts inside it. A lecture that no goal claims produces no work.

On every turn, judge whether one of the tools below carries the turn better than you do. If it does, `offer` it: name the tool and what it does for **this** goal entry, then wait for the answer. If the answer is no, carry that goal yourself and do not offer the same tool again for that goal.

> Step 3 is done when every entry under `Success looks like` that falls inside the named scope has been worked or explicitly parked.

This is a demand criterion, not a judgement about understanding, and it binds you, not the user. If they stop earlier, that is a normal end of the session.

## Step 4: Tools

Load a tool by its relative path when the user accepts the offer. The coupling runs one way: a tool never loads `tutor`.

| Tool | Path | What it is for |
|---|---|---|
| `free-recall` | [`../free-recall/SKILL.md`](../free-recall/SKILL.md) | Shows what the learner already holds, and carries them to the rest with hints |
| `teaching-diagrams` | [`../teaching-diagrams/SKILL.md`](../teaching-diagrams/SKILL.md) | Makes the relationships between concepts visible as a diagram note |

A tool the user calls directly mid-session keeps the session running: it does its own work, while scope, weakness list and close stay here. It may cut its own steps against what the session already covered, and says so when it does.

## Step 5: Close the session

Say what is covered, what stays open, and whether an entry in the subject file needs updating.

## Weakness list

Write a gap into `../learning-goals/faecher/<subject>-schwaechen.md` as soon as you see it, including one a narrow question exposed. The rule for the entry is in [`didactics`](../didactics/SKILL.md#weakness-list). One concept has one entry: change the existing entry rather than adding a second one, so a gap `free-recall` already noted in this session is not written twice.
