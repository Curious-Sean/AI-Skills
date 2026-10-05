# Type inventory

The Mermaid types available for a teaching diagram, and what each one is good for. Loaded when outline variants are proposed. The judgement column is the user's control knob: it says how readily a type is reached for, not whether it renders.

## Judgements

| Judgement | Types | Why |
|---|---|---|
| **Core** | `flowchart`, `classDiagram`, `stateDiagram-v2`, `ishikawa-beta` | A sequence, an entity with its subforms, a course through stages, several causes onto one effect. The four shapes most lecture material has |
| **Occasional** | `sequenceDiagram`, `timeline`, `gantt`, `venn-beta`, `quadrantChart`, `xychart-beta` | Interaction, milestones, duration, overlap, two axes, a measured curve. Right when the material really carries that shape |
| **On request** | `mindmap`, `treemap`, `journey`, `pie`, `sankey-beta`, `radar-beta` | `mindmap` and `journey` show no cross-relationship. The rest encode numbers that lecture material usually does not carry |
| **Struck** | `ER`, `block`, `architecture`, `requirementDiagram`, `packet`, `gitGraph` | `ER` does nothing `classDiagram` does not do better. `block` and `architecture` render unreliably, with arrows covering text. The three IT types are out of the field |

`ishikawa-beta` and `venn-beta` are beta types whose syntax can change with an Obsidian version. That is why the script run before saving is mandatory: a type falling out shows itself there, not in the saved note.

## Which types carry the coupling

The coupling runs over `classDef`, so `flowchart`, `classDiagram` and `stateDiagram-v2` carry it. `quadrantChart` carries it on a single point, over inline `color:`. `ishikawa-beta`, `timeline`, `mindmap`, `journey`, `pie` and `gantt` document no styling at all: use them for an offload, or as a map where the shared word alone carries the coupling and the user accepted that when choosing the variant.

**Two colour deltas.** In `stateDiagram-v2` a `classDef` reaches neither a composite state nor the states inside one, so the coupled container is a simple state and its inner steps live in the offload. Its label sits on the canvas, so a dark `fill` leaves white text on white ground: colour the `stroke` and the text and keep the fill pale (`fill:#eafaf1,stroke:#27ae60,stroke-width:3px,color:#1e8449`). In `classDiagram` the colour goes on with `style Name fill:...`, one line per coloured class: `classDef` with `cssClass` left the box unstyled in Obsidian, and a second `class` line would draw a second box. Keep the fill pale and carry the meaning in the `stroke` (`fill:#f4ecf7,stroke:#8e44ad,stroke-width:3px,color:#6c3483`), because member text keeps the theme colour.

## Medical examples

| Type | Example |
|---|---|
| `flowchart` | A clinical pathway, a decision tree, a workup |
| `classDiagram` | Entities and their relations: patient, pathogen, antibiotic, lab value, allergy |
| `stateDiagram-v2` | A course through stages: therapy planned, active, paused, finished |
| `ishikawa-beta` | Several causes onto one finding, for example the recurring otitis media |
| `sequenceDiagram` | Who talks to whom: doctor, lab, radiology, patient |
| `timeline` | Milestones without duration, for example the history of antibiotic resistance |
| `gantt` | Calendar time with durations, for example a study or intervention schedule |
| `venn-beta` | Overlapping sets, for example metabolic syndrome |
| `quadrantChart` | A position on two axes, for example the duration of an attack against the involvement of hearing. Points carry `color:` and `radius:` inline, so one of them can carry the coupling. The block takes no umlaut anywhere, so pick labels that read correctly in ASCII. Short labels keep the four fields readable, since neither quadrant text nor point name wraps |
| `xychart-beta` | A curve whose shape is the point, for example the tympanogram or the audiogram. The built-in legend for named series needs v11.17, so fix the colours with `plotColorPalette` and write the legend below the picture |

## Telling neighbours apart

- `classDiagram` vs `flowchart`: entities and their relations, against steps and decisions.
- `stateDiagram-v2` vs `flowchart`: one subject moving through its states, against steps and decisions with several actors.
- `sequenceDiagram` vs `stateDiagram-v2`: interaction, who talks to whom, against the life cycle of one object.
- `ishikawa` vs `flowchart`: several causes converging on one effect, against a sequence in time.
- `gantt` vs `timeline`: calendar time with durations, against milestones without them.
- `mindmap` vs `treemap`: hierarchy alone, against hierarchy plus quantitative area.
- `pie` vs `quadrantChart`: shares of one variable, against a position in two.
- `sankey-beta` vs `pie`: flow between stages, against static shares.
- `radar-beta` vs `xychart-beta`: a profile over several axes, against a time series.

## Type deltas

Beyond the drawing conventions, three types carry their own demands:

- **`classDiagram`**: only clinically relevant attributes (name, diagnosis, eGFR, resistance), no technical metadata (UUID, primary keys, data types, methods). Relations in the language of the field, with cardinalities at both ends (`"1" --> "*"`). Use `classDef` for semantic groups, not for every class, and keep one box per class.
- **`mindmap`**: static hierarchies only (a classification, a differential list), at least two levels, never a process.
- **`journey`**: one actor, the patient, and scores that mean burden or satisfaction.
