# Drawing conventions

The craft of drawing a teaching diagram: what each element claims, and how a form is justified. Loaded at the drawing step. The didactic frame (which relationship should the learner carry afterwards, and the rule that a visualisation serving that answer gets built) stays in [`didactics/SKILL.md`](../../didactics/SKILL.md#visualisation).

## Justify the form in one sentence

Name the relationship the diagram makes visible (process, structure, state, time, interaction, ranking), then choose the type from it. Do not reason backwards from the type you usually draw: an unjustified habit form, the flowchart as default fallback, is the main cause of diagrams that do not fit.

The sentence pattern is in Step 3 of the skill, and it is said there, in the chat, not written into the note. Where the sentence cannot be written, or comes out as habit rather than reason, the form is unjustified: change the type, or fall back to text or a table.

## Type of information, and the approach it calls for

| Information is primarily | Approach |
|---|---|
| A relationship between concepts: causality, mechanism, process, hierarchy, classification, feedback loop, network, sequence | A relational diagram |
| A real or morphological object: anatomy, histology, radiology, a clinical finding, a device | A visual reference. Propose a search query, and run the search only if the calling prompt grants it |
| A free spatial idea that no relational diagram fits | A free sketch in Excalidraw, only on explicit request |
| Interaction, animation, or a state that changes with user input | A dedicated interactive renderer, only on explicit request. Describe state and interactions compactly and let a fixed renderer draw them |

A relational diagram and a visual reference are not mutually exclusive: many topics are both a mechanism and a real object. Where a topic calls for a form outside the default and the user has not asked for it, offer it rather than build it silently or skip it silently.

## Contrast steers the eye

Every element carries the reader from the coarse structure to the fine difference, or it costs attention for nothing. Contrast is the lever that does the carrying, and it works the same way whatever the element is: a frame that breaks a crowded set into blocks and sets it against the block beside it, a second line style that tells one kind of relation from another, a colour that means one thing, a table column that holds two neighbours side by side. Why this is the teaching move and not decoration: **Contrastive differentiation** in [`didactics`](../../didactics/SKILL.md#contrastive-differentiation), the line between two confusable concepts is where the learning happens.

So where the material has confusable neighbours, draw the comparison, in the diagram or in a table beside it. Three hearing devices as three separate nodes claim that three things exist; a table with one row each and a column "welchen Weg das Gerät nutzt" says what tells them apart, which is the thing the learner is missing.

**A similarity is one line, a difference is a fork.** What two neighbours share goes on a plain line between them, `A ---|"beide umgehen die gestörte Stelle"| B`. What separates them needs no line of its own: hang both on the node they share and label the two branches with the values of the criterion that splits them, or let them attach at different points of a shared chain, where the difference becomes the place the arrow lands. Two concepts that share no node at all belong in a table, where the columns do the work.

One criterion is a fork, two are two forks in a row, three or more are a table or a `classDiagram` with shared fields.

The counter-test is the same for every element: an element that differs from nothing around it carries no contrast. A frame around every node, or around the only two nodes in view, groups nothing. A second line style that means what the first one means separates nothing.

## Each element has exactly one function

| Element | Function | Rule of thumb |
|---|---|---|
| **Node** | One thing, one step, one criterion | One concept per node |
| **Group** | Makes belonging-together visible as a unit, per [Group semantics](#group-semantics) | A frame that chunks a crowded set, or sets one set against the set beside it |
| **Line** | One kind of relationship, in the form that says which, per [Edge semantics](#edge-semantics) | The plain line first, the arrowhead where something really follows |
| **Line label** | Carries only information no node carries | A property of the target node belongs in the target node |
| **Colour** | Couples an offload to its place in the map, per [Colour and coupling](#colour-and-coupling) | Same colour and same word at both ends, which spares the legend |

## Edge semantics

Every line drawn claims a relationship, so make the claim exact before drawing it. An arrowhead encodes direction only where the relationship has one: causality, flow, sequence, ownership.

**Line weight is rank.** The heaviest line pulls the eye first, so give it to the chain the map is built on and leave everything else thin. One thick chain per picture: a second one makes the first ordinary again. Every picture of the note may carry its own, offloads included, and the picture whose material has no backbone carries none, since weight ranks only against thin lines beside it. `stateDiagram-v2` and `classDiagram` offer no weight: the first documents one transition form, `-->`, the second eight fixed relation forms, and neither styles an edge, since `linkStyle` is `flowchart` only. Rank there rides on order and on the coupling colour, so where the rank of one chain is the point of the picture, that picture is a `flowchart`.

What a line can be, and what it is worth saying with:

| Form | Syntax | Says |
|---|---|---|
| thin | `---`, `-->` | the ordinary relation |
| thick | `===`, `==>` | the chain the map is built on |
| dotted | `-.-`, `-.->` | the sideways remark, off the main path |
| cross end | `--x` | this way does not work |
| circle end | `--o` | it ends here, without a next step |
| both ends | `<-->` | each side keeps the other going |
| longer | `---->` | pushes the target one rank further away |
| invisible | `~~~` | layout only, claims nothing |
| single edge | `linkStyle 7 stroke:#c0392b` | any CSS, but it counts edges by index, so an edge added above repaints the wrong one |

Mermaid draws no wavy line and no line that thickens along its way, so a difference in kind rides on the forms above or on the geometry.

**Each type writes these claims in its own syntax.** The table above is `flowchart`. A `classDiagram` names the relation itself: `<|--` inheritance, `*--` composition, `o--` aggregation, `-->` association, `--` plain link, `..>` dependency, `..` dashed link. So the sideways remark is `-.->` in one type and `..>` in the other, and the legend shows the symbol of the type it stands under.

**The arrowhead is earned, and the plain line is the default.** `A --- B` for neighbourhood, equivalence or belonging, `A <--> B` where each side keeps the other going, `A --> B` where something really follows. An arrow drawn out of habit reads as a sequence, and the learner then looks for a first and a last step the material does not have. The test: where two arrows of a chain could swap places and the picture still reads true, the material has no sequence. Then the claim is another one, and the form follows it: a plain line for neighbourhood, a fork for what splits the two, a table where the same attributes run over several items, another type where the material carries another shape. A list, a category or a collection of material carries no direction at all and belongs in a markdown list or a table, per the list formatting conventions in `didactics`.

**Every line says what it claims.** Give the line a label, or let the legend name its style, wherever the two nodes leave more than one reading. A bare arrow between two nouns is read as a sequence by default, which is right for a course in time and wrong for everything else. The claim has to be sayable in one sentence, "der Befund führt zur Therapie". Where the sentence does not come, the line is guesswork on the page.

**A line starts and ends at the exact node it means.** A line drawn to a frame claims every node inside it, so attach it to the one node the claim comes from. The frame is the right end only where the claim holds for all of its nodes, as a branch landing on a whole group does.

**Every node hangs on a line.** A node sitting inside a frame with no line is left for the reader to place alone. Draw the line to whatever the node relates to, **across frames included**: the test that decides one branch, the therapy that acts on the cause, the condition that feeds a second condition. The cross-frame lines carry the most, because they are the relations adjacency cannot show.

**A bridge state keeps its onward edges.** A node standing for a temporary state (Ferienbett, Wartezeit) carries edges to the possible next steps (Reha, Pflegeheim, Heimkehr), so the diagram shows that the process continues.

**A second line style earns its place by contrast.** Per [Contrast steers the eye](#contrast-steers-the-eye), a dashed line beside a solid one is worth its reading cost where the two kinds of relation are genuinely different and the difference is one the learner needs (a step against an assignment, the path within a topic against the point where another topic reaches in). Where both lines claim the same thing, one style carries them.

## Group semantics

Hierarchy and grouping are relationship claims, not decoration. Render real parent and child levels, and show subgroups that nest or overlap rather than flattening everything onto one level. Before adding a level or a group, ask whether it is a structural difference the learner must see, or just tidiness.

**Siblings are of one kind.** Nodes on one parent, and entries on one rank of a `timeline` or `mindmap`, claim by their position that they are comparable. Epidemiology, cause and mechanism each get their own rank, even where they bear on each other, and so does a place beside a frequency. Same for a branch that is a special case of its neighbour, such as an atresia of the ear canal under a decision that already branches on conduction.

**A frame steers the eye, it does not label a category.** Per [Contrast steers the eye](#contrast-steers-the-eye), a frame earns its place by chunking a crowded set, so eight boxes read as three, or by setting one set against the set beside it. Otherwise the shared category goes in the prose. Hearing aid, cochlear implant and bone-anchored aid earn a frame where an antibiotic and a drainage stand beside them, and none where they are the only two boxes in the picture. Where the nodes of a frame carry no lines, the frame is a list, so write it as a list.

## Legend, only for an invisible convention

Write a legend only where the diagram uses a convention the reader cannot see: a line style, or a colour that marks a linked artefact. Self-test: a legend that repeats what the picture already shows gets dropped.

The legend sits **below** the diagram, one line per style, each line its own inline code span that opens with the symbol itself, with no blank line between the lines. Where prose follows the legend, one blank line separates the two:

`<|-- drei Arten von Hörhilfen`
`--> Funktionsmechanismus`

Je weiter unten am Hörweg ein Gerät ansetzt, desto mehr Stationen überspringt es.

Where the picture separates by colour instead of by line style, as a chart with several series does, the line opens with a marker in that colour, `<span style="color:#c0392b">▬</span> Gipfel um 0 daPa`, and the palette is fixed in the diagram so the colours stay put.

Showing the symbol keeps legend and picture in one language, where a symbol named in words leaves the reader to find it. Write each line as a short phrase that names what the style stands for and stands on its own: "Funktionsmechanismus", "Verlauf, Stunden bis Tage". A span only where the line claims a course in time. A thick line claims rank, so its phrase names the role of the chain, `==> Hauptweg der Karte`. Two lines get dropped: one that sends the reader back to the labels, and one for a style whose every instance already carries a label saying the same. A line about syntax says nothing.

**One line style, one kind of relationship.** Several kinds in one diagram are fine, as long as each has its own style and each style is readable, from its label or from the legend. The same style carrying two meanings is what makes a diagram unreadable.

Where this rule and the legend rule of the source material collide, `didactics` decides.


## Colour and coupling

One colour carries one meaning, and the meaning is sayable in one sentence and tied to a learning goal. The coupling of an offload to its place in the map is one such meaning: same colour, same word, at the container in the map and at the detail heading of the offload. A number may stand in the map for orientation, but it does not carry the coupling.

Two consequences worth naming:

- The remaining boxes of an offload stay neutral (`fill:#ecf0f1,stroke:#bdc3c7,color:#2c3e50`), so the coloured one stays the one that couples.
- Decisions are marked by shape, the diamond, so no second colour takes on a meaning colour already carries.

Suggested palette, other consistent palettes work as long as one colour keeps one meaning: `#c0392b` red, `#2980b9` blue, `#27ae60` green, `#8e44ad` violet, `#e67e22` orange, `#f39c12` yellow, `#ecf0f1` neutral.

## Offloading

Each offload sits at **exactly one** place in the map: one coloured container, which may hold sub-boxes. The offload **mirrors those sub-boxes and adds detail**, rather than repeating them. A pure duplicate carries nothing.

The mirroring has to be **visible**: every sub-box of the container appears in the offload by its own wording, as a cluster title or a node, with the detail under it. Covering the sub-boxes in substance but not in words leaves the reader to rebuild the link between map and detail, which is the one job the offload had.

**An offload may be a table.** Where the detail is the same attributes across several items, the table beats a diagram: the comparison runs along the columns, and the row order claims nothing. It mirrors its container the same way, with the sub-boxes as the entries of the first column, and it couples through the same coloured heading.

An offload may itself be a map with its own offloads, and it may cross-reference: when a concept inside it belongs to another group, keep that visible. Where a small diagram cannot carry something, say so in a remark under it, about the material: "die Karte zeigt nicht, welcher der beiden Wege häufiger ist". A limit of Mermaid goes to the chat instead, since the note is read months later by someone who does not care which type knows `classDef`.

A cluster inside an offload stays neutral, a grey box with a title naming the group: colour is reserved for the coupling. Which groups to draw at all is in [Group semantics](#group-semantics).

## Syntax guardrails

Hard technical constraints. `scripts/check-mermaid.sh` covers the fences, the quoting and the subgraph titles; these it does not cover.

| Type | The form that works |
|---|---|
| `flowchart` | Write `flowchart`, not `graph` |
| `venn-beta`, `sankey-beta` | No `title` inside the diagram |
| `quadrantChart` | A strict lexer reads the whole block, so every line stays ASCII, point labels included, and the text carries no comma and no colon. A point takes `color:` and `radius:` after its coordinates. Nothing wraps, so quadrant text stays under 30 characters and a point name under 25, and a name near an axis end moves inward |
| `radar-beta` | `axis` and `curve` only, no `x-axis` or `y-axis`; the frontmatter `--- title: "..." ---` goes before the diagram; short names in brackets, `axis w["Wissen"]`; values in `{}` |
| `treemap` | Two or four spaces of indentation for the hierarchy, entries as `"Label" : number` |
| `classDef` | Stands before the `class` calls, hex codes always with `#`, each name once |
| `classDiagram` | One box per class, so `classDef` and `class` do not produce a double |
| Labels with special characters | In quotes whenever they contain `:` `,` `(` `)` `[` `]` `{` `}` |
| Umlauts | The ID stays ASCII, and the display label carries the real spelling: `class Hoerhilfe["Hörhilfe"]`, `state "Belüftetes Mittelohr" as Belueftet`. Every ID the picture shows gets such a label |
| `ishikawa-beta` | Problem on the first line, categories at the same indent below it, causes one indent deeper, from v11.12.3. Beta, so the syntax may change |
| Code fences | Opened and closed on their own line, with no blank line around them. `scripts/check-blanks.sh --fix` sets the blank lines of the whole note |

**Mermaid docs, for what this table does not settle.** [flowchart](https://mermaid.js.org/syntax/flowchart.html) for edge forms, lengths and `linkStyle`. [classDiagram](https://mermaid.js.org/syntax/classDiagram.html) for the relation types, `class Foo["Label"]` and `cssClass`. [stateDiagram](https://mermaid.js.org/syntax/stateDiagram.html) for composite states and notes. [ishikawa](https://mermaid.js.org/syntax/ishikawa.html) for the fishbone. [theming](https://mermaid.js.org/config/theming.html) where a `classDef` does not take.

## Content check before release

- Boxes carry clinically relevant attributes only, no UUIDs, keys, data types or methods.
- Colour semantics are consistent: one colour, one meaning.
- No technical noise (HL7, FHIR, API, database schema) in medical material.
- The relationships in the map are drawn, not implied by mere adjacency.
- Every sub-box of every map container is found again in its offload, by its own wording.
- Nodes on one parent are of one kind, and every frame either chunks a crowded set or sets it off against its neighbour.
- Every node carries at least one line, a relation across two frames is drawn rather than left to adjacency, and each line ends at the node it means rather than at its frame.
- No relation is drawn twice in the same form: map against offload against table.
- Every arrowhead marks a real direction; neighbourhood and equivalence carry a plain line.
- At most one thick chain per picture, and none where the material has no backbone.
- Every legend line names a style the picture cannot show by itself.
- The first line after the frontmatter is `# <span style="color:#000000">Karte</span>`, every offload heading sits one level below its map, and what bears on the whole subject stands under its own `#` heading after the offloads.
- Every sentence beside a picture does one of three jobs, in words the picture and its legend do not already carry: it says what the picture shows, it names what the offload adds to its place in the map, or it names what the material leaves open. A sentence doing none of the three is craft talk and goes to the chat.
- Where the material names two options, the diagram names both.

## Where these rules bind

They bind for every visual output of this skill. The medium here is Mermaid. The `diagram-design` skill carries its own implementation layer for standalone HTML and SVG output: the element semantics above hold there too, the implementation details differ.
