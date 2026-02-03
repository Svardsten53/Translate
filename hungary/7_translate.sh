#!/bin/bash
#
# This script replaces English text with Hungarian text in BirdNET-Pi.
#
# Updated 2026-01-13 /L-Å - Adapted for Hungarian (HU)
#
# Positions correctly in the file structure
alias homepage="cd /home/userid-att-ändra/BirdNET-Pi/"
cd /home/userid-att-ändra/BirdNET-Pi/homepage
#
# index.php - Home page
sed -i 's/ort-eller-plats/Adja-meg-a-városát-vagy-helyszínét-itt/g' index.php
sed -i 's/You cannot listen to the live audio stream/Nem hallgathatja az élő audio folyamot/g' index.php
sed -i 's/>Live Audio</>Élő hang</g' index.php
#
# views.php - Menu bar
sed -i "/<button type=\"submit\" name=\"view\" value=\"Recordings\" form=\"views\">Recordings<\/button>/a <button type=\"submit\" name=\"view\" value=\"Links\" form=\"views\">Linkek<\/button>" views.php
sed -i "/if(\$_GET\['view'\] == \"Daily Charts\"){include('history.php');}/a if(\$_GET['view'] == \"Links\"){include('scripts/links.php');}" views.php
sed -i "/if(\$_GET\['view'\] == \"Links\"){include('scripts\/links.php');}/a if(\$_GET['view'] == \"QA\"){include('scripts/qa.php');}" views.php
sed -i 's/>Overview</>Áttekintés</g' views.php
sed -i "s/>Today's Detections</>Mai észlelések</g" views.php
sed -i 's/>Best Recordings</>Legjobb felvételek</g' views.php
sed -i 's/>Species Stats</>Fajstatisztikák</g' views.php
sed -i 's/>Daily Charts</>Napi grafikonok</g' views.php
sed -i 's/>Recordings</>Felvételek</g' views.php
sed -i 's/>Spectrogram</>Spektrogram</g' views.php
sed -i 's/>View Log</>Napló megtekintése</g' views.php
sed -i 's/>Tools</>Eszközök</g' views.php
sed -i 's/>Weekly Report</>Heti jelentés</g' views.php
sed -i 's/>Links</>Linkek</g' views.php
sed -i 's/You cannot edit the settings for this installation/Nem módosíthatja a telepítés beállításait/g' views.php
sed -i 's/WARNING: Your latitude and longitude are not set properly. Please do so now in Tools -> Settings./FIGYELEM: A szélességi és hosszúsági adatok nincsenek megfelelően beállítva. Kérjük, tegye meg az Eszközök -> Beállítások menüben./g' views.php
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
sed -i 's/>Total</>Összesen</g' overview.php
sed -i 's/>Today</>Ma</g' overview.php
sed -i 's/>Last Hour</>Utolsó óra</g' overview.php
sed -i 's/>Species Detected Today</>Ma észlelt fajok</g' overview.php
sed -i 's/>Total Number of Species</>Fajok száma összesen</g' overview.php
sed -i 's/<h3>Most Recent Detection:/<br><h3>Legutóbbi észlelés:/g' overview.php
sed -i 's/<h3>Currently Analyzing/<br><br><h3>Elemzés folyamatban/g' overview.php
sed -i 's/Confidence:/Megbízhatóság:/g' overview.php
sed -i 's/Database is busy/Az adatbázis elfoglalt/g' overview.php
sed -i 's/5 Most Recent Detections/Az 5 legutóbbi észlelés/g' overview.php
sed -i 's/Loading.../Betöltés.../g' overview.php
sed -i 's/Open in new tab/Megnyitás új lapon/g' overview.php
sed -i 's/No Detections For Today./Ma nem történt észlelés./g' overview.php
sed -i 's/View species stats/Fajstatisztikák megtekintése/g' overview.php
sed -i 's/Detections Over 30d/Az elmúlt 30 nap észlelései/g' overview.php
sed -i 's/>Close</>Bezárás</g' overview.php
sed -i 's/Are you sure you want to blacklist this image?/Biztosan tiltólistára teszi ezt a képet?/g' overview.php
sed -i 's/Blacklist this image/Kép tiltólistára helyezése/g' overview.php
# Wikipedia link in overview
sed -i 's#<a href="https://wikipedia.org/wiki/<?php echo $sciname;?>"#<a href="https://hu.wikipedia.org/wiki/<?php echo $comname;?>"#g' overview.php
sed -i 's#<a href="https://wikipedia.org/wiki/<?php echo $sciname; ?>"#<a href="https://hu.wikipedia.org/wiki/<?php echo $comname;?>"#g' overview.php
sed -i 's/Species Today/Fajok ma/g' overview.php
sed -i 's/Species Total/Fajok összesen/g' overview.php
sed -i 's/New Species/Új fajok/g' overview.php
sed -i 's/Rare Species/Ritka fajok/g' overview.php
sed -i 's/detected today!/ma észlelve!/g' overview.php
sed -i 's/Max confidence/Max. megbízhatóság/g' overview.php
sed -i 's/First detection/Első észlelés/g' overview.php
sed -i 's/Last seen/Utoljára látva/g' overview.php
sed -i 's/mo ago/ hónapja/g' overview.php
sed -i 's/d ago/ napja/g' overview.php
#
# todays_detections.php - Today's detections
sed -i 's/>Number of Detections</>Észlelések száma</g' todays_detections.php
sed -i 's/>Total</>Összesen</g' todays_detections.php
sed -i 's/>Today</>Ma</g' todays_detections.php
sed -i 's/>Last Hour</>Utolsó óra</g' todays_detections.php
sed -i 's/>Unique Species Total</>Egyedi fajok összesen</g' todays_detections.php
sed -i 's/>Unique Species Today</>Egyedi fajok ma</g' todays_detections.php
sed -i 's/>Load 40 More...</>További 40 betöltése...</g' todays_detections.php
sed -i 's#allaboutbirds.org#hu.wikipedia.org#g' todays_detections.php
sed -i 's/guide/wiki/g' todays_detections.php
sed -i 's/Confidence:/Megbízhatóság:/g' todays_detections.php
sed -i "s/Today's Detections/Mai észlelések/g" todays_detections.php
sed -i "s/Legacy view/Régi nézet/g" todays_detections.php
sed -i "s/Normal view/Normál nézet/g" todays_detections.php
sed -i "s/Search.../Keresés.../g" todays_detections.php
sed -i 's/No Detections For Today./Ma nem történt észlelés./g' todays_detections.php
sed -i 's#<a href="https://wikipedia.org/wiki/<?php echo $sciname;?>"#<a href="https://hu.wikipedia.org/wiki/<?php echo $comname;?>"#g' todays_detections.php
#
# stats.php - Best recordings
sed -i 's/Choose a species to load images from Wikimedia Commons/Válasszon egy fajt a képek betöltéséhez a Wikimedia Commons-ból/g' stats.php
sed -i 's/Occurrences:/Előfordulások:/g' stats.php
sed -i 's/Max Confidence:/Max. megbízhatóság:/g' stats.php
sed -i 's/Best Recording:/Legjobb felvétel:/g' stats.php
sed -i 's#allaboutbirds.org#hu.wikipedia.org#g' stats.php
sed -i 's/guide/wiki/g' stats.php
sed -i 's/All About Birds/Wikipedia/g' stats.php
sed -i 's/Sort by alphabetical/Betűrend szerinti rendezés/g' stats.php
sed -i 's/Sort by occurrences/Előfordulás szerinti rendezés/g' stats.php
sed -i 's#//wikipedia\.org/wiki/\$sciname#//hu\.wikipedia\.org/wiki/\$comname#g' stats.php
sed -i 's/Sort by confidence/Megbízhatóság szerinti rendezés/g' stats.php
#
# history.php - Daily graphs
sed -i 's/>Submit Date</>Dátum küldése</g' history.php
sed -i 's/Total Detections For The Day/Összes észlelés a nap folyamán/g' history.php
sed -i 's/No Charts for/Nincs grafikon ehhez:/g' history.php
#
# play.php - Recordings
sed -i 's/Sort by date/Rendezés dátum szerint/g' play.php
sed -i 's/Sort by confidence/Rendezés megbízhatóság szerint/g' play.php
sed -i 's/>By Species</>Faj szerint</g' play.php
sed -i 's/>By Date</>Dátum szerint</g' play.php
sed -i 's/This file is not delete protected./Ez a fájl nem védett a törlés ellen./g' play.php
sed -i 's/Unable to open file!/Fájl megnyitása sikertelen!/g' play.php
sed -i 's/This file is delete protected./Ez a fájl védett a törlés ellen./g' play.php
sed -i 's/No recordings were found./Nem találhatók felvételek./g' play.php
sed -i 's/Only Show Purge Excluded/Csak a törlésből kizártak megjelenítése/g' play.php
sed -i 's/Delete Detection/Észlelés törlése/g' play.php
sed -i 's/"Today"/"Ma"/g' play.php
sed -i 's#wikipedia\.org/wiki/\$sciname#hu\.wikipedia\.org/wiki/\$sciname#g' play.php
sed -i 's#Change Detection#Észlelés módosítása#g' play.php
#
# spectrogram.php - Spectrogram
sed -i 's/Gain:/Erősítés:/g' spectrogram.php
sed -i 's/Compression:/Tömörítés:/g' spectrogram.php
sed -i 's/Freq shift:/Frekvencia eltolás:/g' spectrogram.php
#
# daily_plot.py - Graph script
sed -i 's#\(xlabel="Detections"\)#xlabel="Észlelések"#g' daily_plot.py
sed -i 's#\(xlabel="Hour of Day"\)#xlabel="Óra"#g' daily_plot.py
sed -i "s#plot_type = 'All'#plot_type = 'Összes'#g" daily_plot.py
sed -i 's#{readings} Last Updated:#{readings} Utoljára frissítve:#g' daily_plot.py
#
# plotly_streamlit.py - Species statistics
sed -i 's/Single Day View/Egynapos nézet/g' plotly_streamlit.py
sed -i 's/Resample Resolution/Felbontás módosítása/g' plotly_streamlit.py
sed -i 's/Raw/Eredeti/g' plotly_streamlit.py
sed -i 's/15 minutes/15 perc/g' plotly_streamlit.py
sed -i 's/Hourly/Óránkénti/g' plotly_streamlit.py
sed -i 's/DAILY/NAPI/g' plotly_streamlit.py
sed -i 's/Species in Date Range/Fajok a dátumtartományban/g' plotly_streamlit.py
sed -i 's/Total Detect:/Összes észlelés:/g' plotly_streamlit.py
sed -i 's/Download plot as a png/Grafikon letöltése PNG-ként/g' plotly_streamlit.py
sed -i 's/Zoom/Nagyítás/g' plotly_streamlit.py
sed -i 's/Pan/Eltolás/g' plotly_streamlit.py
sed -i 's/Auto scale/Automatikus skálázás/g' plotly_streamlit.py
sed -i 's/Reset views/Nézet alaphelyzetbe állítása/g' plotly_streamlit.py
sed -i 's/Confidence Max:/Max. megbízhatóság:/g' plotly_streamlit.py
sed -i 's/Reviewed/Ellenőrizve/g' plotly_streamlit.py
sed -i 's/Available recordings/Elérhető felvételek/g' plotly_streamlit.py
sed -i 's/View fullscreen/Teljes képernyő/g' plotly_streamlit.py
sed -i 's/RUNNING.../FUTÁS.../g' plotly_streamlit.py
sed -i 's/Please wait.../Kérjük, várjon.../g' plotly_streamlit.py
sed -i 's/Date to View/Megtekintendő dátum/g' plotly_streamlit.py
sed -i 's/Species in/Fajok itt:/g' plotly_streamlit.py
sed -i 's/RECORDING NOT AVAILABLE :(/A FELVÉTEL NEM ÉRHETŐ EL :(/g' plotly_streamlit.py
sed -i 's/Date Range/Dátumtartomány/g' plotly_streamlit.py
sed -i 's/Alla/Összes/g' plotly_streamlit.py
#
# links.php - Links
sed -i 's/Program-related links/Programmal kapcsolatos linkek/g' links.php
sed -i 's/Program source/Forráskód/g' links.php
sed -i 's/Wiki help page/Wiki súgó/g' links.php
sed -i 's/Questions and answers about BirdNET-Pi (English)/Kérdések és válaszok a BirdNET-Pi-ről (Angol)/g' links.php
sed -i 's/Own links/Saját linkek/g' links.php
sed -i 's/Other BirdNET-Pi/Egyéb BirdNET-Pi/g' links.php
#
# weekly_report.php - Weekly report
sed -i 's/Report week/Jelentési hét/g' weekly_report.php
sed -i 's/Top 10 Species/Top 10 faj/g' weekly_report.php
sed -i 's/Species Detected for the First Time/Először észlelt fajok/g' weekly_report.php
sed -i 's/No new species were seen this week/Ezen a héten nem történt új faj észlelése/g' weekly_report.php
sed -i 's/percentages are calculated relative to week/a százalékok a héthez viszonyítva értendők/g' weekly_report.php