# Source marking

How AI-written content is marked in an Obsidian note. Read by `teaching-diagrams` and `structure-clinical-notesv2`, the two skills that write into the vault. The principle behind it (never state a fact without a traceable source) stays in [`didactics/SKILL.md`](../SKILL.md#grounding).

## Scope: one of two ways per file, never both

| File | Marking |
|---|---|
| **Pure AI product** (a diagram note, a briefing, a lesson, a reference file) | `tags:` list carrying `contains_AI` in the frontmatter |
| **User-owned document with AI insertions** (notes edited by `structure-clinical-notesv2`) | `#source_KI` inline per insertion, no `contains_AI` tag |

## Inline form

`#source_KI` at the start of the line, and a `(Quelle: ...)` at the end for explicitly citable sources. Without a citable source, no source reference. Nothing else: no `%%...%%` comments, no dates, no `(extern)`. AI content never blends silently into grounded material.

When research was triggered by a priority marker, the result carries the same form: `#source_KI <Text> (Quelle: ...)`.

## AI marker in the frontmatter

Obsidian properties format, a YAML list under `tags:`. The flow list and the boolean form (`contains_AI: false`) are invalid.

```yaml
tags:
  - contains_AI
```

Once set, it stays.

## Frontmatter source list

The frontmatter carries `source:` as an Obsidian list property with one or more entries.

- A file in the vault is a wikilink: `[[exact PDF filename]]`.
- A source outside the vault is a plain bibliographic string: "Title, Author, Year".
- The inline citation matches the form of the entry: a wikilink for vault sources, without repeating the bibliographic string, and a plain string for external sources, without a wikilink.
- When the frontmatter carries the source, the trailing `#source_KI` line is left off.
