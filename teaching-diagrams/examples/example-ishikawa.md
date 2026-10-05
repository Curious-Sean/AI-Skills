---
tags:
  - contains_AI
source:
  - "[[Vorlesung Mittelohr.pdf]]"
---
# <span style="color:#000000">Karte</span>
Zeigt die Bereiche, aus denen die Rezidive einer Otitis media beim Kleinkind kommen, und welche Ursachen in jedem Bereich zusammengehören.
```mermaid
ishikawa-beta
    Rezidivierende akute Otitis media beim Kleinkind
    Tube
        kurz und horizontal
        weicher Knorpel
        Funktionsstörung nach jedem Infekt
    Nasopharynx
        Adenoide
            Keimreservoir mit Biofilm
            verlegen die Tubenostien
        Schleimhaut
            allergische Rhinitis
            chronische Rhinosinusitis
    Erreger
        Pneumokokken
        Haemophilus influenzae non typeable
        Moraxella catarrhalis
    Wirt
        Impfstatus
            fehlende Pneumokokkenimpfung
            fehlende Influenzaimpfung
        Disposition
            Lippen-Kiefer-Gaumen-Spalte
            Trisomie 21
        Immunität
            IgG-Subklassenmangel
            selektiver IgA-Mangel
    Umgebung
        Krippe und ältere Geschwister
        Passivrauch
        Schoppen im Liegen
```
## <span style="color:#000000">Tube</span>
Die drei Eigenschaften der Rippe aus der Karte, erweitert um den Vergleich mit dem Erwachsenen: er sagt, warum es das Kleinkind trifft.

| Eigenschaft aus der Karte | Kleinkind | Erwachsener | Folge |
|---|---|---|---|
| kurz und horizontal | Grössenordnung 18 mm und fast waagrecht | Grössenordnung 35 mm und steil nach unten | Keime aus dem Nasopharynx erreichen das Mittelohr leichter und Sekret läuft schlechter ab |
| weicher Knorpel | nachgiebiges Gerüst, die Tube fällt zusammen | stabil, öffnet beim Schlucken zuverlässig | die Belüftung fällt schon bei geringer Schwellung aus |
| Funktionsstörung nach jedem Infekt | mehrere Atemwegsinfekte pro Jahr, jedes Mal geschwollene Schleimhaut | seltener und kürzer | jede Episode hält den Unterdruck aufrecht und bereitet das nächste Rezidiv vor |
## <span style="color:#000000">Nasopharynx</span>
Die zwei Gruppen der Rippe aus der Karte, erweitert um das, was sie im Mittelohr auslösen.
```mermaid
flowchart TD
    subgraph ADE["Adenoide"]
        direction TB
        A1["Keimreservoir mit Biofilm"]
        A2["verlegen die Tubenostien"]
    end
    subgraph SCH["Schleimhaut"]
        direction TB
        S1["allergische Rhinitis"]
        S2["chronische Rhinosinusitis"]
    end
    A2 ==> UNT["Unterdruck im Mittelohr"]
    UNT ==> ERG["Erguss"]
    ERG ==> SUP["Superinfektion, das nächste Rezidiv"]
    S1 -->|"die geschwollene Schleimhaut verengt das Ostium zusätzlich"| A2
    S2 -->|"eitriges Sekret spült zum Ostium"| A1
    A1 -->|"liefert die Keime für die Superinfektion"| SUP

    classDef neutral fill:#ecf0f1,stroke:#bdc3c7,color:#2c3e50
    class A1,A2,S1,S2,UNT,ERG,SUP neutral
```
`==> Hauptweg zum Rezidiv`

Die Karte zeigt nicht, welcher Bereich am häufigsten den Ausschlag gibt: dazu braucht es Häufigkeitszahlen, die eine Ursachenkarte nicht trägt.
