# Lernperiode 1
14.08 2026 - 26.09 2026

# Projekt Auto in Godot:

<img width="1012" height="500" alt="grafik" src="https://github.com/user-attachments/assets/22744b32-4be3-4c1d-94bd-ac6fb3ec835f" />

Das Projekt ist ein Fahrphysik-System für ein Rennspiel in der Godot-Engine, das Autos aus verschiedenen Epochen (1910er, 1920er/30er, 1950er) realistisch simuliert, statt sie simpel vorwärts fahren zu lassen. Für jedes der vier Räder werden einzeln Federung, Drehzahl und Grip berechnet, dazu kommen vier historische Achstypen (Starrachse, Pendelachse, Doppelquerlenker, De-Dion) und zwei Dämpferarten, die jeweils unterschiedlich federn und lenken. Das Herzstück ist ein Reifenmodell, das echten Grip abhängig von Schräglaufwinkel, Durchdrehen, Temperatur und Verschleiß berechnet, ergänzt um Aerodynamik, die bei hohem Tempo mehr Anpressdruck, aber auch mehr Luftwiderstand erzeugt. Dadurch fühlt sich jedes Auto spürbar anders an: ältere Fahrzeuge mit schmaleren Reifen rutschen leichter weg als spätere Modelle mit besserem Gummi. Das Auto kann so realistisch übersteuern, untersteuern, durchdrehen oder blockieren, ganz wie ein echtes Fahrzeug.

______________________________________________________________________________________________________________________________________________________________________________________________________________________________

## Grob-Planung: Projekt Rennauto Godot 4.2
1. keine noten bisher erhalten
2. mein projekt ist die programmierung eines hoch realistischen adaptiven autos in dem game engine Godot ich achte besonders auf eine akkurate rekreation der handling charakteristiken und physik des fahrens das auto soll anpassbar auf verschiedene auto-arten sein und ein anpassbares fahrverhalten haben sowie ein fokus auf die fahrdynamik der 20er-50er jahre

## 21.8.2026
#### Zusammenfassung
Heute habe ich die Bremsphysik meines Autos von Grund auf repariert. Der Ursprungscode hatte eine feste Bremskraft in eine feste Richtung angewendet, komplett unabhängig von der tatsächlichen Fahrgeschwindigkeit — das führte dazu, dass die Bremse das Auto bei Stillstand aktiv rückwärts beschleunigt hat, statt es zu stoppen. Ich habe verstanden, warum das Muster aus meiner bestehenden Grip-Berechnung (Richtung definieren → Geschwindigkeit in diese Richtung mit .dot() messen → daraus eine begrenzte Gegenkraft mit clamp() bauen → erst am Ende zu einem Kraftvektor zusammensetzen) genau das Problem löst, und habe die Bremse Schritt für Schritt nach diesem Muster neu aufgebaut. Dabei ist mir auch aufgefallen, wie wichtig die Reihenfolge Skalar-vs-Vektor ist — mehrere meiner ersten Versuche sind daran gescheitert, dass ich Zahlen und Richtungsvektoren vermischt habe, bevor beide fertig waren. Zusätzlich habe ich eine bremskraftverteilung-Variable eingebaut, die die Bremskraft zwischen Vorder- und Hinterachse aufteilt, und zwei Bugs gefixt: eine Variable, die versehentlich außerhalb von _physics_process() stand und dadurch nur einmal beim Spielstart berechnet wurde statt jeden Frame, sowie eine vertauschte Zuordnung der Verteilung zwischen Vorder- und Hinterrädern.

______________________________________________________________________________________________________________________________________________________________________________________________________________________________

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
 Heute konnte ich alle meine geplanten Arbeitspakete erfolgreich abschliessen. Zusätzlich habe ich verschiedene Dämpfer, Federgeometrien und Reifentypen in die Simulation integriert. Das Fahrzeug kann nun z.B. entweder mit einer Swingachse oder einer klassischen Double-Wishbone-Aufhängung ausgestattet werden.
Während der Tests bin ich jedoch auf einen noch nicht behobenen Bug gestossen: Das Fahrzeug berechnet ein deutlich zu hohes Drehmoment, wodurch die Reifen bereits bei geringer Belastung dauerhaft durchdrehen. Dadurch wird die Antriebskraft nicht korrekt auf den Boden übertragen und das Fahrzeug beschleunigt deutlich schlechter als erwartet.

______________________________________________________________________________________________________________________________________________________________________________________________________________________________

## 4.9.2026
#### Arbeitspakete
- [x] Bug-Fixes
Ich werde den Berechnungsfehler untersuchen, der für das extrem hohe Drehmoment verantwortlich ist, und versuchen, die Ursache systematisch einzugrenzen und zu beheben.
Dabei werde ich insbesondere die einzelnen Berechnungsschritte des Drehmoments und der Kraftübertragung überprüfen.
- [x] Visualisierung meiner Räder
Ich werde die globale Position und Rotation meiner Räder bei jedem Tick aktualisieren. Dadurch können unter anderem Camber-Änderungen, Radrotation, Durchdrehen der Reifen und Lenkwinkel visuell dargestellt werden. Die Visualisierung soll zusätzlich beim Debugging und beim Testen des Drehmoment-Bugs helfen.
- [x] Reifen-Squish
Ich werde die Kontaktfläche zwischen Reifen und Fahrbahn genauer berechnen. Dabei soll die Verformung des Reifens abhängig von dessen Weichheit, Belastung und Squish berücksichtigt werden. Ziel ist eine realistischere Darstellung der Kraftübertragung zwischen Reifen und Fahrbahn.
- [ ] Reifen-Seitenwand und Karkassenmodell
Ich erweitere das Reifenmodell um eine vereinfachte Berechnung der Seitenwand- und Karkassenverformung. Abhängig von Reifenlast, Reifendruck und Quer- beziehungsweise Längskräften soll sich der Reifen unterschiedlich stark verformen und dadurch die Aufstandsfläche sowie das Verhalten des Reifens beeinflussen. Dadurch soll neben dem bereits berechneten Squish auch die seitliche Verformung des Reifens realistischer dargestellt werden.

#### Zusammenfassung
Diese Woche lief leider nicht nach Plan, da mich die Behebung zahlreicher neu entdeckter Bugs extrem aufgehalten hat. Dadurch fehlte mir letztendlich die Zeit, um die Raycasts und die Reifenphysik (Squish und Karkassenmodell) wie geplant umzusetzen. Ein großer Erfolg war jedoch, dass ich zum Schluss zumindest noch die Räder korrekt animieren konnte. Die zwei unerfüllten Pakete nehme ich in die nächste Woche mit, wo ich außerdem noch ein paar kleinere Fehler beheben werde, wie etwa das leichte Zittern des Autos bei höheren Geschwindigkeiten.

______________________________________________________________________________________________________________________________________________________________________________________________________________________________

## 11.9.2026
#### Arbeitspakete
- [x] Reifen-Squish
Ich werde die Kontaktfläche zwischen Reifen und Fahrbahn genauer berechnen. Dabei soll die Verformung des Reifens abhängig von dessen Weichheit, Belastung und Squish berücksichtigt werden. Ziel ist eine realistischere Darstellung der Kraftübertragung zwischen Reifen und Fahrbahn.
- [ ] Reifen-Seitenwand und Karkassenmodell
Ich erweitere das Reifenmodell um eine vereinfachte Berechnung der Seitenwand- und Karkassenverformung. Abhängig von Reifenlast, Reifendruck und Quer- beziehungsweise Längskräften soll sich der Reifen unterschiedlich stark verformen und dadurch die Aufstandsfläche sowie das Verhalten des Reifens beeinflussen. Dadurch soll neben dem bereits berechneten Squish auch die seitliche Verformung des Reifens realistischer dargestellt werden.
- [x] Implementierung von Aerodynamik und Abtrieb (Downforce)
Ich werde ein grundlegendes Aerodynamik-System hinzufügen, das den Luftwiderstand und den Abtrieb basierend auf der aktuellen Fahrzeuggeschwindigkeit berechnet. Der zusätzliche Anpressdruck auf Vorder- und Hinterachse soll nicht nur den Grip in schnellen Kurven erhöhen, sondern auch dazu beitragen, das Auto bei hohen Geschwindigkeiten stärker auf den Boden zu drücken und so das Fahrverhalten weiter zu stabilisieren.
- [x] Fehlerbehebung
die drecks käfer krabbeln mir einen zu viel!!!

#### Zusammenfassung
Diese Woche lief leider nicht nach Plan, da ich einfach nicht hinter die hartnäckigen Bugs bei der Reifenphysik kommen konnte. Zwischenzeitlich war ich so blockiert, dass ich bei der Fehlersuche der KI die Überhand ließ – wodurch sich aber letztendlich auch nichts verbesserte. Dadurch fehlte mir ein funktionierender Ansatz, um den Reifen-Squish, die Seitenwand und das Karkassenmodell wie geplant umzusetzen. Ich bin zu dem Schluss gekommen, dass ich wahrscheinlich fundamentale Berechnungen ändern muss, um das Zeug funktional zu machen. Ein großer Erfolg war jedoch, dass ich den Rest erfolgreich implementiert habe: Das neue Aerodynamik-System für Luftwiderstand und Abtrieb (Downforce) ist integriert und sorgt bereits für spürbar mehr Anpressdruck und Stabilität bei hohen Geschwindigkeiten. Die unerfüllten Reifen-Pakete nehme ich in die nächste Woche mit, wo ich sie mit einem neuen mathematischen Fundament angehen werde.

__________________________________________________________________________________________________________________________________________________________________________________________________________________________________

## 18.9.2026
#### Arbeitspakete
- [x] Überarbeitung der fundamentalen Physik-Berechnungen
Ich werde die mathematische Basis für die Radaufhängung und die grundlegende Kraftübertragung neu strukturieren. Da der alte Code zu unlösbaren Bugs geführt hat, baue ich ein saubereres, fehlerbereinigtes Fundament auf. Dies ist zwingend notwendig, damit die komplexere Reifensimulation (Karkasse und Squish) im nächsten Schritt stabil berechnet werden kann.
- [x] Reifen-Squish
Ich werde die Kontaktfläche zwischen Reifen und Fahrbahn genauer berechnen. Dabei soll die Verformung des Reifens abhängig von dessen Weichheit, Belastung und Squish berücksichtigt werden. Ziel ist eine realistischere Darstellung der Kraftübertragung zwischen Reifen und Fahrbahn.

#### Zusammenfassung
Heute ist wirklich alles perfekt gelaufen. Ich habe es endlich geschafft, etwas Funktionales, Detailliertes und einigermassen Realistisches zu erstellen. Ich habe keine weiteren Bugs gefunden.
Das Problem lag letztendlich daran, dass jedes Mal, wenn der Grip aufgrund der Gewichtsverlagerung des Fahrzeugs neu berechnet wurde, dem horizontalen Gripkoeffizienten mehr abgezogen wurde, als ich ihm jemals wieder zurückgegeben habe. Dadurch wurde das Auto mit jeder Neuberechnung schlechter und schlechter, bis es sich schlussendlich unendlich lange im Kreis gedreht hat und ich nichts mehr dagegen tun konnte. das war letztendlich schwer zu finden aber leicht zu flicken. ich konnte zwar mein sehr advancen ziele wie das karkassenmodell nicht einfügen aber ich bin glücklich.

__________________________________________________________________________________________________________________________________________________________________________________________________________________________________

## Reflexion LP - 1
Hiermit ist die erste Lernperiode der ILA beendet. Ich finde, ich habe viel aus dieser Zeit gezogen, viel gelernt, viel Stress, aber dem Ende zu bin ich sehr glücklich mit meinem Ergebnis, auch wenn ich advanced Ziele wie das Karkassenmodell nicht einbauen konnte. Am Anfang habe ich viele Systeme einfach aus der vergangenen Erfahrung, die ich durchs mehrere Versuchen des Projekts in vergangener Zeit schon gesammelt habe. Danach war es aber nicht mehr so einfach. Etwa in der Mitte der Lernperiode habe ich realisiert, dass eines meiner Ziele es war, das Modell auf verschiedene Autoarten und Perioden anzupassen, was schwierig wäre in einer einzigen großen Codedatei. Deshalb habe ich die Datei in mehrere Dateien gespalten. Das hat viel Zeit beansprucht. Ich sollte mir fürs nächste Mal merken, das System auf diese mehrteilige Aufteilung vorzubereiten, bevor ich den halben Code löschen muss, um ihn in einer zweiten Codedatei ganz neu zu schreiben. Auch ein großer Lernfaktor waren die anscheinend allgegenwärtigen Bugs, die mich verfolgten. Zum Glück habe ich die meisten von ihnen dem Ende zu exterminieren können. Einer der schlimmsten Bugs, den ich entdeckt hatte, war, dass sich das Auto nach wenig Fahren extrem komisch anfühlte und irgendwann nur noch drehte. Da ich den Reifenabbau auf eine extrem kleine Zahl gesetzt habe (0-0009), war es für mich klar, dass es nicht daran liegen konnte. Trotzdem habe ich fast 1.5 Tage gebraucht, um den Bug zu finden. Ich denke, das liegt daran, dass ich bisher immer jede einzelne Zeile nach dem Bug durchsucht habe, was extrem langsam lief, bis mir mein Lehrer ein neues Ausschließungssystem gezeigt hat, wodurch das Finden gar nicht mehr so lange dauerte.



