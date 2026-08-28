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

 #### Zusammenfassung
 Heute habe ich die alle meine arbeitspakete erfüllt ausserdem habe ich verschiedene dämpfer, federgeometrien und reifen arten hinzugefügt - nun kann das auto eine swingachseoder eine klassische double wishbone aufhängung    haben ich bin jedoch auf einen bug gestossen den ich noch nicht fixen konnte dieser ist das mein auto viel zu viel drehmoment generiert und sich dadurch die reifen permanent durchdrehen weswegen das auto kaum beschleunigt 

 ## 6.9.2026
- [] Bug Fixes
Ich finde den berechnungsfehler welcher meinen drehmoment so extrem erhöht undversuche diesen auszumürben 
- [] Visualisierung meiner räder
Ich update die globale position und rotation meiner räder jeden tick um camber change, durchdrehen und generelles drehen des rades und lenkung visuell darzustellen was mir auch sehr beim debugging und testen meines drehmoment bugs helfen könnte
- [] reifen "squish"
Ich werde basierend auf berechnungen im code die kontaktfläche zwischen reifen und boden basierend auf weichheit und squish des reifens genauer berechnen
 

