# Goals format

The format of the two files this skill writes: `faecher/<subject>.md` for a subject, `jahr.md` for the year above all subjects. Both live in this skill folder, so they are readable in every session no matter which project folder is mounted. They capture what the user must be able to do and why, and every teaching decision traces back to them.

## Subject file

Seven fields. The divider keeps the four rarely changing fields apart from the two running ones, so the plan does not eat the compass.

```md
# Learning goals: {Subject}

## Why
{1-3 sentences. The concrete real-world goal the user is chasing. What changes in
their life or work when they have this skill? Avoid abstract framings like "to
understand X", push for the underlying outcome.}

## Success looks like
{Grouped under the six Bloom categories. Several entries per category are normal,
empty categories stay empty or are dropped.}

## Constraints
- {Time, budget, prior commitments, learning preferences, anything that bounds the
  approach}
- {Time budget only where it differs from `jahr.md`: {deadline}, {hours per week}}

## Out of scope
- {Adjacent topics the user explicitly does not want to chase right now, protects
  the zone of proximal development}

---

## Current baseline
- {Topic}: {what the opening recall produced, in the user's words; "nichts" is a result}

## Sequence
- {One line per topic, in working order. Topic level only, no session planning.}
```

## The six Bloom categories

A completeness checklist for `Success looks like`, not a ranking and not a quality bar for generated questions. They exist so that no kind of goal is forgotten.

- **Remember**, recall a fact, name, value or list without help.
  "can name the four stages of heart failure"
- **Understand**, put a mechanism into your own words, including why it works that way.
  "can explain why afterload reduction raises stroke volume"
- **Apply**, use the knowledge on a concrete case that follows a known pattern.
  "can pick the right diuretic for a patient with preserved ejection fraction"
- **Analyse**, break a case into its parts and tell apart things that look alike.
  "can separate cardiac from pulmonary dyspnoea using the given findings"
- **Evaluate**, weigh options against criteria and justify the choice.
  "can justify whether this patient is anticoagulated or not"
- **Create**, produce something that was not in the material: a plan, a hypothesis,
  a synthesis across sources.
  "can draft a diagnostic workup for unclear dyspnoea"

## Year file

`jahr.md` carries five fields: `Why`, `Success looks like`, `Constraints`, `Out of scope`, `Depth filter`. It holds the wide direction, the time budget (`Time budget: {deadline}, {hours per week}` under `Constraints`) and the depth filter for all subjects of the year. A subject that needs a different depth says so in its own subject file, so the deviation lives in one place.

## Rules

- **Concrete over abstract.** "Run a half marathon by October" beats "get fitter". "Recognise heart failure stages in a real patient" beats "understand heart failure".
- **A year-level goal is valid** when the real aim spans many unrelated sources over a long program ("become a good general internist"), as long as it carries a `Depth filter` that keeps it concrete enough to calibrate a single session.
- **Scope the year title to the widest set of planned sources.** If sources from several specialties will be worked, the title says so, rather than naming the narrowest one.
- **Phrase the depth filter functionally, not as a content blacklist.** Anchor: does this detail change diagnosis, therapy or prognosis? Content examples are illustrations, and a subject whose core is a normally deprioritised area overrides the filter in its own subject file.
- **Push back on vagueness.** If the user cannot say why, interview them before writing anything. A bad goals file is worse than none.
- **Revise when reality shifts.** Goals change. When the user's aim moves, update the file rather than leave a stale compass steering future sessions, and confirm the change with them.
- **Keep it short.** A file that runs past one screen has stopped being a compass and started being a plan.
