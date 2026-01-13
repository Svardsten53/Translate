#!/bin/bash
#
# This script replaces English text with Slovak text in BirdNET-Pi.
#
# Updated 2026-01-13 /L-Å - Adapted for Slovak (SK)
#
# Positions correctly in the file structure
alias homepage="cd /home/userid-att-ändra/BirdNET-Pi/"
cd /home/userid-att-ändra/BirdNET-Pi/homepage
#
# index.php - Home page
sed -i 's/ort-eller-plats/Sem-zadajte-vaše-mesto-alebo-miesto/g' index.php
sed -i 's/You cannot listen to the live audio stream/Nemôžete počúvať živý zvukový prenos/g' index.php
sed -i 's/>Live Audio</>Živý zvuk</g' index.php
#
# views.php - Menu bar
sed -i "/<button type=\"submit\" name=\"view\" value=\"Recordings\" form=\"views\">Recordings<\/button>/a <button type=\"submit\" name=\"view\" value=\"Links\" form=\"views\">Odkazy<\/button>" views.php
sed -i "/if(\$_GET\['view'\] == \"Daily Charts\"){include('history.php');}/a if(\$_GET['view'] == \"Links\"){include('scripts/links.php');}" views.php
sed -i "/if(\$_GET\['view'\] == \"Links\"){include('scripts\/links.php');}/a if(\$_GET['view'] == \"QA\"){include('scripts/qa.php');}" views.php
sed -i 's/>Overview</>Prehľad</g' views.php
sed -i "s/>Today's Detections</>Dnešné detekcie</g" views.php
sed -i 's/>Best Recordings</>Najlepšie nahrávky</g' views.php
sed -i 's/>Species Stats</>Štatistiky druhov</g' views.php
sed -i 's/>Daily Charts</>Denné grafy</g' views.php
sed -i 's/>Recordings</>Nahrávky</g' views.php
sed -i 's/>Spectrogram</>Spektrogram</g' views.php
sed -i 's/>View Log</>Zobraziť log</g' views.php
sed -i 's/>Tools</>Nástroje</g' views.php
sed -i 's/>Weekly Report</>Týždenný report</g' views.php
sed -i 's/>Links</>Odkazy</g' views.php
sed -i 's/You cannot edit the settings for this installation/Nemôžete upravovať nastavenia tejto inštalácie/g' views.php
sed -i 's/WARNING: Your latitude and longitude are not set properly. Please do so now in Tools -> Settings./VAROVANIE: Vaša zemepisná šírka a dĺžka nie sú správne nastavené. Urobte tak teraz v Nástroje -> Nastavenia./g' views.php
#
# style.css - Style sheets (Menu adjustment)
sed -i 's/flex: 65%;/flex: 80%;/g' style.css
sed -i 's/width: 65%;/width: 80%;/g' style.css
#
# Positions correctly in the scripts directory
alias homepage="cd /home/userid-att-ändra/BirdNET-Pi/"
cd /home/userid-att-ändra/BirdNET-Pi/scripts
#
# overview.php - Overview
sed -i 's/>Total</>Celkovovo</g' overview.php
sed -i 's/>Today</>Dnes</g' overview.php
sed -i 's/>Last Hour</>Posledná hodina</g' overview.php
sed -i 's/>Species Detected Today</>Dnes detegované druhy</g' overview.php
sed -i 's/>Total Number of Species</>Celkový počet druhov</g' overview.php
sed -i 's/<h3>Most Recent Detection:/<br><h3>Najnovšia detekcia:/g' overview.php
sed -i 's/<h3>Currently Analyzing/<br><br><h3>Práve analyzuje/g' overview.php
sed -i 's/Confidence:/Spoľahlivosť:/g' overview.php
sed -i 's/Database is busy/Databáza je zaneprázdnená/g' overview.php
sed -i 's/5 Most Recent Detections/5 najnovších detekcií/g' overview.php
sed -i 's/Loading.../Načítava sa.../g' overview.php
sed -i 's/Open in new tab/Otvoriť v novej karte/g' overview.php
sed -i 's/No Detections For Today./Dnes žiadne detekcie./g' overview.php
sed -i 's/View species stats/Zobraziť štatistiky druhov/g' overview.php
sed -i 's/Detections Over 30d/Detekcie za posledných 30 dní/g' overview.php
sed -i 's/>Close</>Zavrieť</g' overview.php
sed -i 's/Are you sure you want to blacklist this image?/Naozaj chcete tento obrázok pridať na čiernu listinu?/g' overview.php
sed -i 's/Blacklist this image/Pridať obrázok na čiernu listinu/g' overview.php
# Wikipedia link in overview
sed -i 's#<a href="https://wikipedia.org/wiki/<?php echo $sciname;?>"#<a href="https://sk.wikipedia.org/wiki/<?php echo $comname;?>"#g' overview.php
sed -i 's#<a href="https://wikipedia.org/wiki/<?php echo $sciname; ?>"#<a href="https://sk.wikipedia.org/wiki/<?php echo $comname;?>"#g' overview.php
sed -i 's/Species Today/Druhy dnes/g' overview.php
sed -i 's/Species Total/Druhy celkovo/g' overview.php
sed -i 's/New Species/Nové druhy/g' overview.php
sed -i 's/Rare Species/Vzácne druhy/g' overview.php
sed -i 's/detected today!/dnes detegované!/g' overview.php
sed -i 's/Max confidence/Max. spoľahlivosť/g' overview.php
sed -i 's/First detection/Prvá detekcia/g' overview.php
sed -i 's/Last seen/Naposledy videné/g' overview.php
sed -i 's/mo ago/ mes. dozadu/g' overview.php
sed -i 's/d ago/ dny dozadu/g' overview.php
#
# todays_detections.php - Today's detections
sed -i 's/>Number of Detections</>Počet detekcií</g' todays_detections.php
sed -i 's/>Total</>Celkovo</g' todays_detections.php
sed -i 's/>Today</>Dnes</g' todays_detections.php
sed -i 's/>Last Hour</>Posledná hodina</g' todays_detections.php
sed -i 's/>Unique Species Total</>Unikátne druhy celkovo</g' todays_detections.php
sed -i 's/>Unique Species Today</>Unikátne druhy dnes</g' todays_detections.php
sed -i 's/>Load 40 More...</>Načítať 40 ďalších...</g' todays_detections.php
sed -i 's#allaboutbirds.org#sk.wikipedia.org#g' todays_detections.php
sed -i 's/guide/wiki/g' todays_detections.php
sed -i 's/Confidence:/Spoľahlivosť:/g' todays_detections.php
sed -i "s/Today's Detections/Dnešné detekcie/g" todays_detections.php
sed -i "s/Legacy view/Zobrazenie Legacy/g" todays_detections.php
sed -i "s/Normal view/Normálne zobrazenie/g" todays_detections.php
sed -i "s/Search.../Hľadať.../g" todays_detections.php
sed -i 's/No Detections For Today./Dnes žiadne detekcie./g' todays_detections.php
sed -i 's#<a href="https://wikipedia.org/wiki/<?php echo $sciname;?>"#<a href="https://sk.wikipedia.org/wiki/<?php echo $comname;?>"#g' todays_detections.php
#
# stats.php - Best recordings
sed -i 's/Choose a species to load images from Wikimedia Commons/Vyberte druh na načítanie obrázkov z Wikimedia Commons/g' stats.php
sed -i 's/Occurrences:/Výskyty:/g' stats.php
sed -i 's/Max Confidence:/Max. spoľahlivosť:/g' stats.php
sed -i 's/Best Recording:/Najlepšia nahrávka:/g' stats.php
sed -i 's#allaboutbirds.org#sk.wikipedia.org#g' stats.php
sed -i 's/guide/wiki/g' stats.php
sed -i 's/All About Birds/Wikipedia/g' stats.php
sed -i 's/Sort by alphabetical/Zoradiť abecedne/g' stats.php
sed -i 's/Sort by occurrences/Zoradiť podľa výskytu/g' stats.php
sed -i 's#//wikipedia\.org/wiki/\$sciname#//sk\.wikipedia\.org/wiki/\$comname#g' stats.php
sed -i 's/Sort by confidence/Zoradiť podľa spoľahlivosti/g' stats.php
#
# history.php - Daily graphs
sed -i 's/>Submit Date</>Odoslať dátum</g' history.php
sed -i 's/Total Detections For The Day/Celkový počet detekcií za deň/g' history.php
sed -i 's/No Charts for/Žiadne grafy pre/g' history.php
#
# play.php - Recordings
sed -i 's/Sort by date/Zoradiť podľa dátumu/g' play.php
sed -i 's/Sort by confidence/Zoradiť podľa spoľahlivosti/g' play.php
sed -i 's/>By Species</>Podľa druhu</g' play.php
sed -i 's/>By Date</>Podľa dátumu</g' play.php
sed -i 's/This file is not delete protected./Tento súbor nie je chránený pred zmazaním./g' play.php
sed -i 's/Unable to open file!/Nepodarilo sa otvoriť súbor!/g' play.php
sed -i 's/This file is delete protected./Tento súbor je chránený pred zmazaním./g' play.php
sed -i 's/No recordings were found./Nenašli sa žiadne nahrávky./g' play.php
sed -i 's/Only Show Purge Excluded/Zobraziť iba vylúčené z čistenia/g' play.php
sed -i 's/Delete Detection/Vymazať detekciu/g' play.php
sed -i 's/"Today"/"Dnes"/g' play.php
sed -i 's#wikipedia\.org/wiki/\$sciname#sk\.wikipedia\.org/wiki/\$sciname#g' play.php
sed -i 's#Change Detection#Zmeniť detekciu#g' play.php
#
# spectrogram.php - Spectrogram
sed -i 's/Gain:/Zosilnenie:/g' spectrogram.php
sed -i 's/Compression:/Kompresia:/g' spectrogram.php
sed -i 's/Freq shift:/Frekvenčný posun:/g' spectrogram.php
#
# daily_plot.py - Graph script
sed -i 's#\(xlabel="Detections"\)#xlabel="Detekcie"#g' daily_plot.py
sed -i 's#\(xlabel="Hour of Day"\)#xlabel="Hodina dňa"#g' daily_plot.py
sed -i "s#plot_type = 'All'#plot_type = 'Všetky'#g" daily_plot.py
sed -i 's#{readings} Last Updated:#{readings} Posledná aktualizácia:#g' daily_plot.py
#
# plotly_streamlit.py - Species statistics
sed -i 's/Single Day View/Zobrazenie jedného dňa/g' plotly_streamlit.py
sed -i 's/Resample Resolution/Rozlíšenie vzorkovania/g' plotly_streamlit.py
sed -i 's/Raw/Pôvodné/g' plotly_streamlit.py
sed -i 's/15 minutes/15 minút/g' plotly_streamlit.py
sed -i 's/Hourly/Hodinovo/g' plotly_streamlit.py
sed -i 's/DAILY/DENNE/g' plotly_streamlit.py
sed -i 's/Species in Date Range/Druhy v časovom rozsahu/g' plotly_streamlit.py
sed -i 's/Total Detect:/Celkom detekcií:/g' plotly_streamlit.py
sed -i 's/Download plot as a png/Stiahnuť graf ako PNG/g' plotly_streamlit.py
sed -i 's/Zoom/Priblížiť/g' plotly_streamlit.py
sed -i 's/Pan/Posunúť/g' plotly_streamlit.py
sed -i 's/Auto scale/Automatická mierka/g' plotly_streamlit.py
sed -i 's/Reset views/Resetovať zobrazenie/g' plotly_streamlit.py
sed -i 's/Confidence Max:/Max. spoľahlivosť:/g' plotly_streamlit.py
sed -i 's/Reviewed/Skontrolované/g' plotly_streamlit.py
sed -i 's/Available recordings/Dostupné nahrávky/g' plotly_streamlit.py
sed -i 's/View fullscreen/Celá obrazovka/g' plotly_streamlit.py
sed -i 's/RUNNING.../SPUSTENÉ.../g' plotly_streamlit.py
sed -i 's/Please wait.../Čakajte prosím.../g' plotly_streamlit.py
sed -i 's/Date to View/Dátum na zobrazenie/g' plotly_streamlit.py
sed -i 's/Species in/Druhy v/g' plotly_streamlit.py
sed -i 's/RECORDING NOT AVAILABLE :(/NAHRÁVKA NIE JE K DISPOZÍCII :(/g' plotly_streamlit.py
sed -i 's/Date Range/Rozsah dátumov/g' plotly_streamlit.py
sed -i 's/Alla/Všetky/g' plotly_streamlit.py
#
# links.php - Links
sed -i 's/Program-related links/Odkazy k programu/g' links.php
sed -i 's/Program source/Zdrojový kód/g' links.php
sed -i 's/Wiki help page/Pomocník Wiki/g' links.php
sed -i 's/Questions and answers about BirdNET-Pi (English)/Otázky a odpovede o BirdNET-Pi (anglicky)/g' links.php
sed -i 's/Own links/Vlastné odkazy/g' links.php
sed -i 's/Other BirdNET-Pi/Ostatné BirdNET-Pi/g' links.php
#
# weekly_report.php - Weekly report
sed -i 's/Report week/Týždeň hlásenia/g' weekly_report.php
sed -i 's/Top 10 Species/Top 10 druhov/g' weekly_report.php
sed -i 's/Species Detected for the First Time/Prvýkrát detegované druhy/g' weekly_report.php
sed -i 's/No new species were seen this week/Tento týždeň neboli videné žiadne nové druhy/g' weekly_report.php
sed -i 's/percentages are calculated relative to week/percentá sú počítané relatívne k týždňu/g' weekly_report.php