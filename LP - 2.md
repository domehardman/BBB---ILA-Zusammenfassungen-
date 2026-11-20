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
- [x] Blockout des Kolbens

Die Grundform des Kolbens wird als vereinfachtes 3D-Modell konstruiert. Dabei werden die grundlegenden Dimensionen, wie Durchmesser und Kompressionshöhe, sowie die Aufnahmepunkte für den Kolbenbolzen festgelegt, um die Platzhalter-Geometrie für den späteren Kurbeltrieb zu definieren.
- [x] Blockout der Pleuelstange

Das Pleuel wird als Verbindungselement zwischen Kolben und Kurbelwelle grob modelliert. Hierbei liegt der Fokus auf den benötigten Achsabständen (Pleuellänge) sowie den Dimensionen der oberen und unteren Pleuelaugen, um die kinematischen Voraussetzungen für die spätere Baugruppe zu schaffen.
- [X] Blockout der Kurbelwelle

Die grundlegende Struktur der Kurbelwelle inklusive der Hauptlager- und Hubzapfen wird als vereinfachtes Modell erstellt. Dadurch werden der benötigte Hubraum, die Rotationsachse und die räumlichen Abstände festgelegt, um das Zusammenspiel mit den restlichen Motorkomponenten zu gewährleisten.
- [x] Blockout der Laufbuchse

Die Zylinderlaufbuchse, in der sich der Kolben später bewegen wird, wird hinsichtlich ihres inneren und äußeren Durchmessers sowie ihrer Gesamtlänge definiert. Dieses Platzhalter-Design dient dazu, den räumlichen Rahmen für die Auf- und Abwärtsbewegung des Kolbens festzulegen.
- [x] Zusammenbau des Motors

Die zuvor erstellten Einzelkomponenten (Kolben, Pleuel, Kurbelwelle und Laufbuchse) sowie die getriebeteile werden in einer Baugruppe zusammengefügt und räumlich ausgerichtet. Durch das Setzen der entsprechenden Gelenkverbindungen (Joints) wird die kinematische Kette geschlossen, um die Bewegungsabläufe des Kurbeltriebs virtuell auf Freigängigkeit überprüfen zu können.
#### Zusammenfassung
alles fertig da es ziemlich simpel war hatte ich keine probleme die assembly lief gut und ich fand keine probleme

_____________________________________________________________________________________________________________________________________________________________________________________________________________________________


## 13.11.2026

#### Arbeitspakete
- [x] neues motorlayout vergleichen und anpassen der assembly dafür

ich habe chatgpt gefragt ob er in meinem fall einen v2 motor statt einen inline bauen würde er hat mir definitiv ja gesagt ich werde mich dazu informieren und dann entscheiden ob ich die assembly auf einen v2 ändern werde, da ich den kopf noch nicht modelliert habe werde ich auch nichts neu modellieren müssen
- [x] ausweiden und detailieren der letzte woche modellierten teile

Die letzte woche gemachten teile (kurbeltrieb) sind momentan nur grobe grössenschätzungen in diesem schritt werde ich sie detailiert und funktional modellieren un danach durch hohlräumen so viel gewicht entfernen wie möglich (der kolben daf nicht mehr als 125g wiegen damit er nicht die pleuel zerbricht)
- [x] modellieren des kopfs

ich modelliere den kopf komplett und achte auf einen genügend grossen hohlraum damit das dvalve system genügend platz hat (benötigt mehr als ein standart federventilsystem) ausserdem schaue ich auf eine optimale brennraumform sowie optimale valveöffungsfläche damit genug luft rein und raus kann
- [X] modellieren der desmo valves und des valve systems

ich modelliere das desmo valve system und die valves der unterschied zu einem tandartmässigen federventil trieb ist das die valves nicht zurüchfedern sondern fest mit der nockenwelle verbunden sind weshalb sichbei den hohen drehzahlen des motors kein valve float bilden kann valve float nennt man es wenn der valve nicht schnell genug zurückspringen kann und vom kolben getroffen wird was den valve sofort zerstören kann und damit auch den motor der nachteil an dem desmo system ist es ist kompliziert deswegen brauch ich möglicherweise mehrere überarbeitungen
- [x] animieren des kurbeltriebs um überlappungen zu erkennen und diese zu entfernen

ich werde alle teile in der assembly mit gelenken verbinden und dann schauen ob sich irgendetwas in der assembly unmöglich überlappt ausserdem werde ich dem ganzen motor etwas farbe geben zur einfacheren identifizierung einzelner teile

#### Zusammenfassung
heute lief super ich habe alles noch vor 16:15 erledigen können und musste daher nichts zuhause machen kleinere probleme gab es bei der internen "schwammstruktur" im kolben da diese schwer zu modellieren war ich glaube den kopf könnte man in dem gewicht noch etwas reduzieren aber dann sieht er nicht mehr gut aus...

_____________________________________________________________________________________________________________________________________________________________________________________________________________________________


## 20.11.2026

#### Arbeitspakete
- [X] Umbau des Getriebes auf ein mechanisches Seamless-Schnellschaltgetriebe (MotoGP-Prinzip)

Das bestehende Dogring-Schaltsystem wird durch einen internen Sperrklinken- und Freilaufmechanismus (Ratchet/Pawl-System) innerhalb einer hohlen Getriebewelle ersetzt. Dadurch können zwei aufeinanderfolgende Gänge für den Bruchteil einer Sekunde gleichzeitig im Eingriff sein, wobei das schneller drehende Zahnrad das langsamere automatisch überholt und entriegelt. Dies ermöglicht extrem schnelle Gangwechsel unter Volllast ohne Zugkraftunterbrechung.
- [X] Konstruktion des Kupplungskorbs (Clutch Basket) und der inneren Nabe

Der äussere Kupplungskorb inklusive der Primärverzahnung zur Kurbelwelle sowie die innere Kupplungsnabe werden detailliert ausmodelliert. Besonderer Fokus liegt auf den Führungsfingern für die Lamellen, gezielten Aussparungen zur Gewichtsreduktion und der Ölzufuhr zur Kühlung. Optional wird eine mechanische Anti-Hopping-Rampe (Slipper-Clutch) integriert, um ein Stempeln des Hinterrads beim harten Herunterschalten aus hohen Drehzahlen zu verhindern.
- [X] Modellierung des Kupplungspakets (Reib- und Stahlscheiben) sowie der Druckplatte

Die abwechselnd geschichteten Reiblamellen (mit Aussenmitnehmern für den Korb) und Stahlscheiben (mit Innenverzahnung für die Nabe) werden konstruiert und als Paket auf der Getriebeeingangswelle ausgerichtet. Abschliessend wird die Kupplungsdruckplatte inklusive der Aufnahmen für die Kupplungsfedern modelliert, um den nötigen Anpressdruck für das hohe Drehmoment sicherzustellen.
- [X] Blockout und Grundmodellierung des ersten Motorgehäuses (Kurbel- und Getriebegehäuse)

Um die bestehenden Baugruppen (V2-Kurbeltrieb, Seamless-Getriebe und Kupplung) räumlich zu fixieren, wird die erste Hälfte des Motorgehäuses konstruiert. Dabei werden die exakten Lagersitze für Kurbel- und Getriebewellen, die Flanschflächen für die beiden V2-Zylinder sowie die äusseren Dichtflächen und Verschraubungspunkte festgelegt, während die Wandstärken so schlank und verwindungssteif wie möglich gehalten werden.

#### Zusammenfassung
Eigentlich lief heute alles ziemlich gut, allerdings hatte ich beim Umbau auf das Seamless-Getriebe ein paar Probleme mit meiner Zeitplanung. Ich habe die interne Mechanik mit den Sperrklinken am Anfang noch nicht so ganz verstanden und musste erst mal recherchieren, wie das genau funktioniert, damit sich beim Schalten nicht zwei Gänge gleichzeitig blockieren. Als das Prinzip dann klar war, ging das Modellieren von Getriebe, Clutch Basket und den Kupplungsscheiben aber ohne grössere Probleme. Durch die verlorene Zeit am Anfang hat es im Unterricht leider nicht mehr ganz für das erste Gehäuse gereicht, weshalb ich das bis zum nächsten Mal zuhause noch fertig machen muss.

_____________________________________________________________________________________________________________________________________________________________________________________________________________________________







