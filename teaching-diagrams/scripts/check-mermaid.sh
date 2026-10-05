#!/bin/sh
# check-mermaid.sh — Mermaid-Fence-Validierung (teach-md Produktregel)
#
# Regel (SKILL.md "Visualization" + mermaid-patterns.md "Validierung"):
#   - Fences paarweise geschlossen (```mermaid ... ```)
#   - Subgraph-Titel immer in Quotes: subgraph ID["Titel mit -"]
#   - <br/> nur in Node-Labels, nie in Subgraph-Titeln, nie unquoted
#   - Labels mit Sonderzeichen (: / ( ) = & ; ? -) in Quotes: A["Label mit -:"]
#   - IDs ASCII; Umlaute/nicht-ASCII nur innerhalb von "…"-Quotes
#   - Achsenzeilen (x-axis, y-axis, axis) sind keine Kanten, ihr --> trennt nur
#   - quadrantChart: nur ASCII im ganzen Fence (Lexer bricht an jedem Umlaut)
#   - quadrantChart: Quadrantentext hoechstens 30 Zeichen, Punktname hoechstens
#     25, sonst ueberlagern sich die Beschriftungen (kein Umbruch im Renderer)
#
# Deterministische Heuristik in POSIX awk (kein node/mmdc noetig). Prueft nur
# den empfohlenen Pfad (Obsidian); fuer eine echte Vollrender-Pruefung
# optional mmdc -i file.mmd --check oder die Kroki-API, siehe mermaid-patterns.md.
#
# Usage: check-mermaid.sh <datei.md> [<datei2.md> ...]
# Exit: 0 = ok, 1 = Verstoesse gefunden, 2 = Aufruf-/Dateifehler

if [ "$#" -eq 0 ]; then
    echo "Usage: check-mermaid.sh <datei.md> [...]" >&2
    exit 2
fi

status=0

for file in "$@"; do
    if [ ! -f "$file" ]; then
        echo "Datei nicht gefunden: $file" >&2
        status=2
        continue
    fi

    awk -v F="$file" '
    { n++; L[n] = $0 }
    function has_special(s,   i, c) {
        for (i = 1; i <= length(s); i++) {
            c = substr(s, i, 1)
            if (c == ":" || c == "/" || c == "(" || c == ")" || c == "=" || c == "&" || c == ";" || c == "?" || c == "-") return 1
        }
        return 0
    }
    function strip_quotes(s,   r, i, c, inq) {
        r = ""
        inq = 0
        for (i = 1; i <= length(s); i++) {
            c = substr(s, i, 1)
            if (c == "\"") { inq = !inq; continue }
            if (!inq) r = r c
        }
        return r
    }
    function skip_quote(line, j,   k) {
        k = j
        while (k <= length(line)) {
            if (substr(line, k, 1) == "\"") return k
            k++
        }
        return k
    }
    function check_subgraph(line, i) {
        if (line !~ /^[ \t]*subgraph/) return
        if (line ~ /<br[ \t]*\/>/) {
            print F ":" i ": <br/> nicht im Subgraph-Titel erlaubt (nur Node-Labels): " line
            E = 1
        }
        if (line ~ /\["/) return
        if (line ~ /\[/) {
            print F ":" i ": Subgraph-Titel in Quotes: subgraph ID[\"Titel mit -\"]"
            E = 1
        }
    }
    function check_br(line, i,   rest) {
        if (line !~ /<br[ \t]*\/>/) return
        rest = strip_quotes(line)
        if (rest ~ /<br[ \t]*\/>/) {
            print F ":" i ": <br/> nur innerhalb eines Quoted-Node-Labels (A[\"Zeile<br/>Zeile\"]): " line
            E = 1
        }
    }
    function check_node_labels(line, i,   c, j, len, content) {
        len = length(line)
        j = 1
        while (j <= len) {
            c = substr(line, j, 1)
            if (c == "\"") { j = skip_quote(line, j); j++; continue }
            if (c == "[" || c == "{" || c == "(") {
                content = ""
                j++
                while (j <= len) {
                    c = substr(line, j, 1)
                    if (c == "]" || c == "}" || c == ")") break
                    content = content c
                    j++
                }
                j++
                if (content ~ /"/) continue
                if (content ~ /<br/) continue
                if (content ~ /[^ -~]/) {
                    print F ":" i ": Umlaute/nicht-ASCII im Label in Quotes (\"…\"): " line
                    E = 1
                } else if (has_special(content)) {
                    print F ":" i ": Label-Sonderzeichen in Quotes (A[\"Label mit -:\"]): " line
                    E = 1
                }
                continue
            }
            j++
        }
    }
    function check_pipe_labels(line, i,   c, j, len, content, prev) {
        len = length(line)
        j = 1
        while (j <= len) {
            c = substr(line, j, 1)
            if (c == "|") {
                prev = (j > 1) ? substr(line, j - 1, 1) : ""
                if (prev == ">" || prev == "-" || prev == "=") {
                    content = ""
                    j++
                    while (j <= len && substr(line, j, 1) != "|") {
                        content = content substr(line, j, 1)
                        j++
                    }
                    if (content !~ /"/ && (content ~ /[^ -~]/ || has_special(content))) {
                        print F ":" i ": Edge-Label in Quotes (-->|\"Label mit -:\"|): " line
                        E = 1
                    }
                }
            }
            j++
        }
    }
    function check_ascii(line, i,   rest, p) {
        rest = strip_quotes(line)
        p = index(rest, ":")
        if (p > 0) rest = substr(rest, 1, p - 1)
        if (rest ~ /[^ -~]/) {
            print F ":" i ": IDs nur ASCII; Umlaute/nicht-ASCII nur innerhalb von \"…\": " line
            E = 1
        }
    }
    END {
        E = 0
        infence = 0
        is_mermaid = 0
        for (i = 1; i <= n; i++) {
            line = L[i]
            if (line ~ /^```/) {
                if (!infence) {
                    infence = 1
                    is_mermaid = (line ~ /^```[ \t]*mermaid/)
                } else {
                    infence = 0
                    is_mermaid = 0
                    dtype = ""
                }
                continue
            }
            if (!infence || !is_mermaid) continue
            if (line ~ /^[ \t]*%%/) continue
            gsub(/\t/, " ", line)
            check_subgraph(line, i)
            check_br(line, i)
            if (dtype == "" && line ~ /^[ \t]*(flowchart|graph|classDiagram|stateDiagram-v2|quadrantChart|xychart-beta|ishikawa-beta|timeline|mindmap|sequenceDiagram|gantt|pie|venn-beta|radar-beta|treemap|journey|sankey-beta)/) {
                dtype = line
                sub(/^[ \t]*/, "", dtype)
                sub(/[ \t].*$/, "", dtype)
            }
            if (dtype == "quadrantChart") {
                if (line ~ /[^ -~]/) {
                    print F ":" i ": quadrantChart nimmt nur ASCII, auch in Punktnamen: " line
                    E = 1
                }
                if (line ~ /^[ \t]*quadrant-[1-4][ \t]/) {
                    t = line
                    sub(/^[ \t]*quadrant-[1-4][ \t]+/, "", t)
                    if (length(t) > 30) {
                        print F ":" i ": Quadrantentext ueber 30 Zeichen, er laeuft in den Nachbarn: " t
                        E = 1
                    }
                }
                if (line ~ /^[ \t]*[A-Za-z][^:]*:[ \t]*\[/) {
                    t = line
                    sub(/^[ \t]*/, "", t)
                    sub(/[ \t]*:[ \t]*\[.*$/, "", t)
                    if (length(t) > 25) {
                        print F ":" i ": Punktname ueber 25 Zeichen, er laeuft ueber den Rand: " t
                        E = 1
                    }
                }
                continue
            }
            if (line ~ /^[ \t]*(x-axis|y-axis|axis)[ \t]/) continue
            if (line ~ /->/ || line ~ /--/ || line ~ /==/) {
                check_node_labels(line, i)
                check_pipe_labels(line, i)
                check_ascii(line, i)
            }
        }
        if (infence) {
            print F ":" n ": Mermaid-Fence nicht geschlossen (``` fehlt)"
            E = 1
        }
        exit E
    }' "$file"

    rc=$?
    if [ "$rc" -ne 0 ]; then status=$rc; fi
done

exit $status