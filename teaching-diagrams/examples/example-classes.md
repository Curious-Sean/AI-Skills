---
tags:
  - contains_AI
source:
  - "[[Vorlesung Audiologie.pdf]]"
---
# <span style="color:#000000">Karte</span>
Zeigt, an welcher Station des Hörwegs jede der drei Hörhilfen ansetzt und welche Voraussetzung sie dafür braucht.
```mermaid
classDiagram
    class Hoerhilfe["Hörhilfe"] {
        +Indikation
        +Weg zum Hörnerv
        +Voraussetzung
    }
    class Hoergeraet["Hörgerät"] {
        +Schallleitung oder leichte Schallempfindung
        +verstärkt den natürlichen Weg
        +braucht nutzbare Haarzellen
    }
    class Cochleaimplantat["Cochlea-Implantat"] {
        +hochgradige Schallempfindung bis Ertaubung
        +reizt elektrisch
        +braucht einen intakten Hörnerv
    }
    class Baha["BAHA"] {
        +Schallleitung ohne nutzbaren Gehörgang
        +leitet über den Schädelknochen
        +braucht ein funktionierendes Innenohr
    }
    class Mittelohr["Mittelohr"]
    class Innenohr["Innenohr mit Haarzellen"]
    class Hoernerv["Hörnerv"]
    Hoerhilfe <|-- Hoergeraet
    Hoerhilfe <|-- Cochleaimplantat
    Hoerhilfe <|-- Baha
    Mittelohr --> Innenohr : überträgt die Schwingung
    Innenohr --> Hoernerv : wandelt in Aktionspotenziale
    Hoergeraet ..> Mittelohr : setzt davor an
    Baha ..> Innenohr : umgeht Gehörgang und Mittelohr
    Cochleaimplantat ..> Hoernerv : umgeht das Innenohr
    style Cochleaimplantat fill:#f4ecf7,stroke:#8e44ad,stroke-width:3px,color:#6c3483
```
`<|-- drei Arten von Hörhilfen`
`--> Weg des Schalls zum Hörnerv`

Je weiter unten am Hörweg ein Gerät ansetzt, desto mehr Stationen überspringt es, und desto weniger vom eigenen Ohr muss noch funktionieren.
## <span style="color:#8e44ad">Cochlea-Implantat</span>
Die drei Felder der Klasse aus der Karte, erweitert um das, was jedes für die Entscheidung am Kind bedeutet.

| Feld aus der Karte | Was dahintersteckt | Was es für die Entscheidung am Kind heisst |
|---|---|---|
| hochgradige Schallempfindung bis Ertaubung | beidseits, das Hörgerät bringt zu wenig | früh versorgen, solange die Hörbahn sich bildet |
| reizt elektrisch | Elektrode liegt in der Cochlea und ersetzt die Haarzellen, nicht den Nerv | erklärt, warum ein Hörgerät hier nichts mehr bringt: es verstärkt, wo nichts mehr zu verstärken ist |
| braucht einen intakten Hörnerv | BERA und Bildgebung vor dem Eingriff | ohne Nerv bleibt das Implantat wirkungslos, deshalb steht die Abklärung vor der Zusage |

Die Karte zeigt nicht, wie gut ein Kind nach der Versorgung hört: das hängt am Alter bei der Implantation und an der Nachbetreuung und braucht Verlaufszahlen.
