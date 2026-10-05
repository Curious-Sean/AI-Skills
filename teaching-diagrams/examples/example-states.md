---
tags:
  - contains_AI
source:
  - "[[Vorlesung Mittelohr.pdf]]"
---
# <span style="color:#000000">Karte</span>
Zeigt, welche Zustände ein Mittelohr durchläuft und auf welchen Wegen es in einen früheren zurückkehrt.
```mermaid
stateDiagram-v2
    direction TB
    state "Belüftetes Mittelohr" as Belueftet
    state "Akute Otitis media" as AOM
    state "Paukenerguss" as Erguss
    state "Retraktion des Trommelfells" as Retraktion
    state "Paukendrainage" as Drainage
    [*] --> Belueftet
    Belueftet --> AOM: Infekt der oberen Luftwege, die Tube fällt aus
    AOM --> Belueftet: heilt meist spontan aus
    AOM --> Erguss: die Entzündung klingt ab, die Flüssigkeit bleibt
    Erguss --> Belueftet: die Tube erholt sich, meist innert 3 Monaten
    Erguss --> Drainage: über 3 Monate mit Hörverlust
    Erguss --> Retraktion: anhaltender Unterdruck zieht das Trommelfell ein
    Retraktion --> Drainage: belüften, bevor Verklebungen entstehen
    Drainage --> Belueftet: das Trommelfell verschliesst sich
    Drainage --> Erguss: der Erguss kehrt nach der Ausstossung zurück

    classDef drain fill:#eafaf1,stroke:#27ae60,stroke-width:3px,color:#1e8449
    class Drainage drain
```
## <span style="color:#27ae60">Paukendrainage</span>
Der Zustand aus der Karte, aufgeklappt in die drei Zustände des Röhrchens, mit dem, was in jedem passiert und woran die Indikation hängt.
```mermaid
flowchart TD
    subgraph OFF["Röhrchen offen"]
        direction TB
        O1["Mittelohr über den Gehörgang belüftet"]
        O2["Hörgewinn sofort, Grössenordnung 10 dB"]
        O1 --> O2
    end
    subgraph OTO["Otorrhoe"]
        direction TB
        R1["Keime erreichen das Mittelohr durch das Röhrchen"]
        R2["Ohrentropfen wirken direkt am Herd"]
        R1 --> R2
    end
    subgraph AUS["Röhrchen ausgestossen"]
        direction TB
        A2["Trommelfell verschliesst sich meist von selbst"]
        A3["bleibende Perforation oder Myringosklerose"]
        A2 -.->|"selten"| A3
    end
    subgraph WEG["Die drei Wege beim Erguss"]
        direction TB
        V1["Abwarten"]
        V2["Paukendrainage"]
        V3["Drainage mit Adenotomie"]
    end
    OFF --> OTO
    OFF ==>|"nach 6 bis 12 Monaten"| AUS
    V2 ---|"genau dieser Verlauf"| OFF
    A3 ---|"Argument für Abwarten beim leichten Erguss"| V1
    V2 ---|"gleicher Eingriff, zusätzlich die Adenoide"| V3

    classDef weg fill:#8e44ad,stroke:#6c3483,color:#ffffff
    classDef neutral fill:#ecf0f1,stroke:#bdc3c7,color:#2c3e50
    class WEG weg
    class O1,O2,R1,R2,A2,A3,V1,V2,V3 neutral
```
`==> Hauptverlauf des Röhrchens`
`--> was daraus folgt`
### <span style="color:#8e44ad">Die drei Wege beim Erguss</span>
Die drei Wege aus der Karte darüber, erweitert um das, was sie unterscheidet.

| Weg | Hören kurzfristig | Wiederkehr | Belastung |
|---|---|---|---|
| Abwarten | bleibt eingeschränkt | der Erguss geht in der Mehrzahl innert 3 Monaten von selbst zurück | keine Narkose |
| Paukendrainage | Gewinn sofort, Grössenordnung 10 dB | der Erguss kann nach der Ausstossung wiederkehren | Narkose, Otorrhoe möglich |
| Drainage mit Adenotomie | gleicher Gewinn | seltener ein zweiter Eingriff nötig, vor allem bei älteren Kindern | grösserer Eingriff, Nachblutungsrisiko |

Die Karte zeigt nicht, wie lange der Hörgewinn anhält: dazu braucht es Verlaufszahlen, die eine Momentaufnahme nicht trägt.
