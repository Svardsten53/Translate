#!/bin/bash
#
# This script replaces selected text in files with German text.
#
# If you want to make your own changes to the text, you can do so by copying one of the existing sed commands and changing the text in it. Note that the character '/' is a delimiter for the different parts of the command and that the same character must not exist in the text to be found or pasted. If this is the case, '/' can be replaced with, for example, '$'.
# translate.sh can be run any number of times as only the strings that have not already been changed will be changed.
#
# Updated 2026-02-28 /L-Å
#
# Positions correctly in the file structure
alias homepage="cd /home/userid-att-ändra/BirdNET-Pi/"
cd /home/userid-att-ändra/BirdNET-Pi/homepage
#
# index.php - Home page (NOTE!!! In the first line, the text "enter-your-city-or-place-here" must be changed before the script is run.
sed -i 's/ort-eller-plats/Geben-Sie-Ihre-Stadt-oder-Ihren-Ort-hier-ein/g' index.php
sed -i 's/You cannot listen to the live audio stream/Sie können den Live-Audiostream nicht anhören/g' index.php
sed -i 's/>Live Audio</>Live-Audio</g' index.php
#
# views.php - Menu bar
sed -i "/<button type=\"submit\" name=\"view\" value=\"Recordings\" form=\"views\">Recordings<\/button>/a <button type=\"submit\" name=\"view\" value=\"Links\" form=\"views\">Links<\/button>" views.php
sed -i "/if(\$_GET\['view'\] == \"Daily Charts\"){include('history.php');}/a if(\$_GET['view'] == \"Links\"){include('scripts/links.php');}" views.php
sed -i "/if(\$_GET\['view'\] == \"Links\"){include('scripts\/links.php');}/a if(\$_GET['view'] == \"QA\"){include('scripts/qa.php');}" views.php
sed -i 's/>Overview</>Übersicht</g' views.php
sed -i "s/>Today's Detections</>Heutige Beobachtungen</g" views.php
sed -i 's/>Best Recordings</>Beste Aufnahmen</g' views.php
sed -i 's/>Species Stats</>Art-Statistiken</g' views.php
sed -i 's/>Daily Charts</>Tagesübersicht</g' views.php
sed -i 's/>Recordings</>Aufnahmen</g' views.php
sed -i 's/>Spectrogram</>Spektrogramm</g' views.php
sed -i 's/>View Log</>Logs ansehen</g' views.php
sed -i 's/>Tools</>Werkzeuge</g' views.php
sed -i 's/>Weekly Report</>Wochenbericht</g' views.php
sed -i 's/>Links</>Links</g' views.php
sed -i 's/You cannot edit the settings for this installation/Sie können die Einstellungen für diese Installation nicht bearbeiten/g' views.php
sed -i 's/<div class="views">n/<div class="views"><br>/g' views.php
sed -i 's/WARNING: Your latitude and longitude are not set properly. Please do so now in Tools -> Settings./WARNUNG: Ihre Breiten- und Längengrade sind nicht korrekt erfasst. Bitte korrigieren Sie dies jetzt unter Werkzeuge -> Einstellungen./g' views.php
sed -i 's/WARNING: Your latitude is not set properly. Please do so now in Tools -> Settings./WARNUNG: Ihr Breitengrad ist nicht korrekt erfasst. Bitte korrigieren Sie dies jetzt unter Werkzeuge -> Einstellungen./g' views.php
sed -i 's/WARNING: Your longitude is not set properly. Please do so now in Tools -> Settings./WARNUNG: Ihr Längengrad ist nicht korrekt erfasst. Bitte korrigieren Sie dies jetzt unter Werkzeuge -> Einstellungen./g' views.php
#
# style.css - Style sheets (Widening the menu bar to accommodate all options on small screens)
sed -i 's/flex: 65%;/flex: 80%;/g' style.css
sed -i 's/width: 65%;/width: 80%;/g' style.css
sed -i '/\.banner {/ {N; s/height: 7%;/height: auto;/;}' style.css
sed -i '/text-align: center;/a padding: 7px;' style.css
#
# Positions correctly in the file structure
alias homepage="cd /home/userid-att-ändra/BirdNET-Pi/"
cd /home/userid-att-ändra/BirdNET-Pi/scripts
#
# overview.php - Overview
sed -i 's/>Total</>Total</g' overview.php
sed -i 's/>Today</>Heute</g' overview.php
sed -i 's/>Last Hour</>Letzte Stunde</g' overview.php
sed -i 's/>Species Detected Today</>Heute beobachtete Arten</g' overview.php
sed -i 's/>Total Number of Species</>Artentotal</g' overview.php
sed -i 's/<h3>Most Recent Detection:/<br><h3>Neueste Beobachtung:/g' overview.php
sed -i 's/<h3>Currently Analyzing/<br><br><h3>Analysiert gerade/g' overview.php
sed -i 's/Confidence:/Konfidenz:/g' overview.php
sed -i 's/Database is busy/Datenbank ist beschäftigt/g' overview.php
sed -i 's/5 Most Recent Detections/Die 5 neuesten Beobachtungen/g' overview.php
sed -i 's/Loading.../Wird geladen.../g' overview.php
sed -i 's/Open in new tab/In neuem Tab öffnen/g' overview.php
sed -i '0,/<style>/{s/<style>/<style> a:link { color: blue; } a:visited { color: blue; } a:active { color: blue; }/}' overview.php
sed -i 's/No Detections For Today./Heute keine Beobachtungen./g' overview.php
sed -i 's/View species stats/Art-Statistiken ansehen/g' overview.php
sed -i 's/Detections Over 30d/Beobachtungen der letzten 30 Tage/g' overview.php
sed -i 's/>Close</>Schließen
</g' overview.php
sed -i 's/Are you sure you want to blacklist this image?/Möchten Sie dieses Bild wirklich auf die schwarze Liste setzen?/g' overview.php
sed -i 's/Blacklist this image/Dieses Bild auf die schwarze Liste setzen/g' overview.php
sed -i 's/Your system is currently processing a backlog of audio. This can take several hours before normal functionality of your BirdNET-Pi resumes./Ihr System verarbeitet gerade einen Rückstand an Audiodaten. Dies kann mehrere Stunden dauern, bis die normale Funktionalität Ihres BirdNET-Pi wiederhergestellt ist./g' overview.php
sed -i 's#<a href="https://wikipedia.org/wiki/<?php echo $sciname;?>"#<a href="https://de.wikipedia.org/wiki/<?php echo $comname;?>"#g' overview.php
sed -i 's#<a href="https://wikipedia.org/wiki/<?php echo $sciname; ?>"#<a href="https://de.wikipedia.org/wiki/<?php echo $comname;?>"#g' overview.php
sed -i 's/Species Today/Arten heute/g' overview.php
sed -i 's/Species Total/Arten total/g' overview.php
sed -i 's/New Species/Neue Arten/g' overview.php
sed -i 's/Rare Species/Seltene Arten/g' overview.php
sed -i 's/detected today!/Heute beobachtet!/g' overview.php
sed -i 's/Max confidence/Maximale Konfidenz/g' overview.php
sed -i 's/First detection/Erste Beobachtung/g' overview.php
sed -i 's/Last seen/Zuletzt beobachtet/g' overview.php
sed -i 's/mo ago/ Monate her/g' overview.php
sed -i 's/d ago/ Tage her/g' overview.php
sed -i "s/'Detections Over ' + days + 'd'/'Beobachtungen der letzten ' + days + ' Tage'/g" overview.php
sed -i "s/Open Today's recordings page/Seite mit den heutigen Aufnahmen öffnen/g" overview.php
#
# todays_detections.php - Today's finds
sed -i 's/>Number of Detections</>Anzahl der Beobachtungen</g' todays_detections.php
sed -i 's/>Total</>Total</g' todays_detections.php
sed -i 's/>Today</>Heute</g' todays_detections.php
sed -i 's/>Last Hour</>Letzte Stunde</g' todays_detections.php
sed -i 's/>Unique Species Total</>Arten total</g' todays_detections.php
sed -i 's/>Unique Species Today</>Arten heute</g' todays_detections.php
sed -i 's/>Load 40 More...</>Lade 40 weitere...</g' todays_detections.php
sed -i 's#allaboutbirds.org#de.wikipedia.org#g' todays_detections.php
sed -i 's/guide/wiki/g' todays_detections.php
sed -i 's/Confidence:/Konfidenz:/g' todays_detections.php
sed -i "s/Today's Detections/Heutige Beobachtungen/g" todays_detections.php
sed -i "s/Legacy view/Legacy-Ansicht/g" todays_detections.php
sed -i "s/Normal view/Normale Ansicht/g" todays_detections.php
sed -i "s/Search.../Suchen.../g" todays_detections.php
sed -i "s/Loading.../Wird geladen.../g" todays_detections.php
sed -i 's/Open in new tab/In neuem Tab öffnen/g' todays_detections.php
sed -i 's/No Detections For Today./Keine Beobachtungen für heute./g' todays_detections.php
sed -i '0,/<style>/{s/<style>/<style> a:link { color: blue; } a:visited { color: blue; } a:active { color: blue; }/}' todays_detections.php
sed -i 's/View species stats/Art-Statistiken ansehen/g' todays_detections.php
sed -i 's/Detections Over 30d/Beobachtungen der letzten 30 Tage/g' todays_detections.php
sed -i 's/>Close</>Schließen</g' todays_detections.php
sed -i 's/Are you sure you want to blacklist this image?/Möchten Sie dieses Bild wirklich auf die schwarze Liste setzen?/g' todays_detections.php
sed -i 's/Blacklist this image/Dieses Bild auf die schwarze Liste setzen/g' todays_detections.php
sed -i 's/Delete Detection/Beobachtung löschen/g' todays_detections.php
sed -i 's#<a href="https://wikipedia.org/wiki/<?php echo $sciname;?>"#<a href="https://de.wikipedia.org/wiki/<?php echo $comname;?>"#g' todays_detections.php
sed -i 's/Species Total/Arten total/g' todays_detections.php
sed -i 's/Species Today/Arten heute/g' todays_detections.php
#
# stats.php - Best recordings
sed -i 's/Choose a species to load images from Wikimedia Commons/Wählen Sie eine Art, um Bilder von Wikimedia Commons zu laden/g' stats.php
sed -i 's/Occurrences:/Vorkommen:/g' stats.php
sed -i 's/Max Confidence:/Maximale Konfidenz:/g' stats.php
sed -i 's/Best Recording:/Beste Aufnahme:/g' stats.php
sed -i 's#allaboutbirds.org#de.wikipedia.org#g' stats.php
sed -i 's/guide/wiki/g' stats.php
sed -i 's/All About Birds/Wikipedia/g' stats.php
sed -i 's/Loading Images from/Bilder werden geladen von/g' stats.php
sed -i 's/Choose a species to load images from Flickr./Wählen Sie eine Art, um davon Bilder von Flickr zu laden./g' stats.php
sed -i 's/Best Recordings for Other Species:/Beste Aufnahmen für andere Arten:/g' stats.php
sed -i 's/Sort by alphabetical/Alphabetisch sortieren/g' stats.php
sed -i 's/Sort by occurrences/Nach Häufigkeit sortieren/g' stats.php
sed -i 's/Open in new tab/In neuem Tab öffnen/g' stats.php
sed -i '0,/<style>/{s/<style>/<style> a:link { color: blue; } a:visited { color: blue; } a:active { color: blue; }/}' stats.php
sed -i 's#//wikipedia\.org/wiki/\$sciname#//de\.wikipedia\.org/wiki/\$comname#g' stats.php
sed -i 's/Sort by confidence/Nach Konfidenz sortieren/g' stats.php
#
# history.php - Daily graphs
sed -i 's/>Submit Date</>Datum festlegen</g' history.php
sed -i 's/Total Detections For The Day/Tagestotal der Beobachtungen/g' history.php
sed -i 's%echo "<img src=\"/Charts/$chart2?nocache=time()\">";%echo " ";%g' history.php
sed -i 's/No Charts for/Keine Diagramme für/g' history.php
#
# play.php - Recordings
sed -i 's/Sort by date/Nach Datum sortieren/g' play.php
sed -i 's/Sort by confidence/Nach Konfidenz sortieren/g' play.php
sed -i 's/>By Species</>Nach Art</g' play.php
sed -i 's/>By Date</>Nach Datum</g' play.php
sed -i 's/This file is not delete protected./Diese Datei ist nicht vor Löschen geschützt./g' play.php
sed -i 's/This file is not delete protected./Diese Datei ist nicht vor Löschen geschützt./g' play.php
sed -i 's/Unable to open file!/Datei kann nicht geöffnet werden!/g' play.php
sed -i 's/You must be authenticated to change the protection of files./Sie müssen authentifiziert sein, um den Dateischutz zu ändern./g' play.php
sed -i 's/This file is delete protected./Diese Datei ist vor Löschen geschützt./g' play.php
sed -i 's/Sort by alphabetical/Alphabetisch sortieren/g' play.php
sed -i 's/Sort by occurrences/Nach Häufigkeit sortieren/g' play.php
sed -i 's/No recordings were found./Es wurden keine Aufnahmen gefunden./g' play.php
sed -i 's/They may have been deleted to make space for new recordings. You can modify this setting for the future in Tools/Sie könnten gelöscht worden sein, um Platz für neue Aufnahmen zu schaffen. Sie können diese Einstellung für künftige Aufnahmen unter Werkzeuge ändern/g' play.php
sed -i 's/Only Show Purge Excluded/Nur von der Bereinigung Ausgeschlossene anzeigen/g' play.php
sed -i 's/This file is not excluded from being purged./Diese Datei ist nicht von der Bereinigung ausgeschlossen./g' play.php
sed -i 's/This file is excluded from being purged./Diese Datei ist von der Bereinigung ausgeschlossen./g' play.php
sed -i 's/They may have been deleted to make space for new recordings. You can prevent this from happening in the future by clicking the/Sie könnten gelöscht worden sein, um Platz für neue Aufnahmen zu schaffen. Sie können diese Einstellung für künftige Aufnahmen ändern, indem Sie auf das Symbol/g' play.php
sed -i 's/ icon in the top right of a recording./ in der oberen rechten Ecke einer Aufnahme klicken./g' play.php
sed -i 's/You can also modify this behavior globally under /Sie können dieses Verhalten auch global unter/g' play.php
sed -i 's/>here.</>hier.</g' play.php
sed -i 's/Database is busy/Datenbank ist beschäftigt/g' play.php
sed -i 's/Delete Detection/Beobachtung löschen/g' play.php
sed -i 's/"Today"/"Heute"/g' play.php
sed -i 's/This file has been shifted down in frequency./Diese Datei wurde in der Frequenz nach unten verschoben./g' play.php
sed -i 's/This file is not shifted in frequency./Diese Datei ist in der Frequenz nicht verschoben./g' play.php
sed -i 's/Sort by confidence/Nach Konfidenz sortieren/g' play.php
sed -i 's#wikipedia\.org/wiki/\$sciname#de\.wikipedia\.org/wiki/\$sciname#g' play.php
sed -i 's#Change Detection#Beobachtung ändern#g' play.php
sed -i 's#This file will be deleted when disk space needs to be freed.#Diese Datei wird gelöscht, wenn Speicherplatz freigegeben werden muss.#g' play.php
sed -i 's#\(>95% usage\)\.# (>95% Auslastung).#g' play.php
#
# spectrogram.php - Spectrogram
sed -i 's/Gain:/Verstärkung:/g' spectrogram.php
sed -i 's/Loading.../Wird geladen.../g' spectrogram.php
sed -i 's/Compression:/Kompression:/g' spectrogram.php
sed -i 's/Freq shift:/Frequenzverschiebung:/g' spectrogram.php
#
# daily_plot.py - Graph
sed -i 's#\(xlabel="Detections"\)#xlabel="Beobachtungen"#g' daily_plot.py
sed -i 's#\(xlabel="Hour of Day"\)#xlabel="Uhrzeit"#g' daily_plot.py
sed -i "s#plot_type = 'All'#plot_type = 'Alle'#g" daily_plot.py
sed -i 's#{readings} Last Updated:#{readings} Zuletzt aktualisiert:#g' daily_plot.py
#
# plotly_streamlit.py - Species statistics
sed -i 's/Single Day View/Einzeltagesansicht/g' plotly_streamlit.py
sed -i 's/Resample Resolution/Zeitliche Auflösung/g' plotly_streamlit.py
sed -i 's/Select resolution for species - DAILY provides time series/Wählen Sie die Auflösung für Arten - TÄGLICH bietet Zeitreihen/g' plotly_streamlit.py
sed -i 's/Select start and end date, if same date get a clockplot for a single day/Wählen Sie Start- und Enddatum. Wenn die Daten übereinstimmen, erhalten Sie ein Uhrdiagramm für einen einzigen Tag/g' plotly_streamlit.py
sed -i 's/Select if you want single day view, unselect for multi-day views/Aktivieren für Einzeltagesansicht, Deaktivieren für Mehrtagesansichten /g' plotly_streamlit.py
sed -i 's/Raw/Original/g' plotly_streamlit.py
sed -i 's/15 minutes/15 Minuten/g' plotly_streamlit.py
sed -i 's/Hourly/Eine Stunde/g' plotly_streamlit.py
sed -i 's/DAILY/Ein Tag/g' plotly_streamlit.py
sed -i 's/Which bird would you like to explore for the dates/Welchen Vogel möchten Sie für die Daten erkunden/g' plotly_streamlit.py
sed -i 's/Species in Date Range/Arten im Datumsbereich/g' plotly_streamlit.py
sed -i "s/' to '/' - '/g" plotly_streamlit.py
sed -i 's/Total Detect:/Beobachtungen total:/g' plotly_streamlit.py
sed -i 's/Download plot as a png/Diagramm als PNG herunterladen/g' plotly_streamlit.py
sed -i 's/Zoom/Zoom/g' plotly_streamlit.py
sed -i 's/Pan/Schwenken/g' plotly_streamlit.py
sed -i 's/Box Select/Box-Auswahl/g' plotly_streamlit.py
sed -i 's/Lasso Select/Lasso-Auswahl/g' plotly_streamlit.py
sed -i 's/Zoom in/Vergrößern/g' plotly_streamlit.py
sed -i 's/Zoom out/Verkleinern/g' plotly_streamlit.py
sed -i 's/Auto scale/Automatische Skalierung/g' plotly_streamlit.py
sed -i 's/Reset views/Ansichten zurücksetzen/g' plotly_streamlit.py
sed -i 's/Produces with Plotly/Erzeugt mit Plotly/g' plotly_streamlit.py
sed -i 's/Confidence Max:/Maximale Konfidenz:/g' plotly_streamlit.py
sed -i 's/Reviewed/Überprüft/g' plotly_streamlit.py
sed -i 's/Available recordings/Verfügbare Aufnahmen/g' plotly_streamlit.py
sed -i 's/View fullscreen/Vollbildansicht/g' plotly_streamlit.py
sed -i 's/Made with Streamlit/Erstellt mit Streamlit/g' plotly_streamlit.py
sed -i 's/RUNNING.../WIRD AUSGEFÜHRT.../g' plotly_streamlit.py
sed -i 's/Please wait.../Bitte warten.../g' plotly_streamlit.py
sed -i 's/Date to View/Datum zur Ansicht/g' plotly_streamlit.py
sed -i 's/Select Number of Birds to Show/Wählen Sie die Anzahl der anzuzeigenden Vögel/g' plotly_streamlit.py
sed -i 's/sampling interval./zeitliche Auflösung./g' plotly_streamlit.py
sed -i 's/<br>for/<br>für/g' plotly_streamlit.py
sed -i 's/Species in/Arten in/g' plotly_streamlit.py
sed -i 's/Max:/Max:/g' plotly_streamlit.py
sed -i 's/Median:/Median:/g' plotly_streamlit.py
sed -i 's/RECORDING NOT AVAILABLE :(/AUFNAHME NICHT VERFÜGBAR :(/g' plotly_streamlit.py
sed -i 's/Date Range/Datumsbereich/g' plotly_streamlit.py
sed -i 's/Select Color Pallet for Daily Detections/Wählen Sie die Farbpalette für Beobachtungen pro Tag/g' plotly_streamlit.py
sed -i 's/Alla/Alle/g' plotly_streamlit.py
sed -i "s/'<b>Top'/<b>Top'/g" plotly_streamlit.py
sed -i "s/' Species For '/' Arten für '/g" plotly_streamlit.py
sed -i "s/ '<b>Daily ' + str(start_date) + ' Detections on ' + resample_sel + ' interval</ '<b>Tägliche ' + str(start_date) + ' Beobachtungen im Intervall ' + resample_sel + '</g" plotly_streamlit.py
sed -i "s/subplot_titles=('<b>Top ' +/subplot_titles=('<b>Top ' +/g" plotly_streamlit.py
sed -i "s/+ str(top_N) + /+ str(top_N) + ','+ /g" plotly_streamlit.py
#
# config.php - Settings
sed -i 's/mailto:tim@birdweather.com/mailto:birdnetpi@birdweather.com/g' config.php
#
# links.php - Links
sed -i 's/Program-related links/Programmbezogene Links/g' links.php
sed -i 's/Program source/Programm-Quellcode/g' links.php
sed -i 's/Wiki help page/Wiki-Hilfeseite/g' links.php
sed -i 's/Questions and answers about BirdNET-Pi (English)/Fragen und Antworten zu BirdNET-Pi (Englisch)/g' links.php
sed -i 's/Own links/Eigene Links/g' links.php
sed -i 's/Other BirdNET-Pi/Andere BirdNET-Pi/g' links.php
sed -i 's/Please email if you have any questions or would like to do your own installation/Bitte senden Sie eine E-Mail, wenn Sie Fragen haben oder eine eigene Installation durchführen möchten/g' links.php
#
# weekly_report.php - Weekly report
sed -i 's/Report week/Berichtswoche/g' weekly_report.php
sed -i 's/Top 10 Species/Top 10 Arten/g' weekly_report.php
sed -i 's/Species Detected for the First Time/Erstmals beobachtete Arten/g' weekly_report.php
sed -i 's/No new species were seen this week/In dieser Woche wurden keine neuen Arten beobachtet/g' weekly_report.php
sed -i 's/percentages are calculated relative to week/Prozentsätze werden relativ zur Woche berechnet/g' weekly_report.php