#!/bin/bash
#
# This script replaces selected text in files with Norwegian text.
#
# If you want to make your own changes to the text, you can do so by copying one of the existing sed commands and changing the text in it. Note that the character '/' is a delimiter for the different parts of the command and that the same character must not exist in the text to be found or pasted. If this is the case, '/' can be replaced with, for example, '$'.
# translate.sh can be run any number of times as only the strings that have not already been changed will be changed.
#
# Updated 2025-08-17 /L-Å
#
# Positions correctly in the file structure
alias homepage="cd /home/userid-att-ändra/BirdNET-Pi/"
cd /home/userid-att-ändra/BirdNET-Pi/homepage
#
# index.php - Home page (NOTE!!! In the first line, the text "enter-your-city-or-place-here" must be changed before the script is run.
sed -i 's/ort-eller-plats/Skriv-inn-din-by-eller-sted-her/g' index.php
sed -i 's/You cannot listen to the live audio stream/Du kan ikke lytte til live-lydstrømmen/g' index.php
sed -i 's/>Live Audio</>Live-lyd</g' index.php
#
# views.php - Menu bar
sed -i 's/>Overview</>Oversikt</g' views.php
sed -i "s/>Today's Detections</>Dagens deteksjoner</g" views.php
sed -i 's/>Best Recordings</>Beste opptak</g' views.php
sed -i 's/>Species Stats</>Artstatistikker</g' views.php
sed -i 's/>Daily Charts</>Daglige grafer</g' views.php
sed -i 's/>Recordings</>Opptak</g' views.php
sed -i 's/>Spectrogram</>Spektrogram</g' views.php
sed -i 's/>View Log</>Vis logg</g' views.php
sed -i 's/>Tools</>Verktøy</g' views.php
sed -i 's/>Weekly Report</>Ukerapport</g' views.php
sed -i 's/>Links</>Lenker</g' views.php
sed -i 's/You cannot edit the settings for this installation/Du kan ikke redigere innstillingene for denne installasjonen/g' views.php
sed -i 's/<div class="views">n/<div class="views"><br>/g' views.php
sed -i 's/WARNING: Your latitude and longitude are not set properly. Please do so now in Tools -> Settings./ADVARSEL: Din bredde- og lengdegrad er ikke satt riktig. Vennligst gjør det nå i Verktøy -> Innstillinger./g' views.php
sed -i 's/WARNING: Your latitude is not set properly. Please do so now in Tools -> Settings./ADVARSEL: Din breddegrad er ikke satt riktig. Vennligst gjør det nå i Verktøy -> Innstillinger./g' views.php
sed -i 's/WARNING: Your longitude is not set properly. Please do so now in Tools -> Settings./ADVARSEL: Din lengdegrad er ikke satt riktig. Vennligst gjør det nå i Verktøy -> Innstillinger./g' views.php
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
sed -i 's/>Total</>Totalt</g' overview.php
sed -i 's/>Today</>I dag</g' overview.php
sed -i 's/>Last Hour</>Siste time</g' overview.php
sed -i 's/>Species Detected Today</>Arter oppdaget i dag</g' overview.php
sed -i 's/>Total Number of Species</>Totalt antall arter</g' overview.php
sed -i 's/<h3>Most Recent Detection:/<br><h3>Siste deteksjon:/g' overview.php
sed -i 's/<h3>Currently Analyzing/<br><br><h3>Analyserer nå/g' overview.php
# sed -i '$s/<script>/<br><script>/g' overview.php
sed -i 's/Confidence:/Sikkerhet:/g' overview.php
sed -i 's/Database is busy/Databasen er opptatt/g' overview.php
sed -i 's/5 Most Recent Detections/De 5 siste deteksjonene/g' overview.php
sed -i 's/Loading.../Laster.../g' overview.php
sed -i 's/Open in new tab/Åpne i ny fane/g' overview.php
sed -i '0,/<style>/{s/<style>/<style> a:link { color: blue; } a:visited { color: blue; } a:active { color: blue; }/}' overview.php
sed -i 's/No Detections For Today./Ingen deteksjoner for i dag./g' overview.php
sed -i 's/View species stats/Vis artstatistikker/g' overview.php
sed -i 's/Detections Over 30d/Deteksjoner over 30d/g' overview.php
sed -i 's/>Close</>Lukk</g' overview.php
sed -i 's/Are you sure you want to blacklist this image?/Er du sikker på at du vil svarteliste dette bildet?/g' overview.php
sed -i 's/Blacklist this image/Svartelist dette bildet/g' overview.php
sed -i 's/Your system is currently processing a backlog of audio. This can take several hours before normal functionality of your BirdNET-Pi resumes./Systemet ditt behandler for øyeblikket en kø av lyd. Dette kan ta flere timer før normal funksjonalitet av din BirdNET-Pi gjenopptas./g' overview.php
# Addition for Nachtzuster
# sed -i 's#wikipedia.org/wiki/<\?php echo \$sciname#no.wikipedia.org/wiki/<\?php echo \$comname#g' overview.php
sed -i 's#<a href="https://wikipedia.org/wiki/<?php echo $sciname; ?>"#<a href="https://no.wikipedia.org/wiki/<?php echo $comname;?>"#g' overview.php
sed -i 's#<a href="https://wikipedia.org/wiki/<?php echo $sciname;?>"#<a href="https://no.wikipedia.org/wiki/<?php echo $comname;?>"#g' overview.php
sed -i 's#title="Wikipedia"#title="Wikipedia"#g' overview.php
sed -i 's/Species Today/Arter i dag/g' overview.php
sed -i 's/Species Total/Arter totalt/g' overview.php
sed -i 's/New Species/Nye arter/g' overview.php
sed -i 's/Rare Species/Sjeldne arter/g' overview.php
sed -i 's/detected today!/oppdaget i dag!/g' overview.php
sed -i 's/Max confidence/Maks sikkerhet/g' overview.php
sed -i 's/First detection/Første deteksjon/g' overview.php
sed -i 's/Last seen/Sist sett/g' overview.php
sed -i 's/mo ago/ måneder siden/g' overview.php
sed -i 's/d ago/ dager siden/g' overview.php
sed -i "s/'Detections Over ' + days + 'd'/'Deteksjoner over ' + days + ' d'/g" overview.php
sed -i "s/Open Today's recordings page/Åpne dagens opptakside/g" overview.php
#
# todays_detections.php - Today's finds
sed -i 's/>Number of Detections</>Antall deteksjoner</g' todays_detections.php
sed -i 's/>Total</>Totalt</g' todays_detections.php
sed -i 's/>Today</>I dag</g' todays_detections.php
sed -i 's/>Last Hour</>Siste time</g' todays_detections.php
sed -i 's/>Unique Species Total</>Unike arter totalt</g' todays_detections.php
sed -i 's/>Unique Species Today</>Unike arter i dag</g' todays_detections.php
sed -i 's/>Load 40 More...</>Last 40 flere...</g' todays_detections.php
sed -i 's#allaboutbirds.org#no.wikipedia.org#g' todays_detections.php
sed -i 's/guide/wiki/g' todays_detections.php
sed -i 's/Confidence:/Sikkerhet:/g' todays_detections.php
sed -i "s/Today's Detections/Dagens deteksjoner/g" todays_detections.php
sed -i "s/Legacy view/Legacy-visning/g" todays_detections.php
sed -i "s/Normal view/Normal visning/g" todays_detections.php
sed -i "s/Search.../Søk.../g" todays_detections.php
sed -i "s/Loading.../Laster.../g" todays_detections.php
sed -i 's/Open in new tab/Åpne i ny fane/g' todays_detections.php
sed -i 's/No Detections For Today./Ingen deteksjoner for i dag./g' todays_detections.php
sed -i '0,/<style>/{s/<style>/<style> a:link { color: blue; } a:visited { color: blue; } a:active { color: blue; }/}' todays_detections.php
sed -i 's/View species stats/Vis artstatistikker/g' todays_detections.php
sed -i 's/Detections Over 30d/Deteksjoner over 30d/g' todays_detections.php
sed -i 's/>Close</>Lukk</g' todays_detections.php
sed -i 's/Are you sure you want to blacklist this image?/Er du sikker på at du vil svarteliste dette bildet?/g' todays_detections.php
sed -i 's/Blacklist this image/Svartelist dette bildet/g' todays_detections.php
sed -i 's/Delete Detection/Slett deteksjon/g' todays_detections.php
# Addition for Nachtzuster
# sed -i 's#wikipedia.org/wiki/<\?php echo \$sciname#no.wikipedia.org/wiki/<\?php echo \$comname#g' todays_detections.php
sed -i 's#<a href="https://wikipedia.org/wiki/<?php echo $sciname;?>"#<a href="https://no.wikipedia.org/wiki/<?php echo $comname;?>"#g' todays_detections.php
# sed -i 's#title="Wikipedia"#title="Svenska Wikipedia"#g' todays_detections.php
sed -i 's/Species Total/Arter totalt/g' todays_detections.php
sed -i 's/Species Today/Arter i dag/g' todays_detections.php
#
# stats.php - Best recordings
sed -i 's/Choose a species to load images from Wikimedia Commons/Velg en art for å laste bilder fra Wikimedia Commons/g' stats.php
sed -i 's/Occurrences:/Forekomster:/g' stats.php
sed -i 's/Max Confidence:/Maksimal sikkerhet:/g' stats.php
sed -i 's/Best Recording:/Beste opptak:/g' stats.php
sed -i 's#allaboutbirds.org#no.wikipedia.org#g' stats.php
sed -i 's/guide/wiki/g' stats.php
sed -i 's/All About Birds/Wikipedia/g' stats.php
sed -i 's/Loading Images from/Laster bilder fra/g' stats.php
sed -i 's/Choose a species to load images from Flickr./Velg en art for å laste bilder fra Flickr./g' stats.php
sed -i 's/Best Recordings for Other Species:/Beste opptak for andre arter:/g' stats.php
sed -i 's/Sort by alphabetical/Sorter etter alfabetisk/g' stats.php
sed -i 's/Sort by occurrences/Sorter etter forekomster/g' stats.php
sed -i 's/Open in new tab/Åpne i ny fane/g' stats.php
sed -i '0,/<style>/{s/<style>/<style> a:link { color: blue; } a:visited { color: blue; } a:active { color: blue; }/}' stats.php
# Addition for Nachtzuster
sed -i "s#wikipedia\.org/wiki/\$sciname#no.wikipedia.org/wiki/\$comname#g" stats.php
sed -i 's#wikipedia.org/wiki/<\?php echo \$sciname#no.wikipedia.org/wiki/<\?php echo \$comname#g' stats.php
# sed -i 's#"Wikipedia\"#"Svenska Wikipedia\"#g' stats.php
sed -i 's#wikipedia\.org/wiki/\$sciname#no.wikipedia.org/wiki/\$comname#g' stats.php
sed -i 's/Sort by confidence/Sorter etter sikkerhet/g' stats.php
#
# history.php - Daily graphs
sed -i 's/>Submit Date</>Send dato</g' history.php
sed -i 's/Total Detections For The Day/Totalt antall deteksjoner for dagen/g' history.php
sed -i 's%echo "<img src=\"/Charts/$chart2?nocache=time()\">";%echo " ";%g' history.php
sed -i 's/No Charts for/Ingen grafer for/g' history.php
#
# play.php - Recordings
sed -i 's/Sort by date/Sorter etter dato/g' play.php
sed -i 's/Sort by confidence/Sorter etter sikkerhet/g' play.php
sed -i 's/>By Species</>Etter art</g' play.php
sed -i 's/>By Date</>Etter dato</g' play.php
sed -i 's/This file is not delete protected./Denne filen er ikke slettbeskyttet./g' play.php
sed -i 's/This file is not delete protected./Denne filen er ikke slettbeskyttet./g' play.php
sed -i 's/Unable to open file!/Kan ikke åpne filen!/g' play.php
sed -i 's/You must be authenticated to change the protection of files./Du må være autentisert for å endre beskyttelsen av filer./g' play.php
sed -i 's/This file is delete protected./Denne filen er slettbeskyttet./g' play.php
sed -i 's/Sort by alphabetical/Sorter etter alfabetisk/g' play.php
sed -i 's/Sort by occurrences/Sorter etter forekomster/g' play.php
sed -i 's/No recordings were found./Ingen opptak ble funnet./g' play.php
sed -i 's/They may have been deleted to make space for new recordings. You can modify this setting for the future in Tools/De kan ha blitt slettet for å frigjøre plass til nye opptak. Du kan endre denne innstillingen for fremtiden i Verktøy/g' play.php
sed -i 's/Only Show Purge Excluded/Vis kun rensing utelukket/g' play.php
sed -i 's/This file is not excluded from being purged./Denne filen er ikke utelukket fra å bli renset./g' play.php
sed -i 's/This file is excluded from being purged./Denne filen er utelukket fra å bli renset./g' play.php
sed -i 's/They may have been deleted to make space for new recordings. You can prevent this from happening in the future by clicking the/De kan ha blitt slettet for å frigjøre plass til nye opptak. Du kan forhindre dette i fremtiden ved å klikke på ikonet/g' play.php
sed -i 's/ icon in the top right of a recording./ i øvre høyre hjørne av et opptak./g' play.php
sed -i 's/You can also modify this behavior globally under /Du kan også endre denne oppførselen globalt under/g' play.php
sed -i 's/>here.</>her.</g' play.php
sed -i 's/Database is busy/Databasen er opptatt/g' play.php
sed -i 's/Delete Detection/Slett deteksjon/g' play.php
sed -i 's/"Today"/"I dag"/g' play.php
sed -i 's/This file has been shifted down in frequency./Denne filen er frekvensforskjøvet nedover./g' play.php
sed -i 's/This file is not shifted in frequency./Denne filen er ikke frekvensforskjøvet./g' play.php
sed -i 's/Sort by confidence/Sorter etter sikkerhet/g' play.php
# Addition for Nachtzuster
sed -i 's#wikipedia\.org/wiki/\$sciname#no.wikipedia.org/wiki/\$name#g' play.php
# sed -i 's#"Wikipedia\"#"Svenska Wikipedia\"#g' play.php
sed -i 's#Change Detection#Endre deteksjon#g' play.php
sed -i 's#This file will be deleted when disk space needs to be freed.#Denne filen vil bli slettet når diskplass må frigjøres.#g' play.php
sed -i 's#\(>95% usage\)\.# (>95% bruk).#g' play.php
#
# spectrogram.php - Spectrogram
sed -i 's/Gain:/Gain:/g' spectrogram.php
sed -i 's/Loading.../Laster.../g' spectrogram.php
sed -i 's/Compression:/Komprimering:/g' spectrogram.php
sed -i 's/Freq shift:/Frekvensforskyvning:/g' spectrogram.php
#
# daily_plot.py - Graph
sed -i 's#\(xlabel="Detections"\)#xlabel="Deteksjoner"#g' daily_plot.py
sed -i 's#\(xlabel="Hour of Day"\)#xlabel="Time på dagen"#g' daily_plot.py
sed -i "s#plot_type = 'All'#plot_type = 'Alle'#g" daily_plot.py
sed -i 's#{readings} Last Updated:#{readings} Sist oppdatert:#g' daily_plot.py
#
# plotly_streamlit.py - Species statistics
sed -i 's/Single Day View/Enkeldagsvisning/g' plotly_streamlit.py
sed -i 's/Resample Resolution/Resamplingsoppløsning/g' plotly_streamlit.py
sed -i 's/Select resolution for species - DAILY provides time series/Velg oppløsning for arter - DAGLIG gir tidsserier/g' plotly_streamlit.py
sed -i 's/Select start and end date, if same date get a clockplot for a single day/Velg start- og sluttdato, hvis samme dato, får du et klokkediagram for en enkelt dag/g' plotly_streamlit.py
sed -i 's/Select if you want single day view, unselect for multi-day views/Velg om du vil ha enkeldagsvisning, avvelg for flerdagsvisninger/g' plotly_streamlit.py
sed -i 's/Raw/Rå/g' plotly_streamlit.py
sed -i 's/15 minutes/15 minutter/g' plotly_streamlit.py
sed -i 's/Hourly/Hver time/g' plotly_streamlit.py
sed -i 's/DAILY/DAGLIG/g' plotly_streamlit.py
sed -i 's/Which bird would you like to explore for the dates/Hvilken fugl vil du utforske for datoene/g' plotly_streamlit.py
sed -i 's/Species in Date Range/Arter i datoperiode/g' plotly_streamlit.py
sed -i "s/' to '/' - '/g" plotly_streamlit.py
sed -i 's/Total Detect:/Totalt antall deteksjoner:/g' plotly_streamlit.py
sed -i 's/Download plot as a png/Last ned graf som png/g' plotly_streamlit.py
sed -i 's/Zoom/Zoom/g' plotly_streamlit.py
sed -i 's/Pan/Panorere/g' plotly_streamlit.py
sed -i 's/Box Select/Boksvalg/g' plotly_streamlit.py
sed -i 's/Lasso Select/Lasso-valg/g' plotly_streamlit.py
sed -i 's/Zoom in/Zoom inn/g' plotly_streamlit.py
sed -i 's/Zoom out/Zoom ut/g' plotly_streamlit.py
sed -i 's/Auto scale/Autoskalering/g' plotly_streamlit.py
sed -i 's/Reset views/Tilbakestill visninger/g' plotly_streamlit.py
sed -i 's/Produces with Plotly/Produsert med Plotly/g' plotly_streamlit.py
sed -i 's/Confidence Max:/Maks sikkerhet:/g' plotly_streamlit.py
sed -i 's/Reviewed/Gjennomgått/g' plotly_streamlit.py
sed -i 's/Available recordings/Tilgjengelige opptak/g' plotly_streamlit.py
sed -i 's/View fullscreen/Vis fullskjerm/g' plotly_streamlit.py
sed -i 's/Made with Streamlit/Laget med Streamlit/g' plotly_streamlit.py
# Due to changed time format, it is no longer possible to translate the hours to Swedish format
# sed -i "s/'12am', '1am', '2am', '3am', '4am', '5am', '6am', '7am', '8am', '9am',/'00', '01, '02', '03', '04', '05', '06', '07', '08', '09',/g" plotly_streamlit.py
# sed -i "s/ '10am', '11am', '12pm', '1pm', '2pm', '3pm', '4pm', '5pm', '6pm',/ '10', '11', '12', '13', '14', '15', '16', '17', '18',/g" plotly_streamlit.py
# sed -i "s/'7pm', '8pm', '9pm', '10pm', '11pm'],/'19', '20', '21', '22, '23'],/g" plotly_streamlit.py
# sed -i "s/'12am', '1am', '2am', '3am', '4am', '5am', '6am', '7am', '8am',/'00', '01', '02', '03', '04', '05', '06', '07', '08',/g" plotly_streamlit.py
# sed -i "s/'9am', '10am', '11am', '12pm', '1pm', '2pm', '3pm', '4pm', '5pm',/ '09', '10', '11', '12', '13', '14', '15', '16', '17',/g" plotly_streamlit.py
# sed -i "s/'6pm', '7pm', '8pm', '9pm', '10pm', '11pm'],/'18', '19', '20', '21', '22', '23'],/g" plotly_streamlit.py
sed -i 's/RUNNING.../KJØRER.../g' plotly_streamlit.py
sed -i 's/Please wait.../Vennligst vent.../g' plotly_streamlit.py
sed -i 's/Date to View/Dato å vise/g' plotly_streamlit.py
sed -i 's/Select Number of Birds to Show/Velg antall fugler å vise/g' plotly_streamlit.py
sed -i 's/sampling interval./prøvetakingsintervall./g' plotly_streamlit.py
sed -i 's/<br>for/<br>for/g' plotly_streamlit.py
sed -i 's/Species in/Arter i/g' plotly_streamlit.py
sed -i 's/Max:/Maks:/g' plotly_streamlit.py
sed -i 's/Median:/Median:/g' plotly_streamlit.py
sed -i 's/RECORDING NOT AVAILABLE :(/OPPTAK IKKE TILGJENGELIG :(/g' plotly_streamlit.py
sed -i 's/Date Range/Datoperiode/g' plotly_streamlit.py
sed -i 's/Select Color Pallet for Daily Detections/Velg fargepalett for daglige deteksjoner/g' plotly_streamlit.py
sed -i 's/Alla/Alle/g' plotly_streamlit.py
sed -i "s/'<b>Top'/<b>Topp'/g" plotly_streamlit.py
sed -i "s/' Species For '/' arter for '/g" plotly_streamlit.py
sed -i "s/ '<b>Daily ' + str(start_date) + ' Detections on ' + resample_sel + ' interval</ '<b>Daglige ' + str(start_date) + ' deteksjoner på ' + resample_sel + ' intervall</g" plotly_streamlit.py
sed -i "s/subplot_titles=('<b>Top ' +/subplot_titles=('<b>Topp ' +/g" plotly_streamlit.py
sed -i "s/+ str(top_N) + /+ str(top_N) + ','+ /g" plotly_streamlit.py
#
# config.php - Settings
sed -i 's/mailto:tim@birdweather.com/mailto:birdnetpi@birdweather.com/g' config.php
#
# links.php - Links
sed -i 's/Program-related links/Programrelaterte lenker/g' links.php
sed -i 's/Program source/Programkilde/g' links.php
sed -i 's/Wiki help page/Wiki-hjelpeside/g' links.php
sed -i 's/Questions and answers about BirdNET-Pi (English)/Spørsmål og svar om BirdNET-Pi (Engelsk)/g' links.php
sed -i 's/Own links/Egne lenker/g' links.php
sed -i 's/Other BirdNET-Pi/Andre BirdNET-Pi/g' links.php
sed -i 's/Please email if you have any questions or would like to do your own installation/Vennligst send en e-post hvis du har spørsmål eller ønsker å gjøre din egen installasjon/g' links.php
#
# weekly_report.php - Weekly report
sed -i 's/Report week/Rapporteringsuke/g' weekly_report.php
sed -i 's/Top 10 Species/Topp 10 arter/g' weekly_report.php
sed -i 's/Species Detected for the First Time/Arter oppdaget for første gang/g' weekly_report.php
sed -i 's/No new species were seen this week/Ingen nye arter ble sett denne uken/g' weekly_report.php
sed -i 's/percentages are calculated relative to week/prosentandeler beregnes relativt til uke/g' weekly_report.php