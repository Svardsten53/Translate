#!/bin/bash
#
# This script replaces selected text in files with Finnish text.
#
# If you want to make your own changes to the text, you can do so by copying one of the existing sed commands and changing the text in it. Note that the character '/' is a delimiter for the different parts of the command and that the same character must not exist in the text to be found or pasted. If this is the case, '/' can be replaced with, for example, '$'.
# translate.sh can be run any number of times as only the strings that have not already been changed will be changed.
#
# Updated 2025-12-29 /L-Å
#
# Positions correctly in the file structure
alias homepage="cd /home/userid-att-ändra/BirdNET-Pi/"
cd /home/userid-att-ändra/BirdNET-Pi/homepage
#
# index.php - Home page (NOTE!!! In the first line, the text "enter-your-city-or-place-here" must be changed before the script is run.
sed -i 's/ort-eller-plats/Kirjoita-kaupunkisi-tai-paikkasi-tähän/g' index.php
sed -i 's/You cannot listen to the live audio stream/Et voi kuunnella suoraa äänivirtaa/g' index.php
sed -i 's/>Live Audio</>Live-ääni</g' index.php
#
# views.php - Menu bar
sed -i "/<button type=\"submit\" name=\"view\" value=\"Recordings\" form=\"views\">Recordings<\/button>/a <button type=\"submit\" name=\"view\" value=\"Links\" form=\"views\">Links<\/button>" views.php
sed -i "/if(\$_GET\['view'\] == \"Daily Charts\"){include('history.php');}/a if(\$_GET['view'] == \"Links\"){include('scripts/links.php');}" views.php
sed -i "/if(\$_GET\['view'\] == \"Links\"){include('scripts\/links.php');}/a if(\$_GET['view'] == \"QA\"){include('scripts/qa.php');}" views.php
sed -i 's/>Overview</>Yleiskatsaus</g' views.php
sed -i "s/>Today's Detections</>Tämän päivän havainnot</g" views.php
sed -i 's/>Best Recordings</>Parhaat nauhoitukset</g' views.php
sed -i 's/>Species Stats</>Lajitilastot</g' views.php
sed -i 's/>Daily Charts</>Päivittäiset kaaviot</g' views.php
sed -i 's/>Recordings</>Nauhoitukset</g' views.php
sed -i 's/>Spectrogram</>Spektrogrammi</g' views.php
sed -i 's/>View Log</>Näytä loki</g' views.php
sed -i 's/>Tools</>Työkalut</g' views.php
sed -i 's/>Weekly Report</>Viikkoraportti</g' views.php
sed -i 's/>Links</>Linkit</g' views.php
sed -i 's/You cannot edit the settings for this installation/Et voi muokata tämän asennuksen asetuksia/g' views.php
sed -i 's/<div class="views">n/<div class="views"><br>/g' views.php
sed -i 's/WARNING: Your latitude and longitude are not set properly. Please do so now in Tools -> Settings./VAROITUS: Leveys- ja pituusasteitasi ei ole asetettu oikein. Tee se nyt Työkalut -> Asetukset./g' views.php
sed -i 's/WARNING: Your latitude is not set properly. Please do so now in Tools -> Settings./VAROITUS: Leveysasteesi ei ole asetettu oikein. Tee se nyt Työkalut -> Asetukset./g' views.php
sed -i 's/WARNING: Your longitude is not set properly. Please do so now in Tools -> Settings./VAROITUS: Pituusasteesi ei ole asetettu oikein. Tee se nyt Työkalut -> Asetukset./g' views.php
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
sed -i 's/>Total</>Yhteensä</g' overview.php
sed -i 's/>Today</>Tänään</g' overview.php
sed -i 's/>Last Hour</>Viime tunti</g' overview.php
sed -i 's/>Species Detected Today</>Tänään havaitut lajit</g' overview.php
sed -i 's/>Total Number of Species</>Lajien kokonaismäärä</g' overview.php
sed -i 's/<h3>Most Recent Detection:/<br><h3>Viimeisin havainto:/g' overview.php
sed -i 's/<h3>Currently Analyzing/<br><br><h3>Analysoidaan parhaillaan/g' overview.php
sed -i 's/Confidence:/Luottamus:/g' overview.php
sed -i 's/Database is busy/Tietokanta on varattu/g' overview.php
sed -i 's/5 Most Recent Detections/5 viimeisintä havaintoa/g' overview.php
sed -i 's/Loading.../Ladataan.../g' overview.php
sed -i 's/Open in new tab/Avaa uudessa välilehdessä/g' overview.php
sed -i '0,/<style>/{s/<style>/<style> a:link { color: blue; } a:visited { color: blue; } a:active { color: blue; }/}' overview.php
sed -i 's/No Detections For Today./Ei havaintoja tänään./g' overview.php
sed -i 's/View species stats/Näytä lajitilastot/g' overview.php
sed -i 's/Detections Over 30d/Havainnot yli 30 päivän ajan/g' overview.php
sed -i 's/>Close</>Sulje</g' overview.php
sed -i 's/Are you sure you want to blacklist this image?/Oletko varma, että haluat asettaa tämän kuvan mustalle listalle?/g' overview.php
sed -i 's/Blacklist this image/Aseta kuva mustalle listalle/g' overview.php
sed -i 's/Your system is currently processing a backlog of audio. This can take several hours before normal functionality of your BirdNET-Pi resumes./Järjestelmäsi käsittelee parhaillaan äänien ruuhkaa. Tämä voi kestää useita tunteja, ennen kuin BirdNET-Pi:n normaali toiminnallisuus jatkuu./g' overview.php
sed -i 's#<a href="https://wikipedia.org/wiki/<?php echo $sciname;?>"#<a href="https://fi.wikipedia.org/wiki/<?php echo $comname;?>"#g' overview.php
sed -i 's#<a href="https://wikipedia.org/wiki/<?php echo $sciname; ?>"#<a href="https://fi.wikipedia.org/wiki/<?php echo $comname;?>"#g' overview.php
sed -i 's/Species Today/Lajit tänään/g' overview.php
sed -i 's/Species Total/Lajit yhteensä/g' overview.php
sed -i 's/New Species/Uudet lajit/g' overview.php
sed -i 's/Rare Species/Harvinaiset lajit/g' overview.php
sed -i 's/detected today!/havaittu tänään!/g' overview.php
sed -i 's/Max confidence/Maks luottamus/g' overview.php
sed -i 's/First detection/Ensimmäinen havainto/g' overview.php
sed -i 's/Last seen/Viimeksi nähty/g' overview.php
sed -i 's/mo ago/ kk sitten/g' overview.php
sed -i 's/d ago/ pv sitten/g' overview.php
sed -i "s/'Detections Over ' + days + 'd'/'Havainnot yli ' + days + ' päivän' /g" overview.php
sed -i "s/Open Today's recordings page/Avaa tämän päivän nauhoitussivu/g" overview.php
#
# todays_detections.php - Today's finds
sed -i 's/>Number of Detections</>Havaintojen määrä</g' todays_detections.php
sed -i 's/>Total</>Yhteensä</g' todays_detections.php
sed -i 's/>Today</>Tänään</g' todays_detections.php
sed -i 's/>Last Hour</>Viime tunti</g' todays_detections.php
sed -i 's/>Unique Species Total</>Ainutlaatuiset lajit yhteensä</g' todays_detections.php
sed -i 's/>Unique Species Today</>Ainutlaatuiset lajit tänään</g' todays_detections.php
sed -i 's/>Load 40 More...</>Lataa 40 lisää...</g' todays_detections.php
sed -i 's#allaboutbirds.org#fi.wikipedia.org#g' todays_detections.php
sed -i 's/guide/wiki/g' todays_detections.php
sed -i 's/Confidence:/Luottamus:/g' todays_detections.php
sed -i "s/Today's Detections/Tämän päivän havainnot/g" todays_detections.php
sed -i "s/Legacy view/Perinteinen näkymä/g" todays_detections.php
sed -i "s/Normal view/Normaali näkymä/g" todays_detections.php
sed -i "s/Search.../Etsi.../g" todays_detections.php
sed -i "s/Loading.../Ladataan.../g" todays_detections.php
sed -i 's/Open in new tab/Avaa uudessa välilehdessä/g' todays_detections.php
sed -i 's/No Detections For Today./Ei havaintoja tänään./g' todays_detections.php
sed -i '0,/<style>/{s/<style>/<style> a:link { color: blue; } a:visited { color: blue; } a:active { color: blue; }/}' todays_detections.php
sed -i 's/View species stats/Näytä lajitilastot/g' todays_detections.php
sed -i 's/Detections Over 30d/Havainnot yli 30 päivän ajan/g' todays_detections.php
sed -i 's/>Close</>Sulje</g' todays_detections.php
sed -i 's/Are you sure you want to blacklist this image?/Oletko varma, että haluat asettaa tämän kuvan mustalle listalle?/g' todays_detections.php
sed -i 's/Blacklist this image/Aseta kuva mustalle listalle/g' todays_detections.php
sed -i 's/Delete Detection/Poista havainto/g' todays_detections.php
sed -i 's#<a href="https://wikipedia.org/wiki/<?php echo $sciname;?>"#<a href="https://fi.wikipedia.org/wiki/<?php echo $comname;?>"#g' todays_detections.php
sed -i 's/Species Total/Lajit yhteensä/g' todays_detections.php
sed -i 's/Species Today/Lajit tänään/g' todays_detections.php
#
# stats.php - Best recordings
sed -i 's/Choose a species to load images from Wikimedia Commons/Valitse laji ladata kuvia Wikimedia Commonsista/g' stats.php
sed -i 's/Occurrences:/Esiintymät:/g' stats.php
sed -i 's/Max Confidence:/Maks. luottamus:/g' stats.php
sed -i 's/Best Recording:/Paras nauhoitus:/g' stats.php
sed -i 's#allaboutbirds.org#fi.wikipedia.org#g' stats.php
sed -i 's/guide/wiki/g' stats.php
sed -i 's/All About Birds/Wikipedia/g' stats.php
sed -i 's/Loading Images from/Ladataan kuvia/g' stats.php
sed -i 's/Choose a species to load images from Flickr./Valitse laji ladata kuvia Flickr:stä./g' stats.php
sed -i 's/Best Recordings for Other Species:/Parhaat nauhoitukset muille lajeille:/g' stats.php
sed -i 's/Sort by alphabetical/Lajittele aakkosjärjestyksessä/g' stats.php
sed -i 's/Sort by occurrences/Lajittele esiintymien mukaan/g' stats.php
sed -i 's/Open in new tab/Avaa uudessa välilehdessä/g' stats.php
sed -i '0,/<style>/{s/<style>/<style> a:link { color: blue; } a:visited { color: blue; } a:active { color: blue; }/}' stats.php
sed -i 's#//wikipedia\.org/wiki/\$sciname#//fi\.wikipedia\.org/wiki/\$comname#g' stats.php
sed -i 's#wikipedia\.org/wiki/\$sciname#fi.wikipedia.org/wiki/\$comname#g' stats.php
sed -i 's/Sort by confidence/Lajittele luottamuksen mukaan/g' stats.php
#
# history.php - Daily graphs
sed -i 's/>Submit Date</>Lähetä päivämäärä</g' history.php
sed -i 's/Total Detections For The Day/Havaintojen kokonaismäärä päivälle/g' history.php
sed -i 's%echo "<img src=\"/Charts/$chart2?nocache=time()\">";%echo " ";%g' history.php
sed -i 's/No Charts for/Ei kaavioita/g' history.php
#
# play.php - Recordings
sed -i 's/Sort by date/Lajittele päivämäärän mukaan/g' play.php
sed -i 's/Sort by confidence/Lajittele luottamuksen mukaan/g' play.php
sed -i 's/>By Species</>Lajin mukaan</g' play.php
sed -i 's/>By Date</>Päivämäärän mukaan</g' play.php
sed -i 's/This file is not delete protected./Tämä tiedosto ei ole poistosuojattu./g' play.php
sed -i 's/This file is not delete protected./Tämä tiedosto ei ole poistosuojattu./g' play.php
sed -i 's/Unable to open file!/Tiedostoa ei voi avata!/g' play.php
sed -i 's/You must be authenticated to change the protection of files./Sinun täytyy olla todennettu muuttaaksesi tiedostojen suojausta./g' play.php
sed -i 's/This file is delete protected./Tämä tiedosto on poistosuojattu./g' play.php
sed -i 's/Sort by alphabetical/Lajittele aakkosjärjestyksessä/g' play.php
sed -i 's/Sort by occurrences/Lajittele esiintymien mukaan/g' play.php
sed -i 's/No recordings were found./Nauhoituksia ei löytynyt./g' play.php
sed -i 's/They may have been deleted to make space for new recordings. You can modify this setting for the future in Tools/Ne on ehkä poistettu tilan vapauttamiseksi uusille nauhoituksille. Voit muokata tätä asetusta tulevaisuudessa Työkalut-osiossa/g' play.php
sed -i 's/Only Show Purge Excluded/Näytä vain puhdistuksesta poissuljetut/g' play.php
sed -i 's/This file is not excluded from being purged./Tätä tiedostoa ei ole poissuljettu puhdistuksesta./g' play.php
sed -i 's/This file is excluded from being purged./Tämä tiedosto on poissuljettu puhdistuksesta./g' play.php
sed -i 's/They may have been deleted to make space for new recordings. You can prevent this from happening in the future by clicking the/Ne on ehkä poistettu tilan vapauttamiseksi uusille nauhoituksille. Voit estää tämän tapahtumasta tulevaisuudessa klikkaamalla kuvaketta/g' play.php
sed -i 's/ icon in the top right of a recording./ tallenteen oikeassa yläkulmassa./g' play.php
sed -i 's/You can also modify this behavior globally under /Voit myös muokata tätä käyttäytymistä maailmanlaajuisesti/g' play.php
sed -i 's/>here.</>täällä.</g' play.php
sed -i 's/Database is busy/Tietokanta on varattu/g' play.php
sed -i 's/Delete Detection/Poista havainto/g' play.php
sed -i 's/"Today"/"Tänään"/g' play.php
sed -i 's/This file has been shifted down in frequency./Tämän tiedoston taajuutta on siirretty alaspäin./g' play.php
sed -i 's/This file is not shifted in frequency./Tämän tiedoston taajuutta ei ole siirretty./g' play.php
sed -i 's/Sort by confidence/Lajittele luottamuksen mukaan/g' play.php
sed -i 's#wikipedia\.org/wiki/\$sciname#fi\.wikipedia\.org/wiki/\$sciname#g' play.php
sed -i 's#Change Detection#Muuta havaintoa#g' play.php
sed -i 's#This file will be deleted when disk space needs to be freed.#Tämä tiedosto poistetaan, kun levytilaa tarvitsee vapauttaa.#g' play.php
sed -i 's#\(>95% usage\)\.# (>95% käyttö).#g' play.php
#
# spectrogram.php - Spectrogram
sed -i 's/Gain:/Vahvistus:/g' spectrogram.php
sed -i 's/Loading.../Ladataan.../g' spectrogram.php
sed -i 's/Compression:/Pakkaus:/g' spectrogram.php
sed -i 's/Freq shift:/Taajuussiirto:/g' spectrogram.php
#
# daily_plot.py - Graph
sed -i 's#\(xlabel="Detections"\)#xlabel="Havainnot"#g' daily_plot.py
sed -i 's#\(xlabel="Hour of Day"\)#xlabel="Kellonaika"#g' daily_plot.py
sed -i "s#plot_type = 'All'#plot_type = 'Kaikki'#g" daily_plot.py
sed -i 's#{readings} Last Updated:#{readings} Viimeksi päivitetty:#g' daily_plot.py
#
# plotly_streamlit.py - Species statistics
sed -i 's/Single Day View/Yhden päivän näkymä/g' plotly_streamlit.py
sed -i 's/Resample Resolution/Uudelleen näytteenoton resoluutio/g' plotly_streamlit.py
sed -i 's/Select resolution for species - DAILY provides time series/Valitse resoluutio lajeille - PÄIVITTÄINEN tarjoaa aikasarjoja/g' plotly_streamlit.py
sed -i 's/Select start and end date, if same date get a clockplot for a single day/Valitse alku- ja loppupäivämäärä, jos sama päivämäärä, saat kellokaavion yhdelle päivälle/g' plotly_streamlit.py
sed -i 's/Select if you want single day view, unselect for multi-day views/Valitse, jos haluat yhden päivän näkymän, poista valinta usean päivän näkymille/g' plotly_streamlit.py
sed -i 's/Raw/Raaka/g' plotly_streamlit.py
sed -i 's/15 minutes/15 minuuttia/g' plotly_streamlit.py
sed -i 's/Hourly/Tunnittain/g' plotly_streamlit.py
sed -i 's/DAILY/PÄIVITTÄINEN/g' plotly_streamlit.py
sed -i 's/Which bird would you like to explore for the dates/Mitä lintua haluaisit tutkia päivämäärille/g' plotly_streamlit.py
sed -i 's/Species in Date Range/Lajit päivämääräalueella/g' plotly_streamlit.py
sed -i "s/' to '/' - '/g" plotly_streamlit.py
sed -i 's/Total Detect:/Yhteensä havaittu:/g' plotly_streamlit.py
sed -i 's/Download plot as a png/Lataa kaavio png-tiedostona/g' plotly_streamlit.py
sed -i 's/Zoom/Zoomaa/g' plotly_streamlit.py
sed -i 's/Pan/Panoroi/g' plotly_streamlit.py
sed -i 's/Box Select/Valitse laatikolla/g' plotly_streamlit.py
sed -i 's/Lasso Select/Valitse lassolla/g' plotly_streamlit.py
sed -i 's/Zoom in/Zoomaa sisään/g' plotly_streamlit.py
sed -i 's/Zoom out/Zoomaa ulos/g' plotly_streamlit.py
sed -i 's/Auto scale/Automaattinen skaalaus/g' plotly_streamlit.py
sed -i 's/Reset views/Palauta näkymät/g' plotly_streamlit.py
sed -i 's/Produces with Plotly/Tuotettu Plotlyn avulla/g' plotly_streamlit.py
sed -i 's/Confidence Max:/Maks. luottamus:/g' plotly_streamlit.py
sed -i 's/Reviewed/Tarkistettu/g' plotly_streamlit.py
sed -i 's/Available recordings/Saatavilla olevat tallenteet/g' plotly_streamlit.py
sed -i 's/View fullscreen/Näytä koko näytöllä/g' plotly_streamlit.py
sed -i 's/Made with Streamlit/Tehty Streamlitin avulla/g' plotly_streamlit.py
sed -i 's/RUNNING.../KÄYNNISSÄ.../g' plotly_streamlit.py
sed -i 's/Please wait.../Odota hetki.../g' plotly_streamlit.py
sed -i 's/Date to View/Näytettävä päivämäärä/g' plotly_streamlit.py
sed -i 's/Select Number of Birds to Show/Valitse näytettävien lintujen määrä/g' plotly_streamlit.py
sed -i 's/sampling interval./näytteenottoväli./g' plotly_streamlit.py
sed -i 's/<br>for/<br>varten/g' plotly_streamlit.py
sed -i 's/Species in/Lajit/g' plotly_streamlit.py
sed -i 's/Max:/Maks:/g' plotly_streamlit.py
sed -i 's/Median:/Mediaani:/g' plotly_streamlit.py
sed -i 's/RECORDING NOT AVAILABLE :(/NAUHOITUS EI SAATAVILLA :(/g' plotly_streamlit.py
sed -i 's/Date Range/Päivämääräalue/g' plotly_streamlit.py
sed -i 's/Select Color Pallet for Daily Detections/Valitse väripaletti päivittäisille havainnoille/g' plotly_streamlit.py
sed -i 's/Alla/Kaikki/g' plotly_streamlit.py
sed -i "s/'<b>Top'/<b>Suosituimmat'/g" plotly_streamlit.py
sed -i "s/' Species For '/' lajia /g" plotly_streamlit.py
sed -i "s/ '<b>Daily ' + str(start_date) + ' Detections on ' + resample_sel + ' interval</ '<b>Päivittäiset ' + str(start_date) + ' havainnot ' + resample_sel + ' välillä</g" plotly_streamlit.py
sed -i "s/subplot_titles=('<b>Top ' +/subplot_titles=('<b>Suosituimmat ' +/g" plotly_streamlit.py
sed -i "s/+ str(top_N) + /+ str(top_N) + ','+ /g" plotly_streamlit.py
#
# config.php - Settings
sed -i 's/mailto:tim@birdweather.com/mailto:birdnetpi@birdweather.com/g' config.php
#
# links.php - Links
sed -i 's/Program-related links/Ohjelmaan liittyvät linkit/g' links.php
sed -i 's/Program source/Ohjelmalähde/g' links.php
sed -i 's/Wiki help page/Wiki-ohjesivu/g' links.php
sed -i 's/Questions and answers about BirdNET-Pi (English)/Kysymyksiä ja vastauksia BirdNET-Pi:stä (englanniksi)/g' links.php
sed -i 's/Own links/Omat linkit/g' links.php
sed -i 's/Other BirdNET-Pi/Muut BirdNET-Pi/g' links.php
sed -i 's/Please email if you have any questions or would like to do your own installation/Lähetä sähköpostia, jos sinulla on kysyttävää tai haluat tehdä oman asennuksen/g' links.php
#
# weekly_report.php - Weekly report
sed -i 's/Report week/Raportin viikko/g' weekly_report.php
sed -i 's/Top 10 Species/Suosituimmat 10 lajia/g' weekly_report.php
sed -i 's/Species Detected for the First Time/Lajit havaittu ensimmäistä kertaa/g' weekly_report.php
sed -i 's/No new species were seen this week/Tällä viikolla ei nähty uusia lajeja/g' weekly_report.php
sed -i 's/percentages are calculated relative to week/prosenttiosuudet lasketaan suhteessa viikkoon/g' weekly_report.php