#!/bin/bash
#
# This script replaces selected text in files with Czech text.
#
# Updated 2026-01-12 /L-Å - Adapted for Czech (CS)
#
# Positions correctly in the file structure
alias homepage="cd /home/userid-att-ändra/BirdNET-Pi/"
cd /home/userid-att-ändra/BirdNET-Pi/homepage
#
# index.php - Home page
sed -i 's/ort-eller-plats/Zadejte-vaše-město-nebo-místo-zde/g' index.php
sed -i 's/You cannot listen to the live audio stream/Nemůžete poslouchat živý audio stream/g' index.php
sed -i 's/>Live Audio</>Živé audio</g' index.php
#
# views.php - Menu bar
sed -i "/<button type=\"submit\" name=\"view\" value=\"Recordings\" form=\"views\">Recordings<\/button>/a <button type=\"submit\" name=\"view\" value=\"Links\" form=\"views\">Odkazy<\/button>" views.php
sed -i "/if(\$_GET\['view'\] == \"Daily Charts\"){include('history.php');}/a if(\$_GET['view'] == \"Links\"){include('scripts/links.php');}" views.php
sed -i "/if(\$_GET\['view'\] == \"Links\"){include('scripts\/links.php');}/a if(\$_GET['view'] == \"QA\"){include('scripts/qa.php');}" views.php
sed -i 's/>Overview</>Přehled</g' views.php
sed -i "s/>Today's Detections</>Dnešní detekce</g" views.php
sed -i 's/>Best Recordings</>Nejlepší nahrávky</g' views.php
sed -i 's/>Species Stats</>Statistiky druhů</g' views.php
sed -i 's/>Daily Charts</>Denní grafy</g' views.php
sed -i 's/>Recordings</>Nahrávky</g' views.php
sed -i 's/>Spectrogram</>Spektrogram</g' views.php
sed -i 's/>View Log</>Zobrazit protokol</g' views.php
sed -i 's/>Tools</>Nástroje</g' views.php
sed -i 's/>Weekly Report</>Týdenní hlášení</g' views.php
sed -i 's/>Links</>Odkazy</g' views.php
sed -i 's/You cannot edit the settings for this installation/Nemůžete upravovat nastavení této instalace/g' views.php
sed -i 's/<div class="views">n/<div class="views"><br>/g' views.php
sed -i 's/WARNING: Your latitude and longitude are not set properly. Please do so now in Tools -> Settings./VAROVÁNÍ: Vaše zeměpisná šířka a délka nejsou správně nastaveny. Nastavte je prosím v Nástroje -> Nastavení./g' views.php
#
# style.css - Style sheets
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
sed -i 's/>Total</>Celkem</g' overview.php
sed -i 's/>Today</>Dnes</g' overview.php
sed -i 's/>Last Hour</>Poslední hodina</g' overview.php
sed -i 's/>Species Detected Today</>Dnes detekované druhy</g' overview.php
sed -i 's/>Total Number of Species</>Celkový počet druhů</g' overview.php
sed -i 's/<h3>Most Recent Detection:/<br><h3>Nejnovější detekce:/g' overview.php
sed -i 's/<h3>Currently Analyzing/<br><br><h3>Právě analyzuje/g' overview.php
sed -i 's/Confidence:/Spolehlivost:/g' overview.php
sed -i 's/Database is busy/Databáze je zaneprázdněna/g' overview.php
sed -i 's/5 Most Recent Detections/5 nejnovějších detekcí/g' overview.php
sed -i 's/Loading.../Načítání.../g' overview.php
sed -i 's/Open in new tab/Otevřít na nové kartě/g' overview.php
sed -i 's/No Detections For Today./Dnes žádné detekce./g' overview.php
sed -i 's/View species stats/Zobrazit statistiky druhů/g' overview.php
sed -i 's/Detections Over 30d/Detekce za posledních 30 dní/g' overview.php
sed -i 's/>Close</>Zavřít</g' overview.php
sed -i 's/Are you sure you want to blacklist this image?/Opravdu chcete tento obrázek přidat na černou listinu?/g' overview.php
sed -i 's/Blacklist this image/Přidat obrázek na černou listinu/g' overview.php
sed -i 's#<a href="https://wikipedia.org/wiki/<?php echo $sciname;?>"#<a href="https://cs.wikipedia.org/wiki/<?php echo $comname;?>"#g' overview.php
sed -i 's#<a href="https://wikipedia.org/wiki/<?php echo $sciname; ?>"#<a href="https://cs.wikipedia.org/wiki/<?php echo $comname;?>"#g' overview.php
sed -i 's/Species Today/Druhy dnes/g' overview.php
sed -i 's/Species Total/Druhy celkem/g' overview.php
sed -i 's/New Species/Nové druhy/g' overview.php
sed -i 's/Rare Species/Vzácné druhy/g' overview.php
sed -i 's/detected today!/dnes detekováno!/g' overview.php
sed -i 's/Max confidence/Max. spolehlivost/g' overview.php
sed -i 's/First detection/První detekce/g' overview.php
sed -i 's/Last seen/Naposledy viděno/g' overview.php
sed -i 's/mo ago/ měs. nazpět/g' overview.php
sed -i 's/d ago/ dny nazpět/g' overview.php
#
# todays_detections.php - Today's finds
sed -i 's/>Number of Detections</>Počet detekcí</g' todays_detections.php
sed -i 's/>Total</>Celkem</g' todays_detections.php
sed -i 's/>Today</>Dnes</g' todays_detections.php
sed -i 's/>Last Hour</>Poslední hodina</g' todays_detections.php
sed -i 's/>Unique Species Total</>Unikátní druhy celkem</g' todays_detections.php
sed -i 's/>Unique Species Today</>Unikátní druhy dnes</g' todays_detections.php
sed -i 's/>Load 40 More...</>Načíst 40 dalších...</g' todays_detections.php
sed -i 's#allaboutbirds.org#cs.wikipedia.org#g' todays_detections.php
sed -i 's/guide/wiki/g' todays_detections.php
sed -i 's/Confidence:/Spolehlivost:/g' todays_detections.php
sed -i "s/Today's Detections/Dnešní detekce/g" todays_detections.php
sed -i "s/Legacy view/Zobrazení Legacy/g" todays_detections.php
sed -i "s/Normal view/Normální zobrazení/g" todays_detections.php
sed -i "s/Search.../Hledat.../g" todays_detections.php
sed -i "s/Loading.../Načítání.../g" todays_detections.php
sed -i 's/Open in new tab/Otevřít na nové kartě/g' todays_detections.php
sed -i 's/No Detections For Today./Dnes žádné detekce./g' todays_detections.php
sed -i 's#<a href="https://wikipedia.org/wiki/<?php echo $sciname;?>"#<a href="https://cs.wikipedia.org/wiki/<?php echo $comname;?>"#g' todays_detections.php
#
# stats.php - Best recordings
sed -i 's/Choose a species to load images from Wikimedia Commons/Vyberte druh pro načtení obrázků z Wikimedia Commons/g' stats.php
sed -i 's/Occurrences:/Výskyty:/g' stats.php
sed -i 's/Max Confidence:/Max. spolehlivost:/g' stats.php
sed -i 's/Best Recording:/Nejlepší nahrávka:/g' stats.php
sed -i 's#allaboutbirds.org#cs.wikipedia.org#g' stats.php
sed -i 's/guide/wiki/g' stats.php
sed -i 's/All About Birds/Wikipedia/g' stats.php
sed -i 's/Loading Images from/Načítání obrázků z/g' stats.php
sed -i 's/Sort by alphabetical/Seřadit abecedně/g' stats.php
sed -i 's/Sort by occurrences/Seřadit podle výskytů/g' stats.php
sed -i 's#//wikipedia\.org/wiki/\$sciname#//cs\.wikipedia\.org/wiki/\$comname#g' stats.php
sed -i 's/Sort by confidence/Seřadit podle spolehlivosti/g' stats.php
#
# history.php - Daily graphs
sed -i 's/>Submit Date</>Odeslat datum</g' history.php
sed -i 's/Total Detections For The Day/Celkem detekcí za den/g' history.php
sed -i 's/No Charts for/Žádné grafy pro/g' history.php
#
# play.php - Recordings
sed -i 's/Sort by date/Seřadit podle data/g' play.php
sed -i 's/Sort by confidence/Seřadit podle spolehlivosti/g' play.php
sed -i 's/>By Species</>Podle druhů</g' play.php
sed -i 's/>By Date</>Podle data</g' play.php
sed -i 's/This file is not delete protected./Tento soubor není chráněn proti smazání./g' play.php
sed -i 's/Unable to open file!/Nelze otevřít soubor!/g' play.php
sed -i 's/This file is delete protected./Tento soubor je chráněn proti smazání./g' play.php
sed -i 's/No recordings were found./Nebyly nalezeny žádné nahrávky./g' play.php
sed -i 's/Only Show Purge Excluded/Zobrazit pouze vyloučené z čištění/g' play.php
sed -i 's/Delete Detection/Smazat detekci/g' play.php
sed -i 's/"Today"/"Dnes"/g' play.php
sed -i 's#wikipedia\.org/wiki/\$sciname#cs\.wikipedia\.org/wiki/\$sciname#g' play.php
sed -i 's#Change Detection#Změnit detekci#g' play.php
#
# spectrogram.php - Spectrogram
sed -i 's/Gain:/Zesílení:/g' spectrogram.php
sed -i 's/Loading.../Načítání.../g' spectrogram.php
sed -i 's/Compression:/Komprese:/g' spectrogram.php
sed -i 's/Freq shift:/Frekvenční posun:/g' spectrogram.php
#
# daily_plot.py - Graph
sed -i 's#\(xlabel="Detections"\)#xlabel="Detekce"#g' daily_plot.py
sed -i 's#\(xlabel="Hour of Day"\)#xlabel="Hodina dne"#g' daily_plot.py
sed -i "s#plot_type = 'All'#plot_type = 'Vše'#g" daily_plot.py
sed -i 's#{readings} Last Updated:#{readings} Naposledy aktualizováno:#g' daily_plot.py
#
# plotly_streamlit.py - Species statistics
sed -i 's/Single Day View/Zobrazení jednoho dne/g' plotly_streamlit.py
sed -i 's/Resample Resolution/Rozlišení vzorkování/g' plotly_streamlit.py
sed -i 's/Raw/Původní/g' plotly_streamlit.py
sed -i 's/15 minutes/15 minut/g' plotly_streamlit.py
sed -i 's/Hourly/Hodinové/g' plotly_streamlit.py
sed -i 's/DAILY/DENNĚ/g' plotly_streamlit.py
sed -i 's/Species in Date Range/Druhy v časovém rozmezí/g' plotly_streamlit.py
sed -i 's/Total Detect:/Celkem detekcí:/g' plotly_streamlit.py
sed -i 's/Download plot as a png/Stáhnout graf jako PNG/g' plotly_streamlit.py
sed -i 's/Zoom/Přiblížit/g' plotly_streamlit.py
sed -i 's/Pan/Posunout/g' plotly_streamlit.py
sed -i 's/Auto scale/Automatické měřítko/g' plotly_streamlit.py
sed -i 's/Reset views/Resetovat zobrazení/g' plotly_streamlit.py
sed -i 's/Confidence Max:/Max. spolehlivost:/g' plotly_streamlit.py
sed -i 's/Reviewed/Zkontrolováno/g' plotly_streamlit.py
sed -i 's/Available recordings/Dostupné nahrávky/g' plotly_streamlit.py
sed -i 's/View fullscreen/Celoobrazovkový režim/g' plotly_streamlit.py
sed -i 's/RUNNING.../PROBÍHÁ.../g' plotly_streamlit.py
sed -i 's/Please wait.../Čekejte prosím.../g' plotly_streamlit.py
sed -i 's/Date to View/Datum k zobrazení/g' plotly_streamlit.py
sed -i 's/Species in/Druhy v/g' plotly_streamlit.py
sed -i 's/RECORDING NOT AVAILABLE :(/NAHRÁVKA NENÍ K DISPOZICI :(/g' plotly_streamlit.py
sed -i 's/Date Range/Rozmezí dat/g' plotly_streamlit.py
sed -i 's/Alla/Vše/g' plotly_streamlit.py
#
# links.php - Links
sed -i 's/Program-related links/Odkazy k programu/g' links.php
sed -i 's/Program source/Zdrojový kód/g' links.php
sed -i 's/Wiki help page/Nápověda Wiki/g' links.php
sed -i 's/Questions and answers about BirdNET-Pi (English)/Otázky a odpovědi k BirdNET-Pi (anglicky)/g' links.php
sed -i 's/Own links/Vlastní odkazy/g' links.php
sed -i 's/Other BirdNET-Pi/Ostatní BirdNET-Pi/g' links.php
#
# weekly_report.php - Weekly report
sed -i 's/Report week/Týden hlášení/g' weekly_report.php
sed -i 's/Top 10 Species/Top 10 druhů/g' weekly_report.php
sed -i 's/Species Detected for the First Time/Poprvé detekované druhy/g' weekly_report.php
sed -i 's/No new species were seen this week/Tento týden nebyly viděny žádné nové druhy/g' weekly_report.php
sed -i 's/percentages are calculated relative to week/procenta jsou počítána vzhledem k týdnu/g' weekly_report.php