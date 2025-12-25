#!/bin/bash
#
# This script replaces selected text in files with Danish text.
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
sed -i 's/ort-eller-plats/Skriv-din-by-eller-sted-her/g' index.php
sed -i 's/You cannot listen to the live audio stream/Du kan ikke lytte til live-lydstreamet/g' index.php
sed -i 's/>Live Audio</>Live-lyd</g' index.php
#
# views.php - Menu bar
sed -i "/<button type=\"submit\" name=\"view\" value=\"Recordings\" form=\"views\">Recordings<\/button>/a <button type=\"submit\" name=\"view\" value=\"Links\" form=\"views\">Links<\/button>" views.php
sed -i "/if(\$_GET\['view'\] == \"Daily Charts\"){include('history.php');}/a if(\$_GET['view'] == \"Links\"){include('scripts/links.php');}" views.php
sed -i "/if(\$_GET\['view'\] == \"Links\"){include('scripts\/links.php');}/a if(\$_GET['view'] == \"QA\"){include('scripts/qa.php');}" views.php
sed -i 's/>Overview</>Oversigt</g' views.php
sed -i "s/>Today's Detections</>Dagens detektioner</g" views.php
sed -i 's/>Best Recordings</>Bedste optagelser</g' views.php
sed -i 's/>Species Stats</>Artsstatistikker</g' views.php
sed -i 's/>Daily Charts</>Daglige diagrammer</g' views.php
sed -i 's/>Recordings</>Optagelser</g' views.php
sed -i 's/>Spectrogram</>Spektrogram</g' views.php
sed -i 's/>View Log</>Vis log</g' views.php
sed -i 's/>Tools</>Værktøjer</g' views.php
sed -i 's/>Weekly Report</>Ugentlig rapport</g' views.php
sed -i 's/>Links</>Links</g' views.php
sed -i 's/You cannot edit the settings for this installation/Du kan ikke redigere indstillingerne for denne installation/g' views.php
sed -i 's/<div class="views">n/<div class="views"><br>/g' views.php
sed -i 's/WARNING: Your latitude and longitude are not set properly. Please do so now in Tools -> Settings./ADVARSEL: Din bredde- og længdegrad er ikke indstillet korrekt. Gør det nu i Værktøjer -> Indstillinger./g' views.php
sed -i 's/WARNING: Your latitude is not set properly. Please do so now in Tools -> Settings./ADVARSEL: Din breddegrad er ikke indstillet korrekt. Gør det nu i Værktøjer -> Indstillinger./g' views.php
sed -i 's/WARNING: Your longitude is not set properly. Please do so now in Tools -> Settings./ADVARSEL: Din længdegrad er ikke indstillet korrekt. Gør det nu i Værktøjer -> Indstillinger./g' views.php
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
sed -i 's/>Today</>I dag</g' overview.php
sed -i 's/>Last Hour</>Sidste time</g' overview.php
sed -i 's/>Species Detected Today</>Arter opdaget i dag</g' overview.php
sed -i 's/>Total Number of Species</>Samlet antal arter</g' overview.php
sed -i 's/<h3>Most Recent Detection:/<br><h3>Seneste detektion:/g' overview.php
sed -i 's/<h3>Currently Analyzing/<br><br><h3>Analyserer nu/g' overview.php
# sed -i '$s/<script>/<br><script>/g' overview.php
sed -i 's/Confidence:/Sikkerhed:/g' overview.php
sed -i 's/Database is busy/Databasen er optaget/g' overview.php
sed -i 's/5 Most Recent Detections/De 5 seneste detektioner/g' overview.php
sed -i 's/Loading.../Indlæser.../g' overview.php
sed -i 's/Open in new tab/Åbn i ny fane/g' overview.php
sed -i '0,/<style>/{s/<style>/<style> a:link { color: blue; } a:visited { color: blue; } a:active { color: blue; }/}' overview.php
sed -i 's/No Detections For Today./Ingen detektioner for i dag./g' overview.php
sed -i 's/View species stats/Vis artsstatistikker/g' overview.php
sed -i 's/Detections Over 30d/Detektioner over 30d/g' overview.php
sed -i 's/>Close</>Luk</g' overview.php
sed -i 's/Are you sure you want to blacklist this image?/Er du sikker på, at du vil sortliste dette billede?/g' overview.php
sed -i 's/Blacklist this image/Sortlist dette billede/g' overview.php
sed -i 's/Your system is currently processing a backlog of audio. This can take several hours before normal functionality of your BirdNET-Pi resumes./Dit system behandler i øjeblikket et efterslæb af lyd. Dette kan tage flere timer, før den normale funktionalitet af din BirdNET-Pi genoptages./g' overview.php
# Addition for Nachtzuster
sed -i 's#<a href="https://wikipedia.org/wiki/<?php echo $sciname;?>"#<a href="https://da.wikipedia.org/wiki/<?php echo $comname;?>"#g' overview.php
sed -i 's#<a href="https://wikipedia.org/wiki/<?php echo $sciname; ?>"#<a href="https://da.wikipedia.org/wiki/<?php echo $comname;?>"#g' overview.php
sed -i 's#title="Wikipedia"#title="Wikipedia"#g' overview.php
sed -i 's/Species Today/Arter i dag/g' overview.php
sed -i 's/Species Total/Arter totalt/g' overview.php
sed -i 's/New Species/Nye arter/g' overview.php
sed -i 's/Rare Species/Sjældne arter/g' overview.php
sed -i 's/detected today!/opdaget i dag!/g' overview.php
sed -i 's/Max confidence/Maks. sikkerhed/g' overview.php
sed -i 's/First detection/Første detektion/g' overview.php
sed -i 's/Last seen/Sidst set/g' overview.php
sed -i 's/mo ago/ måneder siden/g' overview.php
sed -i 's/d ago/ dage siden/g' overview.php
sed -i "s/'Detections Over ' + days + 'd'/'Detektioner over ' + days + ' dage'/g" overview.php
sed -i "s/Open Today's recordings page/Åbn dagens optagelsesside/g" overview.php
#
# todays_detections.php - Today's finds
sed -i 's/>Number of Detections</>Antal detektioner</g' todays_detections.php
sed -i 's/>Total</>Total</g' todays_detections.php
sed -i 's/>Today</>I dag</g' todays_detections.php
sed -i 's/>Last Hour</>Sidste time</g' todays_detections.php
sed -i 's/>Unique Species Total</>Unikke arter totalt</g' todays_detections.php
sed -i 's/>Unique Species Today</>Unikke arter i dag</g' todays_detections.php
sed -i 's/>Load 40 More...</>Indlæs 40 mere...</g' todays_detections.php
sed -i 's#allaboutbirds.org#da.wikipedia.org#g' todays_detections.php
sed -i 's/guide/wiki/g' todays_detections.php
sed -i 's/Confidence:/Sikkerhed:/g' todays_detections.php
sed -i "s/Today's Detections/Dagens detektioner/g" todays_detections.php
sed -i "s/Legacy view/Legacy-visning/g" todays_detections.php
sed -i "s/Normal view/Normal visning/g" todays_detections.php
sed -i "s/Search.../Søg.../g" todays_detections.php
sed -i "s/Loading.../Indlæser.../g" todays_detections.php
sed -i 's/Open in new tab/Åbn i ny fane/g' todays_detections.php
sed -i 's/No Detections For Today./Ingen detektioner for i dag./g' todays_detections.php
sed -i '0,/<style>/{s/<style>/<style> a:link { color: blue; } a:visited { color: blue; } a:active { color: blue; }/}' todays_detections.php
sed -i 's/View species stats/Vis artsstatistikker/g' todays_detections.php
sed -i 's/Detections Over 30d/Detektioner over 30d/g' todays_detections.php
sed -i 's/>Close</>Luk</g' todays_detections.php
sed -i 's/Are you sure you want to blacklist this image?/Er du sikker på, at du vil sortliste dette billede?/g' todays_detections.php
sed -i 's/Blacklist this image/Sortlist dette billede/g' todays_detections.php
sed -i 's/Delete Detection/Slet detektion/g' todays_detections.php
# Addition for Nachtzuster
sed -i 's#<a href="https://wikipedia.org/wiki/<?php echo $sciname;?>"#<a href="https://da.wikipedia.org/wiki/<?php echo $comname;?>"#g' todays_detections.php
sed -i 's/Species Total/Arter totalt/g' todays_detections.php
sed -i 's/Species Today/Arter i dag/g' todays_detections.php
#
# stats.php - Best recordings
sed -i 's/Choose a species to load images from Wikimedia Commons/Vælg en art for at indlæse billeder fra Wikimedia Commons/g' stats.php
sed -i 's/Occurrences:/Forekomster:/g' stats.php
sed -i 's/Max Confidence:/Maks. sikkerhed:/g' stats.php
sed -i 's/Best Recording:/Bedste optagelse:/g' stats.php
sed -i 's#allaboutbirds.org#da.wikipedia.org#g' stats.php
sed -i 's/guide/wiki/g' stats.php
sed -i 's/All About Birds/Wikipedia/g' stats.php
sed -i 's/Loading Images from/Indlæser billeder fra/g' stats.php
sed -i 's/Choose a species to load images from Flickr./Vælg en art for at indlæse billeder fra Flickr./g' stats.php
sed -i 's/Best Recordings for Other Species:/Bedste optagelser for andre arter:/g' stats.php
sed -i 's/Sort by alphabetical/Sorter efter alfabetisk/g' stats.php
sed -i 's/Sort by occurrences/Sorter efter forekomster/g' stats.php
sed -i 's/Open in new tab/Åbn i ny fane/g' stats.php
sed -i '0,/<style>/{s/<style>/<style> a:link { color: blue; } a:visited { color: blue; } a:active { color: blue; }/}' stats.php
# Addition for Nachtzuster
sed -i 's#//wikipedia\.org/wiki/\$sciname#//da\.wikipedia\.org/wiki/\$comname#g' stats.php
sed -i 's/Sort by confidence/Sorter efter sikkerhed/g' stats.php
#
# history.php - Daily graphs
sed -i 's/>Submit Date</>Send dato</g' history.php
sed -i 's/Total Detections For The Day/Samlet antal detektioner for dagen/g' history.php
sed -i 's%echo "<img src=\"/Charts/$chart2?nocache=time()\">";%echo " ";%g' history.php
sed -i 's/No Charts for/Ingen diagrammer for/g' history.php
#
# play.php - Recordings
sed -i 's/Sort by date/Sorter efter dato/g' play.php
sed -i 's/Sort by confidence/Sorter efter sikkerhed/g' play.php
sed -i 's/>By Species</>Efter art</g' play.php
sed -i 's/>By Date</>Efter dato</g' play.php
sed -i "s/This file is not delete protected./Denne fil er ikke slettebeskyttet./g" play.php
sed -i "s/This file is not delete protected./Denne fil er ikke slettebeskyttet./g" play.php
sed -i 's/Unable to open file!/Kan ikke åbne filen!/g' play.php
sed -i 's/You must be authenticated to change the protection of files./Du skal være godkendt for at ændre filernes beskyttelse./g' play.php
sed -i "s/This file is delete protected./Denne fil er slettebeskyttet./g" play.php
sed -i 's/Sort by alphabetical/Sorter alfabetisk/g' play.php
sed -i 's/Sort by occurrences/Sorter efter forekomster/g' play.php
sed -i 's/No recordings were found./Ingen optagelser blev fundet./g' play.php
sed -i 's/They may have been deleted to make space for new recordings. You can modify this setting for the future in Tools/De kan være blevet slettet for at give plads til nye optagelser. Du kan ændre denne indstilling for fremtiden i Værktøjer/g' play.php
sed -i 's/Only Show Purge Excluded/Vis kun rensning udelukket/g' play.php
sed -i 's/This file is not excluded from being purged./Denne fil er ikke udelukket fra at blive renset./g' play.php
sed -i 's/This file is excluded from being purged./Denne fil er udelukket fra at blive renset./g' play.php
sed -i 's/They may have been deleted to make space for new recordings. You can prevent this from happening in the future by clicking the/De kan være blevet slettet for at give plads til nye optagelser. Du kan forhindre dette i fremtiden ved at klikke på/g' play.php
sed -i 's/ icon in the top right of a recording./ ikonet i øverste højre hjørne af en optagelse./g' play.php
sed -i 's/You can also modify this behavior globally under /Du kan også ændre denne adfærd globalt under/g' play.php
sed -i 's/>here.</>her.</g' play.php
sed -i 's/Database is busy/Databasen er optaget/g' play.php
sed -i 's/Delete Detection/Slet detektion/g' play.php
sed -i 's/"Today"/"I dag"/g' play.php
sed -i 's/This file has been shifted down in frequency./Denne fil er blevet frekvensforskudt nedad./g' play.php
sed -i 's/This file is not shifted in frequency./Denne fil er ikke frekvensforskudt./g' play.php
sed -i 's/Sort by confidence/Sorter efter sikkerhed/g' play.php
# Addition for Nachtzuster
sed -i 's#wikipedia\.org/wiki/\$sciname#da\.wikipedia\.org/wiki/\$sciname#g' play.php
sed -i 's#Change Detection#Ændre detektion#g' play.php
sed -i 's#This file will be deleted when disk space needs to be freed.#Denne fil vil blive slettet, når diskplads skal frigøres.#g' play.php
sed -i 's#\(>95% usage\)\.# (>95% forbrug).#g' play.php
#
# spectrogram.php - Spectrogram
sed -i 's/Gain:/Gain:/g' spectrogram.php
sed -i 's/Loading.../Indlæser.../g' spectrogram.php
sed -i 's/Compression:/Komprimering:/g' spectrogram.php
sed -i 's/Freq shift:/Frekvensforskydning:/g' spectrogram.php
#
# daily_plot.py - Graph
sed -i 's#\(xlabel="Detections"\)#xlabel="Detektioner"#g' daily_plot.py
sed -i 's#\(xlabel="Hour of Day"\)#xlabel="Time på dagen"#g' daily_plot.py
sed -i "s#plot_type = 'All'#plot_type = 'Alle'#g" daily_plot.py
sed -i 's#{readings} Last Updated:#{readings} Sidst opdateret:#g' daily_plot.py
#
# plotly_streamlit.py - Species statistics
sed -i 's/Single Day View/Enkelt dagsvisning/g' plotly_streamlit.py
sed -i 's/Resample Resolution/Resample-opløsning/g' plotly_streamlit.py
sed -i 's/Select resolution for species - DAILY provides time series/Vælg opløsning for arter - DAGLIG giver tidsserier/g' plotly_streamlit.py
sed -i 's/Select start and end date, if same date get a clockplot for a single day/Vælg start- og slutdato, hvis det er samme dato, får du et tidsdiagram for en enkelt dag/g' plotly_streamlit.py
sed -i 's/Select if you want single day view, unselect for multi-day views/Vælg om du vil have enkelt dagsvisning, fravælg for multi-dagsvisninger/g' plotly_streamlit.py
sed -i 's/Raw/Rå/g' plotly_streamlit.py
sed -i 's/15 minutes/15 minutter/g' plotly_streamlit.py
sed -i 's/Hourly/Timebaseret/g' plotly_streamlit.py
sed -i 's/DAILY/DAGLIG/g' plotly_streamlit.py
sed -i 's/Which bird would you like to explore for the dates/Hvilken fugl vil du udforske for datoerne/g' plotly_streamlit.py
sed -i 's/Species in Date Range/Arter i datointerval/g' plotly_streamlit.py
sed -i "s/' to '/' - '/g" plotly_streamlit.py
sed -i 's/Total Detect:/Total detektion:/g' plotly_streamlit.py
sed -i 's/Download plot as a png/Download diagram som en png/g' plotly_streamlit.py
sed -i 's/Zoom/Zoom/g' plotly_streamlit.py
sed -i 's/Pan/Panorering/g' plotly_streamlit.py
sed -i 's/Box Select/Boksmarkering/g' plotly_streamlit.py
sed -i 's/Lasso Select/Lasso-markering/g' plotly_streamlit.py
sed -i 's/Zoom in/Zoom ind/g' plotly_streamlit.py
sed -i 's/Zoom out/Zoom ud/g' plotly_streamlit.py
sed -i 's/Auto scale/Automatisk skalering/g' plotly_streamlit.py
sed -i 's/Reset views/Nulstil visninger/g' plotly_streamlit.py
sed -i 's/Produces with Plotly/Produceret med Plotly/g' plotly_streamlit.py
sed -i 's/Confidence Max:/Maks. sikkerhed:/g' plotly_streamlit.py
sed -i 's/Reviewed/Gennemgået/g' plotly_streamlit.py
sed -i 's/Available recordings/Tilgængelige optagelser/g' plotly_streamlit.py
sed -i 's/View fullscreen/Vis i fuldskærm/g' plotly_streamlit.py
sed -i 's/Made with Streamlit/Lavet med Streamlit/g' plotly_streamlit.py
# Due to changed time format, it is no longer possible to translate the hours to Swedish format
# sed -i "s/'12am', '1am', '2am', '3am', '4am', '5am', '6am', '7am', '8am', '9am',/'00', '01, '02', '03', '04', '05', '06', '07', '08', '09',/g" plotly_streamlit.py
# sed -i "s/ '10am', '11am', '12pm', '1pm', '2pm', '3pm', '4pm', '5pm', '6pm',/ '10', '11', '12', '13', '14', '15', '16', '17', '18',/g" plotly_streamlit.py
# sed -i "s/'7pm', '8pm', '9pm', '10pm', '11pm'],/'19', '20', '21', '22, '23'],/g" plotly_streamlit.py
# sed -i "s/'12am', '1am', '2am', '3am', '4am', '5am', '6am', '7am', '8am',/'00', '01', '02', '03', '04', '05', '06', '07', '08',/g" plotly_streamlit.py
# sed -i "s/'9am', '10am', '11am', '12pm', '1pm', '2pm', '3pm', '4pm', '5pm',/ '09', '10', '11', '12', '13', '14', '15', '16', '17',/g" plotly_streamlit.py
# sed -i "s/'6pm', '7pm', '8pm', '9pm', '10pm', '11pm'],/'18', '19', '20', '21', '22', '23'],/g" plotly_streamlit.py
sed -i 's/RUNNING.../KØRER.../g' plotly_streamlit.py
sed -i 's/Please wait.../Vent venligst.../g' plotly_streamlit.py
sed -i 's/Date to View/Dato at vise/g' plotly_streamlit.py
sed -i 's/Select Number of Birds to Show/Vælg antal fugle at vise/g' plotly_streamlit.py
sed -i 's/sampling interval./prøvetagningsinterval./g' plotly_streamlit.py
sed -i 's/<br>for/<br>for/g' plotly_streamlit.py
sed -i 's/Species in/Arter i/g' plotly_streamlit.py
sed -i 's/Max:/Maks:/g' plotly_streamlit.py
sed -i 's/Median:/Median:/g' plotly_streamlit.py
sed -i 's/RECORDING NOT AVAILABLE :(/OPTAGELSE IKKE TILGÆNGELIG :(/g' plotly_streamlit.py
sed -i 's/Date Range/Datointerval/g' plotly_streamlit.py
sed -i 's/Select Color Pallet for Daily Detections/Vælg farvepalet til daglige detektioner/g' plotly_streamlit.py
sed -i 's/Alla/Alle/g' plotly_streamlit.py
sed -i "s/'<b>Top'/<b>Top'/g" plotly_streamlit.py
sed -i "s/' Species For '/' arter for '/g" plotly_streamlit.py
sed -i "s/ '<b>Daily ' + str(start_date) + ' Detections on ' + resample_sel + ' interval</ '<b>Daglige ' + str(start_date) + ' detektioner på ' + resample_sel + ' interval</g" plotly_streamlit.py
sed -i "s/subplot_titles=('<b>Top ' +/subplot_titles=('<b>Top ' +/g" plotly_streamlit.py
sed -i "s/+ str(top_N) + /+ str(top_N) + ','+ /g" plotly_streamlit.py
#
# config.php - Settings
sed -i 's/mailto:tim@birdweather.com/mailto:birdnetpi@birdweather.com/g' config.php
#
# links.php - Links
sed -i 's/Program-related links/Programrelaterede links/g' links.php
sed -i 's/Program source/Programkilde/g' links.php
sed -i 's/Wiki help page/Wiki-hjælpeside/g' links.php
sed -i 's/Questions and answers about BirdNET-Pi (English)/Spørgsmål og svar om BirdNET-Pi (Engelsk)/g' links.php
sed -i 's/Own links/Egne links/g' links.php
sed -i 's/Other BirdNET-Pi/Andre BirdNET-Pi/g' links.php
sed -i "s/Please email if you have any questions or would like to do your own installation/Send venligst en e-mail, hvis du har spørgsmål eller gerne vil lave din egen installation/g" links.php
#
# weekly_report.php - Weekly report
sed -i 's/Report week/Rapporteringsuge/g' weekly_report.php
sed -i 's/Top 10 Species/Top 10 arter/g' weekly_report.php
sed -i 's/Species Detected for the First Time/Arter opdaget for første gang/g' weekly_report.php
sed -i 's/No new species were seen this week/Ingen nye arter blev set i denne uge/g' weekly_report.php
sed -i 's/percentages are calculated relative to week/procenter beregnes i forhold til uge/g' weekly_report.php