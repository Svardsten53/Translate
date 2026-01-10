#!/bin/bash
#
# This script replaces selected text in files with Dutch text.
# Dit script vervangt geselecteerde tekst in bestanden door Nederlandse tekst.
#
# If you want to make your own changes to the text, you can do so by copying one of the existing sed commands and changing the text in it. Note that the character '/' is a delimiter for the different parts of the command and that the same character must not exist in the text to be found or pasted. If this is the case, '/' can be replaced with, for example, '$'.
# translate.sh can be run any number of times as only the strings that have not already been changed will be changed.
#
# Created 2025-01-10 by Ronny Hullegie (EMSN2 Project)
# Based on German translation by L-A
#
# Positions correctly in the file structure
alias homepage="cd /home/userid-att-andra/BirdNET-Pi/"
cd /home/userid-att-andra/BirdNET-Pi/homepage
#
# index.php - Home page (NOTE!!! In the first line, the text "enter-your-city-or-place-here" must be changed before the script is run.
sed -i 's/ort-eller-plats/Voer-uw-locatie-hier-in/g' index.php
sed -i 's/You cannot listen to the live audio stream/Je kunt niet naar de live audiostream luisteren/g' index.php
sed -i 's/>Live Audio</>Live Audio</g' index.php
#
# views.php - Menu bar
sed -i "/<button type=\"submit\" name=\"view\" value=\"Recordings\" form=\"views\">Recordings<\/button>/a <button type=\"submit\" name=\"view\" value=\"Links\" form=\"views\">Links<\/button>" views.php
sed -i "/if(\$_GET\['view'\] == \"Daily Charts\"){include('history.php');}/a if(\$_GET['view'] == \"Links\"){include('scripts/links.php');}" views.php
sed -i "/if(\$_GET\['view'\] == \"Links\"){include('scripts\/links.php');}/a if(\$_GET['view'] == \"QA\"){include('scripts/qa.php');}" views.php
sed -i 's/>Overview</>Overzicht</g' views.php
sed -i "s/>Today's Detections</>Detecties Vandaag</g" views.php
sed -i 's/>Best Recordings</>Beste Opnames</g' views.php
sed -i 's/>Species Stats</>Soorten Statistieken</g' views.php
sed -i 's/>Daily Charts</>Daggrafieken</g' views.php
sed -i 's/>Recordings</>Opnames</g' views.php
sed -i 's/>Spectrogram</>Spectrogram</g' views.php
sed -i 's/>View Log</>Log Bekijken</g' views.php
sed -i 's/>Tools</>Hulpmiddelen</g' views.php
sed -i 's/>Weekly Report</>Weekrapport</g' views.php
sed -i 's/>Links</>Links</g' views.php
sed -i 's/You cannot edit the settings for this installation/Je kunt de instellingen voor deze installatie niet bewerken/g' views.php
sed -i 's/<div class="views">n/<div class="views"><br>/g' views.php
sed -i 's/WARNING: Your latitude and longitude are not set properly. Please do so now in Tools -> Settings./WAARSCHUWING: Je breedte- en lengtegraad zijn niet correct ingesteld. Doe dit nu via Hulpmiddelen -> Instellingen./g' views.php
sed -i 's/WARNING: Your latitude is not set properly. Please do so now in Tools -> Settings./WAARSCHUWING: Je breedtegraad is niet correct ingesteld. Doe dit nu via Hulpmiddelen -> Instellingen./g' views.php
sed -i 's/WARNING: Your longitude is not set properly. Please do so now in Tools -> Settings./WAARSCHUWING: Je lengtegraad is niet correct ingesteld. Doe dit nu via Hulpmiddelen -> Instellingen./g' views.php
#
# style.css - Style sheets (Widening the menu bar to accommodate all options on small screens)
sed -i 's/flex: 65%;/flex: 80%;/g' style.css
sed -i 's/width: 65%;/width: 80%;/g' style.css
sed -i '/\.banner {/ {N; s/height: 7%;/height: auto;/;}' style.css
sed -i '/text-align: center;/a padding: 7px;' style.css
#
# Positions correctly in the file structure
alias homepage="cd /home/userid-att-andra/BirdNET-Pi/"
cd /home/userid-att-andra/BirdNET-Pi/scripts
#
# overview.php - Overview
sed -i 's/>Total</>Totaal</g' overview.php
sed -i 's/>Today</>Vandaag</g' overview.php
sed -i 's/>Last Hour</>Laatste Uur</g' overview.php
sed -i 's/>Species Detected Today</>Soorten Gedetecteerd Vandaag</g' overview.php
sed -i 's/>Total Number of Species</>Totaal Aantal Soorten</g' overview.php
sed -i 's/<h3>Most Recent Detection:/<br><h3>Meest Recente Detectie:/g' overview.php
sed -i 's/<h3>Currently Analyzing/<br><br><h3>Momenteel Bezig Met Analyse/g' overview.php
sed -i 's/Confidence:/Zekerheid:/g' overview.php
sed -i 's/Database is busy/Database is bezig/g' overview.php
sed -i 's/5 Most Recent Detections/5 Meest Recente Detecties/g' overview.php
sed -i 's/Loading.../Laden.../g' overview.php
sed -i 's/Open in new tab/Openen in nieuw tabblad/g' overview.php
sed -i '0,/<style>/{s/<style>/<style> a:link { color: blue; } a:visited { color: blue; } a:active { color: blue; }/}' overview.php
sed -i 's/No Detections For Today./Geen Detecties Voor Vandaag./g' overview.php
sed -i 's/View species stats/Soorten statistieken bekijken/g' overview.php
sed -i 's/Detections Over 30d/Detecties Afgelopen 30 Dagen/g' overview.php
sed -i 's/>Close</>Sluiten</g' overview.php
sed -i 's/Are you sure you want to blacklist this image?/Weet je zeker dat je deze afbeelding wilt blokkeren?/g' overview.php
sed -i 's/Blacklist this image/Deze afbeelding blokkeren/g' overview.php
sed -i 's/Your system is currently processing a backlog of audio. This can take several hours before normal functionality of your BirdNET-Pi resumes./Je systeem verwerkt momenteel een achterstand aan audio. Dit kan enkele uren duren voordat je BirdNET-Pi weer normaal functioneert./g' overview.php
sed -i 's#<a href="https://wikipedia.org/wiki/<?php echo $sciname;?>"#<a href="https://nl.wikipedia.org/wiki/<?php echo $comname;?>"#g' overview.php
sed -i 's#<a href="https://wikipedia.org/wiki/<?php echo $sciname; ?>"#<a href="https://nl.wikipedia.org/wiki/<?php echo $comname;?>"#g' overview.php
sed -i 's/Species Today/Soorten Vandaag/g' overview.php
sed -i 's/Species Total/Soorten Totaal/g' overview.php
sed -i 's/New Species/Nieuwe Soorten/g' overview.php
sed -i 's/Rare Species/Zeldzame Soorten/g' overview.php
sed -i 's/detected today!/vandaag gedetecteerd!/g' overview.php
sed -i 's/Max confidence/Maximale zekerheid/g' overview.php
sed -i 's/First detection/Eerste detectie/g' overview.php
sed -i 's/Last seen/Laatst gezien/g' overview.php
sed -i 's/mo ago/ maanden geleden/g' overview.php
sed -i 's/d ago/ dagen geleden/g' overview.php
sed -i "s/'Detections Over ' + days + 'd'/'Detecties afgelopen ' + days + ' dagen'/g" overview.php
sed -i "s/Open Today's recordings page/Open pagina met opnames van vandaag/g" overview.php
#
# todays_detections.php - Today's finds
sed -i 's/>Number of Detections</>Aantal Detecties</g' todays_detections.php
sed -i 's/>Total</>Totaal</g' todays_detections.php
sed -i 's/>Today</>Vandaag</g' todays_detections.php
sed -i 's/>Last Hour</>Laatste Uur</g' todays_detections.php
sed -i 's/>Unique Species Total</>Unieke Soorten Totaal</g' todays_detections.php
sed -i 's/>Unique Species Today</>Unieke Soorten Vandaag</g' todays_detections.php
sed -i 's/>Load 40 More...</>40 Meer Laden...</g' todays_detections.php
sed -i 's#allaboutbirds.org#nl.wikipedia.org#g' todays_detections.php
sed -i 's/guide/wiki/g' todays_detections.php
sed -i 's/Confidence:/Zekerheid:/g' todays_detections.php
sed -i "s/Today's Detections/Detecties Vandaag/g" todays_detections.php
sed -i "s/Legacy view/Legacy weergave/g" todays_detections.php
sed -i "s/Normal view/Normale weergave/g" todays_detections.php
sed -i "s/Search.../Zoeken.../g" todays_detections.php
sed -i "s/Loading.../Laden.../g" todays_detections.php
sed -i 's/Open in new tab/Openen in nieuw tabblad/g' todays_detections.php
sed -i 's/No Detections For Today./Geen Detecties Voor Vandaag./g' todays_detections.php
sed -i '0,/<style>/{s/<style>/<style> a:link { color: blue; } a:visited { color: blue; } a:active { color: blue; }/}' todays_detections.php
sed -i 's/View species stats/Soorten statistieken bekijken/g' todays_detections.php
sed -i 's/Detections Over 30d/Detecties Afgelopen 30 Dagen/g' todays_detections.php
sed -i 's/>Close</>Sluiten</g' todays_detections.php
sed -i 's/Are you sure you want to blacklist this image?/Weet je zeker dat je deze afbeelding wilt blokkeren?/g' todays_detections.php
sed -i 's/Blacklist this image/Deze afbeelding blokkeren/g' todays_detections.php
sed -i 's/Delete Detection/Detectie Verwijderen/g' todays_detections.php
sed -i 's#<a href="https://wikipedia.org/wiki/<?php echo $sciname;?>"#<a href="https://nl.wikipedia.org/wiki/<?php echo $comname;?>"#g' todays_detections.php
sed -i 's/Species Total/Soorten Totaal/g' todays_detections.php
sed -i 's/Species Today/Soorten Vandaag/g' todays_detections.php
#
# stats.php - Best recordings
sed -i 's/Choose a species to load images from Wikimedia Commons/Kies een soort om afbeeldingen van Wikimedia Commons te laden/g' stats.php
sed -i 's/Occurrences:/Waarnemingen:/g' stats.php
sed -i 's/Max Confidence:/Maximale Zekerheid:/g' stats.php
sed -i 's/Best Recording:/Beste Opname:/g' stats.php
sed -i 's#allaboutbirds.org#nl.wikipedia.org#g' stats.php
sed -i 's/guide/wiki/g' stats.php
sed -i 's/All About Birds/Wikipedia/g' stats.php
sed -i 's/Loading Images from/Afbeeldingen laden van/g' stats.php
sed -i 's/Choose a species to load images from Flickr./Kies een soort om afbeeldingen van Flickr te laden./g' stats.php
sed -i 's/Best Recordings for Other Species:/Beste Opnames voor Andere Soorten:/g' stats.php
sed -i 's/Sort by alphabetical/Alfabetisch sorteren/g' stats.php
sed -i 's/Sort by occurrences/Sorteren op waarnemingen/g' stats.php
sed -i 's/Open in new tab/Openen in nieuw tabblad/g' stats.php
sed -i '0,/<style>/{s/<style>/<style> a:link { color: blue; } a:visited { color: blue; } a:active { color: blue; }/}' stats.php
sed -i 's#//wikipedia\.org/wiki/\$sciname#//nl\.wikipedia\.org/wiki/\$comname#g' stats.php
sed -i 's/Sort by confidence/Sorteren op zekerheid/g' stats.php
#
# history.php - Daily graphs
sed -i 's/>Submit Date</>Datum Verzenden</g' history.php
sed -i 's/Total Detections For The Day/Totaal Detecties Voor De Dag/g' history.php
sed -i 's%echo "<img src=\"/Charts/$chart2?nocache=time()\">";%echo " ";%g' history.php
sed -i 's/No Charts for/Geen Grafieken voor/g' history.php
#
# play.php - Recordings
sed -i 's/Sort by date/Sorteren op datum/g' play.php
sed -i 's/Sort by confidence/Sorteren op zekerheid/g' play.php
sed -i 's/>By Species</>Op Soort</g' play.php
sed -i 's/>By Date</>Op Datum</g' play.php
sed -i 's/This file is not delete protected./Dit bestand is niet beschermd tegen verwijderen./g' play.php
sed -i 's/Unable to open file!/Kan bestand niet openen!/g' play.php
sed -i 's/You must be authenticated to change the protection of files./Je moet ingelogd zijn om de beveiliging van bestanden te wijzigen./g' play.php
sed -i 's/This file is delete protected./Dit bestand is beschermd tegen verwijderen./g' play.php
sed -i 's/Sort by alphabetical/Alfabetisch sorteren/g' play.php
sed -i 's/Sort by occurrences/Sorteren op waarnemingen/g' play.php
sed -i 's/No recordings were found./Er zijn geen opnames gevonden./g' play.php
sed -i 's/They may have been deleted to make space for new recordings. You can modify this setting for the future in Tools/Ze kunnen verwijderd zijn om ruimte te maken voor nieuwe opnames. Je kunt deze instelling wijzigen via Hulpmiddelen/g' play.php
sed -i 's/Only Show Purge Excluded/Alleen Uitgesloten van Opschonen Tonen/g' play.php
sed -i 's/This file is not excluded from being purged./Dit bestand is niet uitgesloten van opschonen./g' play.php
sed -i 's/This file is excluded from being purged./Dit bestand is uitgesloten van opschonen./g' play.php
sed -i 's/They may have been deleted to make space for new recordings. You can prevent this from happening in the future by clicking the/Ze kunnen verwijderd zijn om ruimte te maken voor nieuwe opnames. Je kunt dit in de toekomst voorkomen door op het/g' play.php
sed -i 's/ icon in the top right of a recording./ icoon rechtsboven bij een opname te klikken./g' play.php
sed -i 's/You can also modify this behavior globally under /Je kunt dit gedrag ook globaal wijzigen onder /g' play.php
sed -i 's/>here.</>hier.</g' play.php
sed -i 's/Database is busy/Database is bezig/g' play.php
sed -i 's/Delete Detection/Detectie Verwijderen/g' play.php
sed -i 's/"Today"/"Vandaag"/g' play.php
sed -i 's/This file has been shifted down in frequency./Dit bestand is verschoven in frequentie./g' play.php
sed -i 's/This file is not shifted in frequency./Dit bestand is niet verschoven in frequentie./g' play.php
sed -i 's#wikipedia\.org/wiki/\$sciname#nl\.wikipedia\.org/wiki/\$sciname#g' play.php
sed -i 's#Change Detection#Detectie Wijzigen#g' play.php
sed -i 's#This file will be deleted when disk space needs to be freed.#Dit bestand wordt verwijderd wanneer schijfruimte nodig is.#g' play.php
sed -i 's#\(>95% usage\)\.# (>95% gebruik).#g' play.php
#
# spectrogram.php - Spectrogram
sed -i 's/Gain:/Versterking:/g' spectrogram.php
sed -i 's/Loading.../Laden.../g' spectrogram.php
sed -i 's/Compression:/Compressie:/g' spectrogram.php
sed -i 's/Freq shift:/Freq verschuiving:/g' spectrogram.php
#
# daily_plot.py - Graph
sed -i 's#\(xlabel="Detections"\)#xlabel="Detecties"#g' daily_plot.py
sed -i 's#\(xlabel="Hour of Day"\)#xlabel="Uur van de Dag"#g' daily_plot.py
sed -i "s#plot_type = 'All'#plot_type = 'Alle'#g" daily_plot.py
sed -i 's#{readings} Last Updated:#{readings} Laatst Bijgewerkt:#g' daily_plot.py
#
# plotly_streamlit.py - Species statistics
sed -i 's/Single Day View/Enkele Dag Weergave/g' plotly_streamlit.py
sed -i 's/Resample Resolution/Herbemonstering Resolutie/g' plotly_streamlit.py
sed -i 's/Select resolution for species - DAILY provides time series/Selecteer resolutie voor soorten - DAGELIJKS geeft tijdreeksen/g' plotly_streamlit.py
sed -i 's/Select start and end date, if same date get a clockplot for a single day/Selecteer start- en einddatum, bij dezelfde datum krijg je een klokgrafiek voor een enkele dag/g' plotly_streamlit.py
sed -i 's/Select if you want single day view, unselect for multi-day views/Selecteer voor enkele dag weergave, deselecteer voor meerdaagse weergave/g' plotly_streamlit.py
sed -i 's/Raw/Ruw/g' plotly_streamlit.py
sed -i 's/15 minutes/15 minuten/g' plotly_streamlit.py
sed -i 's/Hourly/Per Uur/g' plotly_streamlit.py
sed -i 's/DAILY/DAGELIJKS/g' plotly_streamlit.py
sed -i 's/Which bird would you like to explore for the dates/Welke vogel wil je verkennen voor de datums/g' plotly_streamlit.py
sed -i 's/Species in Date Range/Soorten in Datumbereik/g' plotly_streamlit.py
sed -i "s/' to '/' - '/g" plotly_streamlit.py
sed -i 's/Total Detect:/Totaal Detecties:/g' plotly_streamlit.py
sed -i 's/Download plot as a png/Grafiek downloaden als png/g' plotly_streamlit.py
sed -i 's/Zoom/Zoom/g' plotly_streamlit.py
sed -i 's/Pan/Verschuiven/g' plotly_streamlit.py
sed -i 's/Box Select/Vak Selecteren/g' plotly_streamlit.py
sed -i 's/Lasso Select/Lasso Selecteren/g' plotly_streamlit.py
sed -i 's/Zoom in/Inzoomen/g' plotly_streamlit.py
sed -i 's/Zoom out/Uitzoomen/g' plotly_streamlit.py
sed -i 's/Auto scale/Automatisch schalen/g' plotly_streamlit.py
sed -i 's/Reset views/Weergave resetten/g' plotly_streamlit.py
sed -i 's/Produces with Plotly/Gemaakt met Plotly/g' plotly_streamlit.py
sed -i 's/Confidence Max:/Maximale Zekerheid:/g' plotly_streamlit.py
sed -i 's/Reviewed/Beoordeeld/g' plotly_streamlit.py
sed -i 's/Available recordings/Beschikbare opnames/g' plotly_streamlit.py
sed -i 's/View fullscreen/Volledig scherm bekijken/g' plotly_streamlit.py
sed -i 's/Made with Streamlit/Gemaakt met Streamlit/g' plotly_streamlit.py
sed -i 's/RUNNING.../BEZIG.../g' plotly_streamlit.py
sed -i 's/Please wait.../Even geduld.../g' plotly_streamlit.py
sed -i 's/Date to View/Datum om te Bekijken/g' plotly_streamlit.py
sed -i 's/Select Number of Birds to Show/Selecteer Aantal Vogels om te Tonen/g' plotly_streamlit.py
sed -i 's/sampling interval./bemonsteringsinterval./g' plotly_streamlit.py
sed -i 's/<br>for/<br>voor/g' plotly_streamlit.py
sed -i 's/Species in/Soorten in/g' plotly_streamlit.py
sed -i 's/Max:/Max:/g' plotly_streamlit.py
sed -i 's/Median:/Mediaan:/g' plotly_streamlit.py
sed -i 's/RECORDING NOT AVAILABLE :(/OPNAME NIET BESCHIKBAAR :(/g' plotly_streamlit.py
sed -i 's/Date Range/Datumbereik/g' plotly_streamlit.py
sed -i 's/Select Color Pallet for Daily Detections/Selecteer Kleurenpalet voor Dagelijkse Detecties/g' plotly_streamlit.py
sed -i 's/Alla/Alle/g' plotly_streamlit.py
sed -i "s/'<b>Top'/<b>Top'/g" plotly_streamlit.py
sed -i "s/' Species For '/' Soorten voor '/g" plotly_streamlit.py
sed -i "s/ '<b>Daily ' + str(start_date) + ' Detections on ' + resample_sel + ' interval</ '<b>Dagelijkse ' + str(start_date) + ' Detecties op ' + resample_sel + ' interval</g" plotly_streamlit.py
sed -i "s/subplot_titles=('<b>Top ' +/subplot_titles=('<b>Top ' +/g" plotly_streamlit.py
sed -i "s/+ str(top_N) + /+ str(top_N) + ','+ /g" plotly_streamlit.py
#
# config.php - Settings
sed -i 's/mailto:tim@birdweather.com/mailto:birdnetpi@birdweather.com/g' config.php
#
# links.php - Links
sed -i 's/Program-related links/Programma-gerelateerde links/g' links.php
sed -i 's/Program source/Programma broncode/g' links.php
sed -i 's/Wiki help page/Wiki hulppagina/g' links.php
sed -i 's/Questions and answers about BirdNET-Pi (English)/Vragen en antwoorden over BirdNET-Pi (Engels)/g' links.php
sed -i 's/Own links/Eigen links/g' links.php
sed -i 's/Other BirdNET-Pi/Andere BirdNET-Pi/g' links.php
sed -i 's/Please email if you have any questions or would like to do your own installation/Stuur een e-mail als je vragen hebt of een eigen installatie wilt doen/g' links.php
#
# weekly_report.php - Weekly report
sed -i 's/Report week/Rapportweek/g' weekly_report.php
sed -i 's/Top 10 Species/Top 10 Soorten/g' weekly_report.php
sed -i 's/Species Detected for the First Time/Voor het Eerst Gedetecteerde Soorten/g' weekly_report.php
sed -i 's/No new species were seen this week/Er zijn deze week geen nieuwe soorten gezien/g' weekly_report.php
sed -i 's/percentages are calculated relative to week/percentages zijn berekend ten opzichte van week/g' weekly_report.php

echo "Nederlandse vertaling voltooid! / Dutch translation completed!"
