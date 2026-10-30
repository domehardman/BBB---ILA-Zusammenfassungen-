## Grob-Planung: Projekt Motorradmotor Fusion 360
1. keine noten bisher erhalten
2. mein projekt ist die entwicklung eines 2 cylinder motorradmotors in dem CAD programm Fusion 360 das ziel ist einen getesteten technisch funktionalen motor in fusion zu entwickeln und dann mithilfe von simulationsprogrammen diesen zu testen - zu schauen wie viel power er produziert was man optimieren könnte und die tests zu dokumentieren

## 16.10.2026
#### Zusammenfassung
Heute habe ich mich vor allem um das Schaltsystem des Getriebes gekümmert. Da die Basis der Dogringe bereits stand, konnte ich darauf aufbauend den Funktionalkörper der Schaltgabeln sowie deren Führungsstange modellieren. Momentan nutze ich noch ein einzelnes Schaltgabel-Modell welches ich 3 mal kopiert habe. Später werde ich aber noch eine zweite oder dritte Variante entwerfen, um die Schaltwalze so kurz wie möglich zu halten und Gewicht zu sparen. Da die Hauptwelle aktuell noch nicht funktional modelliert ist, nehme ich mir das als Hausaufgabe auf.

______________________________________________________________________________________________________________________________________________________________________________________________________________________________

## 23.10.2026
#### Arbeitspakete
- [x] Funktionale Ausmodellierung der Hauptwelle

Dafür werden die genauen Wellenabsätze, Verzahnungen (Splines) und Lagersitze festgelegt. Zudem müssen die Aufnahmen und Führungen für die bereits erstellten Dogringe direkt in die Welle integriert werden, bevor abschließend die axialen Abstände zwischen den einzelnen Zahnrädern und Dogringen überprüft werden.
- [ ] Spezifische Schaltgabel-Varianten konstruieren

kopierten Platzhalter-Schaltgabeln durch individuell angepasste Geometrien ersetzt. Dazu wird eine zweite und bei Bedarf auch eine dritte, seitlich gekröpfte Schaltgabel-Variante entworfen. Ein besonderer Fokus liegt dabei auf der geschickten Ausrichtung der Führungszapfen für die spätere Schaltwalze, damit diese so kurz und kompakt wie möglich gehalten werden kann.
- [x] Funktionale ausmodellierung der Dogringe

Dafür werden die umlaufenden Nuten für die Schaltgabeln modelliert. Zudem erhalten die Mitnehmerzähne der Gangzahnräder sowie die entsprechenden Taschen der Dogringe einen Hinterschnitt, damit die Gänge auch bei extremen Drehzahlen von bis zu 20.000 U/min unter Last sicher im Eingriff bleiben und nicht herausspringen.
#### Zusammenfassung
Die Modellierung der Haubtwelle sowie der Dogringe verlief erfolgreich und konnte abgeschlossen werden. Die Konstruktion der Schaltgabeln ließ sich in der verfügbaren Zeit noch nicht fertigstellen und wird in der nächsten Arbeitseinheit fortgesetzt ich habe zwar gedacht die haubtwelle zuhause abgeschlossen zu haben leider musste ich aber im unterricht noch einige verbesserungen/änderungen vornehmen.

______________________________________________________________________________________________________________________________________________________________________________________________________________________________

## 30.10.2026
#### Arbeitspakete
- [x] Modellierung der Pins, die die Schaltgabeln mit der Schaltwalze verbinden

Die Pins werden anhand der benötigten Einbaumaße und der räumlichen Anordnung des Schaltmechanismus konstruiert. Dabei werden die Positionen und Geometrien der Führungs- und Verbindungselemente festgelegt, um eine zuverlässige Kraftübertragung zwischen Schaltgabeln und Schaltwalze zu ermöglichen.
- [x] Spezifische Schaltgabel-Varianten konstruieren

kopierten Platzhalter-Schaltgabeln durch individuell angepasste Geometrien ersetzt. Dazu wird eine zweite und bei Bedarf auch eine dritte, seitlich gekröpfte Schaltgabel-Variante entworfen. Ein besonderer Fokus liegt dabei auf der geschickten Ausrichtung der Führungszapfen für die spätere Schaltwalze, damit diese so kurz und kompakt wie möglich gehalten werden kann.
- [x] Modellierung der Schaltwalze

Die Schaltwalze wird entsprechend der Anordnung und den erforderlichen Schaltwegen der einzelnen Schaltgabeln konstruiert. Dazu werden die Führungsnuten so ausgelegt, dass sie die Schaltgabeln während der Drehbewegung gezielt axial verschieben und dadurch die einzelnen Gänge präzise ein- und ausrücken können.
- [ ] Blockout des Schaltmechanismus

Die grundlegenden Komponenten zur Betätigung der Schaltwalze werden als vereinfachte 3D-Modelle konstruiert und in ihrer vorgesehenen Einbaulage angeordnet. Dazu gehören der Schalthebel sowie der Dreh- und Rastmechanismus, der die Hebelbewegung in definierte Drehschritte der Schaltwalze umsetzt.
#### Zusammenfassung
Ich habe mich dazu entschieden, die Schaltwalze in drei Teile zu unterteilen, anstatt die Schaltgabeln anzupassen, um die Schaltwalze zu kürzen. Dadurch erreichen wir eine ähnliche Gewichtsersparnis, profitieren aber durch die geraden Schaltgabeln von einem deutlich weicheren Schaltvorgang. Das Modellieren der drei Schaltwalzen-Teile lief gut und war nach einer kurzen Recherche zum "Emboss"-Befehl in Fusion 360 schnell erledigt.
Die Pins musste ich allerdings zweimal überarbeiten. Beim ersten Entwurf waren sie zu filigran, was zu einem sofortigen Abbrechen beim Schalten geführt hätte. Beim zweiten Versuch hatten sie leider nicht die korrekte Position auf der Schaltgabel.
Mir fehlte am Ende die Zeit, den Schaltmechanismus komplett auszublocken. Dies werde ich auch in der nächsten Sitzung zurückstellen. Stattdessen werde ich mich beim nächsten Mal auf das Ausblocken des Kurbeltriebs (Kolben, Kurbelwelle, Laufbuchse und Pleuel) sowie auf das Zusammensetzen der Einzelteile konzentrieren.

_____________________________________________________________________________________________________________________________________________________________________________________________________________________________

## 30.10.2026
#### Arbeitspakete
- [ ] Blockout des Kolbens

Die Grundform des Kolbens wird als vereinfachtes 3D-Modell konstruiert. Dabei werden die grundlegenden Dimensionen, wie Durchmesser und Kompressionshöhe, sowie die Aufnahmepunkte für den Kolbenbolzen festgelegt, um die Platzhalter-Geometrie für den späteren Kurbeltrieb zu definieren.
- [ ] Blockout der Pleuelstange

Das Pleuel wird als Verbindungselement zwischen Kolben und Kurbelwelle grob modelliert. Hierbei liegt der Fokus auf den benötigten Achsabständen (Pleuellänge) sowie den Dimensionen der oberen und unteren Pleuelaugen, um die kinematischen Voraussetzungen für die spätere Baugruppe zu schaffen.
- [ ] Blockout der Kurbelwelle

Die grundlegende Struktur der Kurbelwelle inklusive der Hauptlager- und Hubzapfen wird als vereinfachtes Modell erstellt. Dadurch werden der benötigte Hubraum, die Rotationsachse und die räumlichen Abstände festgelegt, um das Zusammenspiel mit den restlichen Motorkomponenten zu gewährleisten.
- [ ] Blockout der Laufbuchse

Die Zylinderlaufbuchse, in der sich der Kolben später bewegen wird, wird hinsichtlich ihres inneren und äußeren Durchmessers sowie ihrer Gesamtlänge definiert. Dieses Platzhalter-Design dient dazu, den räumlichen Rahmen für die Auf- und Abwärtsbewegung des Kolbens festzulegen.
- [ ] Zusammenbau des Motors

Die zuvor erstellten Einzelkomponenten (Kolben, Pleuel, Kurbelwelle und Laufbuchse) sowie die getriebeteile werden in einer Baugruppe zusammengefügt und räumlich ausgerichtet. Durch das Setzen der entsprechenden Gelenkverbindungen (Joints) wird die kinematische Kette geschlossen, um die Bewegungsabläufe des Kurbeltriebs virtuell auf Freigängigkeit überprüfen zu können.
#### Zusammenfassung

