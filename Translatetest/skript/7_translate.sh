#!/bin/bash
#
# Detta skript ersätter utvald text i filer med svensk text. 
#
# Om man vill göra egna ändringar av text går detta bra genom att kopiera en av de befintliga sed-kommandona och ändra texten i detta. Observera att tecknet'/' är avgränsare för de olika delarna av # kommandot och att samma tecken inte får finnas i # den text som ska hittas eller klistras in. Om så är fallet kan '/' bytas mot t ex '$'.
# translate.sh kan köras hur många gånger som helst då bara de strängar som inte redan ändrats kommer att ändras.
#
# Uppdaterat 2025-08-28  /L-Å
#
# Kod för ersättning av ett textblock med ett annat i views.php för att lägga till egna val i menyraden
#
# php replace.php
#
# Positionerar rätt i filstrukturen
alias homepage="cd /home/userid-att-ändra/BirdNET-Pi/"
cd /home/userid-att-ändra/BirdNET-Pi/homepage
#
#  index.php - Startsida (OBS!!! I första raden ska texten "skriv-in-din-ort-eller-plats-här" ändras innan skriptet körs.
sed -i 's/ort-eller-plats/skriv-in-din-ort-eller-plats-här/g' index.php
sed -i 's/You cannot listen to the live audio stream/Du kan inte lyssna direkt/g' index.php
sed -i 's/>Live Audio</>Lyssna direkt</g' index.php
#
# views.php - Menyrad
sed -i 's/>Overview</>Översikt</g' views.php
sed -i "s/>Today's Detections</>Dagens fynd</g" views.php
sed -i 's/>Best Recordings</>Bästa inspelningarna</g' views.php
sed -i 's/>Species Stats</>Artstatistik</g' views.php
sed -i 's/>Daily Charts</>Dagliga grafer</g' views.php
sed -i 's/>Recordings</>Inspelningar</g' views.php
sed -i 's/>Spectrogram</>Spektrogram</g' views.php
sed -i 's/>View Log</>Logg</g' views.php
sed -i 's/>Tools</>Verktyg</g' views.php
sed -i 's/>Links</>Länkar</g' views.php
sed -i 's/>Weekly Report</>Veckorapport</g' views.php
sed -i 's/You cannot edit the settings for this installation/Du kan inte ändra inställningar/g' views.php
sed -i 's/<div class="views">n/<div class="views"><br>/g' views.php
sed -i 's/WARNING: Your latitude and longitude are not set properly. Please do so now in Tools -> Settings./VARNING: Din latitud och longitud är inte rätt definierad. Var vänlig ändra i Verktyg -> Settings./g' views.php
sed -i 's/WARNING: Your latitude is not set properly. Please do so now in Tools -> Settings./VARNING: Din latitud är inte rätt definierad. Var vänlig ändra i Verktyg -> Settings./g' views.php
sed -i 's/WARNING: Your longitude is not set properly. Please do so now in Tools -> Settings./VARNING: Din longitud är inte rätt definierad. Var vänlig ändra i Verktyg -> Settings./g' views.php
#
# style.css - Stilmallar (Breddar menyraden för att få plats med alla valen på små skärmar)
sed -i 's/flex: 65%;/flex: 80%;/g' style.css
sed -i 's/width: 65%;/width: 80%;/g' style.css
sed -i '/\.banner {/ {N; s/height: 7%;/height: auto;/;}' style.css
sed -i '/text-align: center;/a padding: 7px;' style.css
#
# Positionerar rätt i filstrukturen
alias homepage="cd /home/userid-att-ändra/BirdNET-Pi/"
cd /home/userid-att-ändra/BirdNET-Pi/scripts
#
# overview.php - Översikt
sed -i 's/>Total</>Totalt</g' overview.php
sed -i 's/>Today</>I dag</g' overview.php
sed -i 's/>Last Hour</>Senaste timmen</g' overview.php
sed -i 's/>Species Detected Today</>Arter i dag</g' overview.php
sed -i 's/>Total Number of Species</>Arter totalt</g' overview.php
sed -i 's/<h3>Most Recent Detection:/<br><h3>Senaste fynd:/g' overview.php
sed -i 's/<h3>Currently Analyzing/<br><br><h3>Analyseras nu/g' overview.php
# sed -i '$s/<script>/<br><script>/g' overview.php
sed -i 's/Confidence:/Tillförlitlighet:/g' overview.php
sed -i 's/Database is busy/Databasen är upptagen/g' overview.php
sed -i 's/5 Most Recent Detections/De fem senaste fynden/g' overview.php
sed -i 's/Loading.../Laddar.../g' overview.php
sed -i 's/Open in new tab/Öppna i ny flik/g' overview.php
sed -i '0,/<style>/{s/<style>/<style> a:link { color: blue; } a:visited { color: blue; } a:active { color: blue; }/}' overview.php
sed -i 's/No Detections For Today./Inga fynd i dag än/g' overview.php
sed -i 's/View species stats/Visa artstatistik/g' overview.php
sed -i 's/Detections Over 30d/Fynd senaste 30 dagarna/g' overview.php
sed -i 's/>Close</>Stäng</g' overview.php
sed -i 's/Are you sure you want to blacklist this image?/Är du säker på att du vill svartlista den här bilden?/g' overview.php
sed -i 's/Blacklist this image/Visa aldrig den här bilden igen/g' overview.php
sed -i 's/Your system is currently processing a backlog of audio. This can take several hours before normal functionality of your BirdNET-Pi resumes./Systemet bearbetar för närvarande en eftersläpning av ljud. Detta kan ta flera timmar innan normal funktionalitet hos din BirdNET-Pi återupptas./g' overview.php
# Tillägg för Nachtzuster
# sed -i 's#wikipedia.org/wiki/<\?php echo \$sciname#sv.wikipedia.org/wiki/<\?php echo \$comname#g' overview.php
sed -i 's#<a href="https://wikipedia.org/wiki/<?php echo $sciname; ?>"#<a href="https://sv.wikipedia.org/wiki/<?php echo $comname;?>"#g' overview.php
sed -i 's#<a href="https://wikipedia.org/wiki/<?php echo $sciname;?>"#<a href="https://sv.wikipedia.org/wiki/<?php echo $comname;?>"#g' overview.php    
sed -i 's#title="Wikipedia"#title="Wikipedia"#g' overview.php    
sed -i 's/Species Today/Arter i dag/g' overview.php
sed -i 's/Species Total/Arter totalt/g' overview.php
sed -i 's/New Species/nya arter/g' overview.php
sed -i 's/Rare Species/länge sedan hörda arter/g' overview.php
sed -i 's/detected today!/upptäckta i dag!/g' overview.php
sed -i 's/Max confidence/Max tillförlitlighet/g' overview.php
sed -i 's/First detection/Första upptäckt/g' overview.php
sed -i 's/Last seen/Senast hörd/g' overview.php
sed -i 's/mo ago/ månader sedan/g' overview.php
sed -i 's/d ago/ dagar sedan/g' overview.php
sed -i "s/'Detections Over ' + days + 'd'/'Fynd under ' + days + ' dagar'/g" overview.php
sed -i "s/Open Today's recordings page/Öppna sidan med dagens inspelningar/g" overview.php
#
# todays_detections.php - Dagens fynd
sed -i 's/>Number of Detections</>Antal fynd</g' todays_detections.php
sed -i 's/>Total</>Totalt</g' todays_detections.php
sed -i 's/>Today</>I dag</g' todays_detections.php
sed -i 's/>Last Hour</>Senaste timmen</g' todays_detections.php
sed -i 's/>Unique Species Total</>Arter totalt</g' todays_detections.php
sed -i 's/>Unique Species Today</>Arter i dag</g' todays_detections.php
sed -i 's/>Load 40 More...</>Ladda 40 till...</g' todays_detections.php
sed -i 's/allaboutbirds.org/sv.wikipedia.org/g' todays_detections.php
sed -i 's/guide/wiki/g' todays_detections.php
sed -i 's/Confidence:/Tillförlitlighet:/g' todays_detections.php
sed -i "s/Today's Detections/Dagens fynd/g" todays_detections.php
sed -i "s/Legacy view/Enkel vy/g" todays_detections.php
sed -i "s/Normal view/Normal vy/g" todays_detections.php
sed -i "s/Search.../Sök.../g" todays_detections.php
sed -i "s/Loading.../Laddar.../g" todays_detections.php
sed -i 's/Open in new tab/Öppna i ny flik/g' todays_detections.php
sed -i 's/No Detections For Today./Inga fynd i dag än/g' todays_detections.php
sed -i '0,/<style>/{s/<style>/<style> a:link { color: blue; } a:visited { color: blue; } a:active { color: blue; }/}' todays_detections.php
sed -i 's/View species stats/Visa artstatistik/g' todays_detections.php
sed -i 's/Detections Over 30d/Fynd senaste 30 dagarna/g' todays_detections.php
sed -i 's/>Close</>Stäng</g' todays_detections.php
sed -i 's/Are you sure you want to blacklist this image?/Är du säker på att du vill svartlista den här bilden?/g' todays_detections.php
sed -i 's/Blacklist this image/Visa aldrig den här bilden igen/g' todays_detections.php
sed -i 's/Delete Detection/Radera fynd/g' todays_detections.php
# Tillägg för Nachtzuster
sed -i 's#wikipedia.org/wiki/<\?php echo \$sciname#sv.wikipedia.org/wiki/<\?php echo \$comname#g' todays_detections.php
# sed -i 's#title="Wikipedia"#title="Wikipedia"#g' todays_detections.php   
sed -i 's/Species Total/Arter totalt/g' todays_detections.php
sed -i 's/Species Today/Arter i dag/g' todays_detections.php
#
# stats.php - Bästa inspelningarna
sed -i 's/Choose a species to load images from Wikimedia Commons/Välj en art för att ladda ner bilder från Wikimedia Commons/g' stats.php
sed -i 's/Occurrences:/Antal fynd:/g' stats.php
sed -i 's/Max Confidence:/Max tillförlitlighet:/g' stats.php
sed -i 's/Best Recording:/Bästa inspelning:/g' stats.php
sed -i 's/allaboutbirds.org/sv.wikipedia.org/g' stats.php
sed -i 's/guide/wiki/g' stats.php
sed -i 's/All About Birds/Svenska Wikipedia/g' stats.php
sed -i 's/Loading Images from/Bilder från/g' stats.php
sed -i 's/Choose a species to load images from Flickr./Välj en art att ladda bilder från Flickr/g' stats.php
sed -i 's/Best Recordings for Other Species:/Bästa inspelningarna för andra arter/g' stats.php
sed -i 's/Sort by alphabetical/Sortera alfabetiskt/g' stats.php
sed -i 's/Sort by occurrences/Sortera efter antal fynd/g' stats.php
sed -i 's/Open in new tab/Öppna i ny flik/g' stats.php
sed -i '0,/<style>/{s/<style>/<style> a:link { color: blue; } a:visited { color: blue; } a:active { color: blue; }/}' stats.php
# Tillägg för Nachtzuster
sed -i "s|wikipedia.org/wiki/$sciname|sv.wikipedia.org/wiki/$comname|g" stats.php
sed -i 's#wikipedia.org/wiki/<\?php echo \$sciname#sv.wikipedia.org/wiki/<\?php echo \$comname#g' stats.php
# sed -i 's#"Wikipedia\"#"Wikipedia\"#g' stats.php 
sed -i 's#wikipedia\.org/wiki/\$sciname#sv.wikipedia.org/wiki/\$comname#g' stats.php
sed -i 's/Sort by confidence/Sortera efter tillförlitlighet/g' stats.php
#
# history.php - Dagliga grafer
sed -i 's/>Submit Date</>Hämta</g' history.php
sed -i 's/Total Detections For The Day/Totala fynd den här dagen/g' history.php
sed -i 's%echo "<img src=\"/Charts/$chart2?nocache=time()\">";%echo " ";%g' history.php
sed -i 's/No Charts for/Ingen graf för/g' history.php
#
# play.php - Inspelningar
sed -i 's/Sort by date/Sortera efter tid/g' play.php
sed -i 's/Sort by confidence/Sortera efter tillförlitlighet/g' play.php
sed -i 's/>By Species</>Efter art</g' play.php
sed -i 's/>By Date</>Efter datum</g' play.php
sed -i 's/This file is not delete protected./Den här filen är inte raderingsskyddad/g' play.php
sed -i 's/This file is not delete protected./Den här filen är inte raderingsskyddad/g' play.php
sed -i 's/Unable to open file!/Kan inte öppna filen!/g' play.php
sed -i 's/You must be authenticated to change the protection of files./Du måste ha behörighet för att ändra filskyddet./g' play.php
sed -i 's/This file is delete protected./Den här filen är raderingsskyddad./g' play.php
sed -i 's/Sort by alphabetical/Sortera alfabetiskt/g' play.php
sed -i 's/Sort by occurrences/Sortera efter antal fynd/g' play.php
sed -i 's/No recordings were found./Inga inspelningar hittades/g' play.php
sed -i 's/They may have been deleted to make space for new recordings. You can modify this setting for the future in Tools/De kan ha tagits bort för att lämna plats för nya inspelningar. Du kan ändra inställningarna för detta i Verktyg/g' play.php
sed -i 's/Only Show Purge Excluded/Visa bara raderingsskyddade/g' play.php
sed -i 's/This file is not excluded from being purged./Den här filen är inte raderingsskyddad/g' play.php
sed -i 's/This file is excluded from being purged./Den här filen är raderingsskyddad/g' play.php
sed -i 's/They may have been deleted to make space for new recordings. You can prevent this from happening in the future by clicking the/De kan ha raderats för att ge plats för nya inspelningar. Du kan förhindra att detta görs i fortsättningen genom att klicka på ikonen /g' play.php
sed -i 's/ icon in the top right of a recording./ uppe till höger av en inspelning./g' play.php
sed -i 's/You can also modify this behavior globally under /Du kan också ändra detta generellt i /g' play.php
sed -i 's/>here.</>under programmets inställningar.</g' play.php
sed -i 's/Database is busy/Databasen är upptagen/g' play.php
sed -i 's/Delete Detection/Radera fynd/g' play.php
sed -i 's/"Today"/"I dag"/g' play.php
sed -i 's/This file has been shifted down in frequency./Den här filen har flyttats ner i frekvens/g' play.php
sed -i 's/This file is not shifted in frequency./Den här filen har inte flyttats ner i frekvens/g' play.php
sed -i 's/Sort by confidence/Sortera efter tillförlitlighet/g' play.php
# Tillägg för Nachtzuster
sed -i 's#wikipedia.org/wiki/\$sciname#sv.wikipedia.org/wiki/\$name#g' play.php
# sed -i 's#"Wikipedia\"#"Wikipedia\"#g' play.php   
sed -i 's#Change Detection#Ändra fynd#g' play.php
sed -i 's#This file will be deleted when disk space needs to be freed.#Denna fil kommer att raderas när diskutrymme behöver frigöras#g' play.php
sed -i 's#(>95% usage).# (>95% använt)#g' play.php
#
#spectrogram.php - Spektrogram
sed -i 's/Gain:/Förstärkning:/g' spectrogram.php
sed -i 's/Loading.../Laddar.../g' spectrogram.php
sed -i 's/Compression:/Komprimering:/g' spectrogram.php
sed -i 's/Freq shift:/Frekvensskifte:/g' spectrogram.php
#
# daily_plot.py - Graf
sed -i 's#(xlabel="Detections")#(xlabel="Arter och antal")#g' daily_plot.py
sed -i 's#(xlabel="Hour of Day")#(xlabel="Timma på dygnet")#g' daily_plot.py
sed -i "s#plot_type = 'All'#plot_type = 'Alla dagens'#g" daily_plot.py
sed -i 's#{readings} Last Updated:#{readings} arter - Uppdaterad#g' daily_plot.py
#
# plotly_streamlit.py - Artstatistik
sed -i 's/Single Day View/Endagsvy/g' plotly_streamlit.py
sed -i 's/Resample Resolution/Uppdatera upplösningsvy/g' plotly_streamlit.py
sed -i 's/Select resolution for species - DAILY provides time series/Välj upplösning för arter - DAGLIG ger tidsserier/g' plotly_streamlit.py
sed -i 's/Select start and end date, if same date get a clockplot for a single day/Välj start- och slutdatum. Om samma datum visas klockgraf för en dag/g' plotly_streamlit.py
sed -i 's/Select if you want single day view, unselect for multi-day views/Välj för endagsvy, annars flerdagsvy/g' plotly_streamlit.py
sed -i 's/Raw/Allt/g' plotly_streamlit.py
sed -i 's/15 minutes/15 minuter/g' plotly_streamlit.py
sed -i 's/Hourly/Timvis/g' plotly_streamlit.py
sed -i 's/DAILY/DAGLIG/g' plotly_streamlit.py
sed -i 's/Which bird would you like to explore for the dates/Vilken art vill du visa för datumen/g' plotly_streamlit.py
sed -i 's/Species in Date Range/ arter i datumintervall/g' plotly_streamlit.py
sed -i "s/' to '/' - '/g" plotly_streamlit.py
sed -i 's/Total Detect:/Antal fynd: /g' plotly_streamlit.py
sed -i 's/Download plot as a png/Ladda ner graf som PNG-fil/g' plotly_streamlit.py
sed -i 's/Zoom/Zooma/g' plotly_streamlit.py
sed -i 's/Pan/Panorera/g' plotly_streamlit.py
sed -i 's/Box Select/Box/g' plotly_streamlit.py
sed -i 's/Lasso Select/Lasso/g' plotly_streamlit.py
sed -i 's/Zoom in/Zooma in/g' plotly_streamlit.py
sed -i 's/Zoom out/Zooma ut/g' plotly_streamlit.py
sed -i 's/Auto scale/Automatisk skala/g' plotly_streamlit.py
sed -i 's/Reset views/Återställ vyer/g' plotly_streamlit.py
sed -i 's/Produces with Plotly/Gjord med Plotly/g' plotly_streamlit.py
sed -i 's/Confidence Max:/Tillförlitlighet Max:/g' plotly_streamlit.py
sed -i 's/Reviewed/Granskad/g' plotly_streamlit.py
sed -i 's/Available recordings/Tillgängliga inspelningar/g' plotly_streamlit.py
sed -i 's/View fullscreen/Visa helskär/g' plotly_streamlit.py
sed -i 's/Made with Streamlit/Gjord med Streamlit/g' plotly_streamlit.py
#  P g a ändrat tidsformat går det inte längre att översätta timmarna til svenskt format
# sed -i "s/'12am', '1am', '2am', '3am', '4am', '5am', '6am', '7am', '8am', '9am',/'00', '01, '02', '03', '04', '05', '06', '07', '08', '09',/g" plotly_streamlit.py
# sed -i "s/ '10am', '11am', '12pm', '1pm', '2pm', '3pm', '4pm', '5pm', '6pm',/ '10', '11', '12', '13', '14', '15', '16', '17', '18',/g" plotly_streamlit.py
# sed -i "s/'7pm', '8pm', '9pm', '10pm', '11pm'],/'19', '20', '21', '22, '23'],/g" plotly_streamlit.py
# sed -i "s/'12am', '1am', '2am', '3am', '4am', '5am', '6am', '7am', '8am',/'00', '01', '02', '03', '04', '05', '06', '07', '08',/g" plotly_streamlit.py
# sed -i "s/'9am', '10am', '11am', '12pm', '1pm', '2pm', '3pm', '4pm', '5pm',/ '09', '10', '11', '12', '13', '14', '15', '16', '17',/g" plotly_streamlit.py
# sed -i "s/'6pm', '7pm', '8pm', '9pm', '10pm', '11pm'],/'18', '19', '20', '21', '22', '23'],/g" plotly_streamlit.py
sed -i 's/RUNNING.../JOBBAR.../g' plotly_streamlit.py
sed -i 's/Please wait.../Var god vänta.../g' plotly_streamlit.py
sed -i 's/Date to View/Datum att visa/g' plotly_streamlit.py
sed -i 's/Select Number of Birds to Show/Välj antal arter att visa/g' plotly_streamlit.py
sed -i 's/sampling interval./som intervall./g' plotly_streamlit.py
sed -i 's/<br>for/<br>med/g' plotly_streamlit.py
sed -i 's/Species in/arter i/g' plotly_streamlit.py
sed -i 's/Max:/Max: /g' plotly_streamlit.py
sed -i 's/Median:/Median: /g' plotly_streamlit.py
sed -i 's/RECORDING NOT AVAILABLE :(/Inspelning inte tillgänglig!/g' plotly_streamlit.py
sed -i 's/Date Range/Datumintervall/g' plotly_streamlit.py
sed -i 's/Select Color Pallet for Daily Detections/Välj färpalett för dagliga fynd/g' plotly_streamlit.py
sed -i 's/Alla/All/g' plotly_streamlit.py
sed -i "s/'<b>Top'/<b>Topp'/g" plotly_streamlit.py
sed -i "s/' Species For '/' arter för '/g" plotly_streamlit.py
sed -i "s/ '<b>Daily ' + str(start_date) + ' Detections on ' + resample_sel + ' interval</ '<b>Daglig ' + str(start_date) + ' fynd med ' + resample_sel + ' intervall</g" plotly_streamlit.py
sed -i "s/subplot_titles=('<b>Top ' +/subplot_titles=('<b>Topp ' +/g" plotly_streamlit.py
sed -i "s/+ str(top_N) + /+ str(top_N) + ','+ /g" plotly_streamlit.py
#
#config.php - Settings
sed -i 's/mailto:tim@birdweather.com/mailto:birdnetpi@birdweather.com/g' config.php
