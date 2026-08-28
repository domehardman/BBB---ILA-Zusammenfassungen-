# Lernperiode 1
14.08 2026 - 26.09 2026

## Grob-Planung: Projekt Rennauto Godot 4.2
1. keine noten bisher erhalten
2. mein projekt ist die programmierung eines hoch realistischen adaptiven autos in dem game engine Godot ich achte besonders auf eine akkurate rekreation der handling charakteristiken und physik des fahrens das auto soll anpassbar auf verschiedene auto-arten sein und ein anpassbares fahrverhalten haben sowie ein fokus auf die fahrdynamik der 20er-50er jahre

## 21.8.2026
#### Zusammenfassung
Heute habe ich die Bremsphysik meines Autos von Grund auf repariert. Der Ursprungscode hatte eine feste Bremskraft in eine feste Richtung angewendet, komplett unabhängig von der tatsächlichen Fahrgeschwindigkeit — das führte dazu, dass die Bremse das Auto bei Stillstand aktiv rückwärts beschleunigt hat, statt es zu stoppen. Ich habe verstanden, warum das Muster aus meiner bestehenden Grip-Berechnung (Richtung definieren → Geschwindigkeit in diese Richtung mit .dot() messen → daraus eine begrenzte Gegenkraft mit clamp() bauen → erst am Ende zu einem Kraftvektor zusammensetzen) genau das Problem löst, und habe die Bremse Schritt für Schritt nach diesem Muster neu aufgebaut. Dabei ist mir auch aufgefallen, wie wichtig die Reihenfolge Skalar-vs-Vektor ist — mehrere meiner ersten Versuche sind daran gescheitert, dass ich Zahlen und Richtungsvektoren vermischt habe, bevor beide fertig waren. Zusätzlich habe ich eine bremskraftverteilung-Variable eingebaut, die die Bremskraft zwischen Vorder- und Hinterachse aufteilt, und zwei Bugs gefixt: eine Variable, die versehentlich außerhalb von _physics_process() stand und dadurch nur einmal beim Spielstart berechnet wurde statt jeden Frame, sowie eine vertauschte Zuordnung der Verteilung zwischen Vorder- und Hinterrädern.

## 28.8.2026
#### Arbeitspakete
- [x] Nichtlineares Reifenmodell (Schlupfkurve statt linearer Grip)
Ich baue die aktuelle lineare Grip-Berechnung (Kraft steigt unbegrenzt proportional zur Rutschgeschwindigkeit) zu einem realistischeren Modell um, bei dem die Kraft bis zu einem Peak-Schlupfwert ansteigt und danach wieder abfällt — so wie sich echte Reifen beim Ausbrechen/Driften verhalten. Das ist die Grundlage für alles Weitere in diesem Themenblock.
- [x] Statische und dynamische Gewichtsverteilung
Ich implementiere, wie viel Gewicht auf jedem Rad lastet, abhängig von Fahrzeugmasse, Schwerpunktlage und aktuellen Beschleunigungskräften (Bremsen verlagert Gewicht nach vorne, Beschleunigen nach hinten, Kurvenfahrt seitlich). Diese Gewichtswerte sollen direkt in die Grip-Berechnung pro Rad einfließen, statt wie bisher nur die Federkompression zu nutzen.
- [x] Reifentemperatur- und Verschleiß-Grundgerüst
Ich lege eine erste einfache Version an, bei der Reifen durch Schlupf Wärme aufbauen und dadurch (in einem gewissen Bereich) mehr Grip bekommen — später ausbaufähig zu Überhitzung und Abbau, passend zu den historischen Reifentechnologien der verschiedenen Jahrzehnte.
- [x] Ackermann-Lenkgeometrie
Ich ersetze die aktuelle Lenkung, bei der beide Vorderräder um denselben Winkel einschlagen, durch eine Ackermann-Geometrie, bei der das kurveninnere Rad stärker einschlägt als das äußere — das verbessert sowohl die Optik als auch das Kurvenverhalten spürbar.

______________________________________________________________________________________________________________________________________________________________________________________________________________________________

#### Zusammenfassung
 Heute konnte ich alle meine geplanten Arbeitspakete erfolgreich abschliessen. Zusätzlich habe ich verschiedene Dämpfer, Federgeometrien und Reifentypen in die Simulation integriert. Das Fahrzeug kann nun z.B. entweder mit einer Swingachse oder einer klassischen Double-Wishbone-Aufhängung ausgestattet werden.
Während der Tests bin ich jedoch auf einen noch nicht behobenen Bug gestossen: Das Fahrzeug berechnet ein deutlich zu hohes Drehmoment, wodurch die Reifen bereits bei geringer Belastung dauerhaft durchdrehen. Dadurch wird die Antriebskraft nicht korrekt auf den Boden übertragen und das Fahrzeug beschleunigt deutlich schlechter als erwartet.

## 6.9.2026
#### Arbeitspakete
- [ ] Bug-Fixes
Ich werde den Berechnungsfehler untersuchen, der für das extrem hohe Drehmoment verantwortlich ist, und versuchen, die Ursache systematisch einzugrenzen und zu beheben.
Dabei werde ich insbesondere die einzelnen Berechnungsschritte des Drehmoments und der Kraftübertragung überprüfen.
- [ ] Visualisierung meiner Räder
Ich werde die globale Position und Rotation meiner Räder bei jedem Tick aktualisieren. Dadurch können unter anderem Camber-Änderungen, Radrotation, Durchdrehen der Reifen und Lenkwinkel visuell dargestellt werden. Die Visualisierung soll zusätzlich beim Debugging und beim Testen des Drehmoment-Bugs helfen.
- [ ] Reifen-Squish
Ich werde die Kontaktfläche zwischen Reifen und Fahrbahn genauer berechnen. Dabei soll die Verformung des Reifens abhängig von dessen Weichheit, Belastung und Squish berücksichtigt werden. Ziel ist eine realistischere Darstellung der Kraftübertragung zwischen Reifen und Fahrbahn.
- [ ] Reifen-Seitenwand und Karkassenmodell
Ich erweitere das Reifenmodell um eine vereinfachte Berechnung der Seitenwand- und Karkassenverformung. Abhängig von Reifenlast, Reifendruck und Quer- beziehungsweise Längskräften soll sich der Reifen unterschiedlich stark verformen und dadurch die Aufstandsfläche sowie das Verhalten des Reifens beeinflussen. Dadurch soll neben dem bereits berechneten Squish auch die seitliche Verformung des Reifens realistischer dargestellt werden.

