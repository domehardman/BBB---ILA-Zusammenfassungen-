## Grob-Planung: Projekt Motorradmotor (Fusion 360)
1. **Status:** Bisher keine Noten erhalten.
2. **Projektziel:** Entwicklung eines technisch funktionalen 2-Zylinder-Motorradmotors im CAD-Programm Fusion 360. Das Ziel ist es, sämtliche Baugruppen (Getriebe, Kurbeltrieb, Ventiltrieb, Kupplung und Gehäuse) kinematisch korrekt zu konstruieren, über Gelenke (Joints) auf Freigängigkeit zu prüfen und kritische Bauteile anschliessend mittels FEM-Simulation (Spannungs- und Belastungsanalyse) auf Schwachstellen und Gewichtsersparnis zu optimieren.

## 16.10.2026
#### Zusammenfassung
Heute habe ich mich vor allem um das Schaltsystem des Getriebes gekümmert. Da die Basis der Dogringe bereits stand, konnte ich darauf aufbauend den Grundkörper der Schaltgabeln sowie deren Führungsstange modellieren. Momentan nutze ich noch ein einzelnes Schaltgabel-Modell as Platzhalter, welches ich dreimal kopiert habe. Später werde ich spezifische Varianten bzw. eine angepasste Schaltwalze entwerfen, um das Getriebe so kompakt und leicht wie möglich zu halten. Da die Hauptwelle aktuell noch nicht funktional ausmodelliert ist, nehme ich mir das als Hausaufgabe vor.

## 23.10.2026
#### Arbeitspakete
- [x] **Funktionale Ausmodellierung der Hauptwelle:** Festlegen der genauen Wellenabsätze, Verzahnungen (Splines) und Lagersitze. Integration der Führungen für die Dogringe sowie Überprüfung der axialen Abstände zwischen den Zahnrädern.
- [ ] **Spezifische Schaltgabel-Varianten konstruieren:** Ersetzen der kopierten Platzhalter-Schaltgabeln durch angepasste Geometrien. Ausrichtung der Führungszapfen für eine möglichst kurze und kompakte Schaltwalze.
- [x] **Funktionale Ausmodellierung der Dogringe:** Modellierung der umlaufenden Nuten für die Schaltgabeln. Konstruktion von Hinterschnitten (Undercuts) an den Mitnehmerzähnen und Taschen, damit die Gänge auch bei hohen Drehzahlen (bis 20.000 U/min) unter Last sicher im Eingriff bleiben.

#### Zusammenfassung
Die Modellierung der Hauptwelle sowie der Dogringe verlief erfolgreich und konnte abgeschlossen werden. Ich dachte zwar, die Hauptwelle bereits zuhause fertiggestellt zu haben, musste im Unterricht aber noch einige Verbesserungen an den Massen vornehmen. Aus diesem Grund liess sich die Anpassung der Schaltgabeln in der verfügbaren Zeit nicht mehr fertigstellen und wird in die nächste Einheit verschoben.

## 30.10.2026 (Einheit 1 – Getriebeschaltung)
#### Arbeitspakete
- [x] **Modellierung der Schaltpins:** Konstruktion der Führungsstifte, welche die Schaltgabeln mit den Nuten der Schaltwalze verbinden.
- [x] **Konzeptänderung Schaltgabeln & Schaltwalze:** Finale Auslegung der Schaltgabel-Geometrie im Zusammenspiel mit der Schaltwalze.
- [x] **Modellierung der Schaltwalze:** Auslegung der Führungsnuten (mittels Emboss-Funktion), um die Drehbewegung gezielt in eine axiale Verschiebung der Schaltgabeln umzusetzen.
- [ ] **Blockout des äusseren Schaltmechanismus:** Grobmodellierung von Schalthebel sowie Dreh- und Rastmechanismus als vereinfachte 3D-Modelle.

#### Zusammenfassung
Ich habe mich dazu entschieden, die Schaltwalze in drei Segmente zu unterteilen, anstatt gekröpfte Schaltgabeln zu verwenden. Dadurch erreichen wir eine ähnliche Platz- und Gewichtsersparnis, profitieren aber durch die geraden Schaltgabeln von einer direkteren Kraftübertragung und einem weicheren Schaltvorgang. Nach einer kurzen Recherche zum "Emboss"-Befehl in Fusion 360 liessen sich die Nuten der Schaltwalze gut umsetzen. 
Die Pins musste ich zweimal überarbeiten: Beim ersten Entwurf waren sie zu filigran und wären unter Last abgeschert, beim zweiten Versuch stimmte die Position auf der Schaltgabel noch nicht. Da am Ende die Zeit für den äusseren Schaltmechanismus fehlte, stelle ich diesen vorerst zurück und widme mich als Nächstes dem Kurbeltrieb.

## 30.10.2026 (Einheit 2 – Blockout Kurbeltrieb)
#### Arbeitspakete
- [x] **Blockout des Kolbens:** Vereinfachtes 3D-Modell zur Festlegung von Bohrungsdurchmesser, Kompressionshöhe und Kolbenbolzen-Aufnahme.
- [x] **Blockout der Pleuelstange:** Grobmodellierung mit Fokus auf den Stichmass-Abstand (Pleuellänge) und die Dimensionen der Pleuelaugen.
- [x] **Blockout der Kurbelwelle:** Grundstruktur inklusive Hauptlager- und Hubzapfen zur Definition von Hub und Rotationsachse.
- [x] **Blockout der Laufbuchse:** Festlegung von Innen-/Aussendurchmesser sowie Gesamtlänge als Führung für den Kolben.
- [x] **Erster Zusammenbau (Assembly):** Zusammenfügen von Kurbeltrieb und Getriebe über Gelenke (Joints) zur ersten kinematischen Prüfung.

#### Zusammenfassung
Da es sich um einfache Grundgeometrien (Blockouts) handelte, lief die Modellierung reibungslos. Auch das Zusammenfügen in der Hauptbaugruppe und das Setzen der Gelenke funktionierten auf Anhieb ohne Kollisionen.

## 13.11.2026
#### Arbeitspakete
- [x] **Umstellung des Motorlayouts auf V2:** Vergleich zwischen Reihenzweizylinder (Inline-2) und V2-Layout. Umbau und Neuausrichtung der bestehenden Baugruppe auf ein V2-Konzept mit Königswellen-Antrieb.
- [x] **Detaillierung und Gewichtsoptimierung des Kurbeltriebs:** Ausarbeitung der Blockout-Teile (Kolben mit Ventiltaschen, H-Schaft-Pleuel, Kurbelwelle mit Gegengewichten). Gezielte Materialreduktion am Kolben (Zielgewicht unter 125 g zur Reduzierung der oszillierenden Massen).
- [x] **Modellierung der Zylinderköpfe:** Konstruktion der Zylinderköpfe inklusive Nockenwellen-Lagerbrücken, Zündkerzenschächten, Ansaugtrichtern (Velocity Stacks) mit Einspritzdüsen-Halterung sowie Brennraumgeometrie.
- [x] **Modellierung des Desmodromik-Ventiltriebs:** Konstruktion der Nockenwellen sowie der Öffner- und Schliesser-Kipphebel (Desmo-System). Durch die zwangsgesteuerte Ventilschliessung ohne Ventilfedern wird Ventilflattern (Valve Float) bei hohen Drehzahlen verhindert.
- [x] **Kinematik-Animation und Farbgebung:** Verbinden aller neuen Komponenten mit Gelenken, Kollisionsprüfung bei voller Rotation und farbliche Differenzierung der Baugruppen.

#### Zusammenfassung
Nach einer kurzen Recherche zu den Vor- und Nachteilen habe ich mich entschieden, das Layout von einem Reihenmotor auf einen V2-Motor umzustellen. Da der Zylinderkopf noch nicht konstruiert war, liess sich der Kurbeltrieb relativ effizient anpassen. Heute lief es sehr gut und ich bin mit allen Paketen im Unterricht vor 16:15 Uhr fertig geworden. 
Herausfordernd war vor allem die interne Hohlraumstruktur zur Gewichtsreduktion an der Kolbenunterseite sowie die exakte Ausrichtung der Desmo-Kipphebel, damit sich Öffner und Schliesser nicht blockieren. Beim Zylinderkopf könnte man theoretisch noch etwas Material einsparen, was allerdings die äussere Optik und Steifigkeit beeinträchtigen würde.

## 20.11.2026
#### Arbeitspakete
- [x] **Überarbeitung des Getriebes (Seamless-Prinzip):** Umbau der Zahnradaufnahmen von klassischen Dogringen auf einen internen Sperrklinken-/Freilaufmechanismus (Ratchet-System) auf der Getriebewelle, um Gangwechsel ohne Zugkraftunterbrechung zu ermöglichen.
- [x] **Konstruktion von Kupplungskorb und Nabe:** Detaillierte Ausmodellierung des äusseren Kupplungskorbs mit Primärverzahnung und Kühlungsschlitzen sowie der inneren Kupplungsnabe.
- [x] **Modellierung des Kupplungspakets:** Aufbau der abwechselnd geschichteten Reib- und Stahllamellen inklusive Druckplatte auf der Getriebeeingangswelle.
- [x] **Modellierung des Motorgehäuses und Ölsystems:** Konstruktion des mehrteiligen, verrippten Kurbel- und Getriebegehäuses inklusive Lagersitzen, Gehäusedeckeln und Verschraubungspunkten sowie Ergänzung eines Ölkühlers/-tanks mit externen Ölleitungen zu den Lagerstellen.

#### Zusammenfassung
Beim Umbau auf das Seamless-Getriebe hatte ich anfangs etwas Mühe mit der Zeitplanung, weil ich die genaue Sperrklinken-Mechanik im Inneren der Zahnräder erst im Detail verstehen und recherchieren musste, damit nicht zwei Gänge gleichzeitig blockieren. Sobald das Prinzip klar war, lief das Modellieren des Getriebes sowie des Kupplungskorbs und der Lamellen problemlos. 
Da die Recherche am Anfang Zeit gekostet hat, reichte es im Unterricht nicht mehr ganz für das Motorgehäuse. Ich habe das komplette Gehäuse sowie den Ölkreislauf (Ölbehälter und Leitungen) anschliessend zuhause in meiner Freizeit fertiggestellt.
