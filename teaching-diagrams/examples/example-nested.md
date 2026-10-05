---
tags:
  - contains_AI
source:
  - "[[Vorlesung Audiologie.pdf]]"
---
# <span style="color:#000000">Karte</span>
Zeigt, an welchem Ort die zwei Formen der Schwerhörigkeit sitzen, welcher Befund sie trennt und welche Therapie am jeweiligen Ort ansetzt.
```mermaid
flowchart TD
    subgraph DIA["Diagnostik"]
        direction TB
        G1["Stimmgabelprüfungen"]
        G2["Tonaudiometrie"]
        G3["Tympanometrie"]
        G1 --> G2
        G2 --> G3
    end
    subgraph SLS["Schallleitungsstörung"]
        direction TB
        L1["Gehörgang und Trommelfell"]
        L2["Mittelohr und Gehörknöchelchen"]
    end
    subgraph SES["Schallempfindungsstörung"]
        direction TB
        E1["Innenohr und Haarzellen"]
        E2["Hörnerv und zentrale Bahn"]
    end
    subgraph THL["Therapie der Schallleitung"]
        direction TB
        W1["Verschluss beheben oder Trommelfell decken"]
        W2["Mittelohr belüften oder rekonstruieren"]
        W3["BAHA über den Knochen"]
    end
    subgraph THS["Therapie der Schallempfindung"]
        direction TB
        H1["Hörgerät"]
        H2["Cochlea-Implantat"]
    end
    G2 ==> Q{"Air-bone gap im Audiogramm?"}
    Q ==>|"ja"| SLS
    Q ==>|"nein"| SES
    L1 --> W1
    L2 --> W2
    L2 -->|"wenn nicht rekonstruierbar"| W3
    E1 -->|"solange Haarzellen nutzbar sind"| H1
    E1 -->|"bei Ertaubung, ersetzt die Haarzellen"| H2
    E2 --x|"ohne intakten Hörnerv wirkungslos"| H2
    W1 ---|"stellen den natürlichen Weg wieder her"| W2
    W3 ---|"umgehen die gestörte Stelle"| H2
    G3 -.->|"zeigt das Mittelohr direkt"| L2
    G2 -.->|"Knochenleitungskurve zeigt das Ausmass"| E1

    classDef diag fill:#27ae60,stroke:#1e8449,color:#ffffff
    classDef neutral fill:#ecf0f1,stroke:#bdc3c7,color:#2c3e50
    class DIA diag
    class G1,G2,G3,L1,L2,E1,E2,W1,W2,W3,H1,H2 neutral
```
`==> Hauptweg der Karte`
`--> was daraus folgt`
## <span style="color:#27ae60">Diagnostik</span>
Die drei Verfahren aus der Karte, erweitert um das, was jedes entscheidet.
```mermaid
flowchart TD
    subgraph STI["Stimmgabelprüfungen"]
        direction TB
        S1["Weber: wohin lateralisiert der Ton"]
        S2["Rinne: Luftleitung gegen Knochenleitung"]
    end
    TON["Tonaudiometrie: Luft- und Knochenleitungskurve je Ohr"]
    TYM["Tympanometrie"]
    S1 -->|"nimmt vorweg, welche Seite betroffen ist"| TON
    S2 -->|"nimmt vorweg, welche Art, ohne Audiometer"| TON
    TON -->|"nur wenn die Kurven einen air-bone gap zeigen"| TYM

    classDef sti fill:#8e44ad,stroke:#6c3483,color:#ffffff
    classDef tym fill:#e67e22,stroke:#b35a15,color:#ffffff
    classDef neutral fill:#ecf0f1,stroke:#bdc3c7,color:#2c3e50
    class STI sti
    class TYM tym
    class S1,S2,TON neutral
```
### <span style="color:#8e44ad">Stimmgabelprüfungen</span>
Die zwei Prüfungen aus der Karte darüber, erweitert um ihren Befund in beiden Formen.

| Prüfung | Schallleitungsstörung | Schallempfindungsstörung | Woran das liegt |
|---|---|---|---|
| Weber, Stimmgabel auf der Stirnmitte | lateralisiert ins kranke Ohr | lateralisiert ins gesunde Ohr | Das blockierte Mittelohr lässt den Knochenschall nicht entweichen, das kranke Innenohr hört ihn schlechter |
| Rinne, Vergleich am kranken Ohr | negativ: Knochenleitung besser als Luftleitung | positiv: Luftleitung bleibt besser, beide abgesenkt | Die Luftleitung verliert die Mittelohrübertragung, die Knochenleitung umgeht sie |

Bei beidseitig gleichem Verlust sagt der Weber nichts: er braucht die Seitendifferenz.
### <span style="color:#e67e22">Tympanometrie</span>
Die Tympanometrie aus der Karte darüber, aufgeklappt in die zwei Grössen, die sie misst, und die Zustände, die hinter jedem Kurventyp stehen.
```mermaid
flowchart LR
    subgraph TYP["Kurventypen"]
        direction TB
        K1["Gipfel um 0 daPa"]
        K2["Gipfel im Unterdruck"]
        K3["flach, kein Gipfel"]
    end
    Y1["Druck im Mittelohr"] -->|"bestimmt die Lage des Gipfels"| TYP
    Y2["Beweglichkeit des Trommelfells"] -->|"bestimmt die Höhe des Gipfels"| TYP
    K1 ---|"belüftet und normal beweglich"| BEL["Normalbefund"]
    K2 ---|"Unterdruck hinter dem Trommelfell"| TUB["Tubenfunktionsstörung"]
    K3 ---|"Flüssigkeit dämpft die Kurve"| ERG["Paukenerguss"]
    TUB <-->|"jede unterhält die andere, über Wochen"| ERG

    classDef typ fill:#2980b9,stroke:#1f5f8b,color:#ffffff
    classDef neutral fill:#ecf0f1,stroke:#bdc3c7,color:#2c3e50
    class TYP typ
    class K1,K2,K3,Y1,Y2,BEL,TUB,ERG neutral
```
#### <span style="color:#2980b9">Kurventypen</span>
Die drei Kurvenformen aus der Karte darüber, erst als Messschrieb mit den zwei Grössen auf den Achsen, dann als Typenliste mit Zustand und Ursache.
```mermaid
---
config:
  themeVariables:
    xyChart:
      plotColorPalette: "#c0392b, #2980b9, #27ae60"
---
xychart-beta
    title "Tympanogramm"
    x-axis "Druck im Gehörgang in daPa" -400 --> 200
    y-axis "Compliance in ml" 0 --> 1.5
    line "Gipfel um 0 daPa" [0.10, 0.10, 0.12, 0.15, 0.20, 0.30, 0.50, 0.90, 1.20, 0.80, 0.40, 0.20, 0.15]
    line "Gipfel im Unterdruck" [0.10, 0.12, 0.20, 0.50, 0.90, 0.60, 0.35, 0.25, 0.20, 0.15, 0.12, 0.10, 0.10]
    line "flach, kein Gipfel" [0.12, 0.12, 0.13, 0.13, 0.14, 0.14, 0.15, 0.15, 0.15, 0.14, 0.14, 0.13, 0.13]
```
<span style="color:#c0392b">▬</span> Gipfel um 0 daPa
<span style="color:#2980b9">▬</span> Gipfel im Unterdruck
<span style="color:#27ae60">▬</span> flach, kein Gipfel

| Kurve | Typ | Zustand des Mittelohrs | Typische Ursache |
|---|---|---|---|
| Gipfel um 0 daPa, normale Höhe | A | belüftet, normal beweglich | Normalbefund |
| Gipfel um 0 daPa, flach | As | versteift | Otosklerose, Tympanosklerose |
| Gipfel um 0 daPa, überhöht | Ad | zu nachgiebig | unterbrochene Gehörknöchelchenkette, atrophes Trommelfell |
| Gipfel im Unterdruck | C | Unterdruck hinter dem Trommelfell | Tubenfunktionsstörung |
| flach, kein Gipfel | B | Flüssigkeit, oder offene Verbindung nach aussen | Paukenerguss, bei grossem Gehörgangsvolumen Perforation |
# <span style="color:#000000">Die zwei Formen im Vergleich</span>
| | Schallleitungsstörung | Schallempfindungsstörung |
|---|---|---|
| Audiogramm | Knochenleitung normal, Luftleitung abgesenkt | beide Kurven abgesenkt, kein Abstand |
| Typische Ursachen | Cerumen, Paukenerguss, Perforation, Otosklerose, Atresie | Presbyakusis, Lärm, konnatale Infektion, nach Meningitis, Vestibularisschwannom |
| Grenze des Verlusts | endlich, die Knochenleitung bleibt | bis zur Ertaubung möglich |
