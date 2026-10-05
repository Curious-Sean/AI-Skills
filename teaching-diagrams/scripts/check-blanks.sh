#!/usr/bin/env sh
# check-blanks.sh — Leerzeilen in einer Diagrammnotiz pruefen und normalisieren.
#
# Regeln (dieselben, die drawing-conventions.md fuer die Notiz verlangt):
#   R1  Keine Leerzeile, wo Markdown keine braucht: nicht nach der Ueberschrift,
#       nicht um einen Code-Fence, nicht zwischen Absaetzen, nicht nach dem
#       Frontmatter. Ausnahme: zwischen schliessendem Fence und Tabelle, sonst
#       liest der Parser die Tabelle nicht als Tabelle.
#   R2  Legendenzeilen (Code-Span, Symbol: `--> ...`),
#       Tabellenzeilen und Listenpunkte stehen als Block direkt untereinander.
#   R3  Genau eine Leerzeile dort, wo Markdown sie braucht: zwischen einem
#       Absatz und einer folgenden Tabelle, Liste, Legende oder Blockquote, und
#       umgekehrt. Ohne sie zieht der Parser den Absatz in den Block hinein,
#       der Satz nach einer Tabelle wird dann zu einer weiteren Tabellenzeile.
#       Vor einer Ueberschrift braucht es keine. Datei endet mit genau einem
#       Zeilenumbruch.
#   Frontmatter und alles innerhalb eines Fence bleiben unangetastet.
#
# Aufruf:
#   check-blanks.sh <datei.md> [...]          # zeigt den Diff, Exit 1 bei Fund
#   check-blanks.sh --fix <datei.md> [...]    # schreibt die Normalisierung, Exit 0

set -eu

FIX=0
ARGS=""
while [ $# -gt 0 ]; do
  case "$1" in
    --fix) FIX=1 ;;
    *) ARGS="$ARGS $1" ;;
  esac
  shift
done

if [ -z "$ARGS" ]; then
  echo "Usage: check-blanks.sh [--fix] <datei.md> [...]" >&2
  exit 2
fi

AWK_PROG='
function is_blank(s){ return s ~ /^[ \t]*$/ }
function is_heading(s){ return s ~ /^#+[ \t]/ }
function is_fence(s){ return s ~ /^```/ }
function is_legend(s){ return s ~ /^`[ \t]*[-=.~<][-=.~<>ox|]+[ \t]/ || s ~ /^<span style="color:/ }
function is_row(s){ return s ~ /^[ \t]*\|/ || s ~ /^[ \t]*[-*+][ \t]/ || s ~ /^[ \t]*[0-9]+\.[ \t]/ || s ~ /^[ \t]*>/ }
function kind(s){ if (is_legend(s)) return "legend"; if (is_row(s)) return "row"; return "" }
{ lines[NR]=$0 }
END {
  n=NR; oc=0; i=1; fence=0
  # Frontmatter unveraendert durchreichen
  if (n>=1 && lines[1]=="---") {
    out[++oc]=lines[1]; i=2
    while (i<=n) { out[++oc]=lines[i]; if (lines[i]=="---") { i++; break } i++ }
  }
  while (i<=n) {
    s=lines[i]
    if (fence) { out[++oc]=s; if (is_fence(s)) fence=0; i++; continue }
    if (is_blank(s)) { i++; continue }
    prev = (oc>0) ? out[oc] : ""
    want = 0
    if (oc>0 && !is_heading(prev) && !is_fence(prev) && !is_fence(s)) {
      if (kind(s) != kind(prev) && !is_heading(s)) want=1
    }
    # Eine Tabelle direkt nach einem Fence wird sonst nicht als Tabelle gelesen
    if (oc>0 && is_fence(prev) && kind(s) == "row") want=1
    if (want) out[++oc]=""
    out[++oc]=s
    if (is_fence(s)) fence=1
    i++
  }
  while (oc>0 && is_blank(out[oc])) oc--
  for (k=1;k<=oc;k++) print out[k]
}
'

changed=0
for f in $ARGS; do
  [ -f "$f" ] || { echo "Datei nicht gefunden: $f" >&2; exit 2; }
  tmp=$(mktemp)
  awk "$AWK_PROG" "$f" > "$tmp"
  if ! diff -q "$f" "$tmp" >/dev/null 2>&1; then
    changed=1
    if [ "$FIX" -eq 1 ]; then
      cp "$tmp" "$f"; echo "FIXED: $f"
    else
      echo "=== $f ==="; diff -u "$f" "$tmp" || true
    fi
  fi
  rm -f "$tmp"
done

if [ "$changed" -eq 1 ] && [ "$FIX" -eq 0 ]; then
  echo "FAIL: Leerzeilen weichen von der Konvention ab (check-blanks.sh)" >&2
  exit 1
fi
echo "OK: Leerzeilen folgen der Konvention."
exit 0
