#!/bin/bash
#
# This script replaces selected text in files with Slovenian text.
#
# If you want to make your own changes to the text, you can do so by copying one of the existing sed commands and changing the text in it. Note that the character '/' is a delimiter for the different parts of the command and that the same character must not exist in the text to be found or pasted. If this is the case, '/' can be replaced with, for example, '$'.
# translate.sh can be run any number of times as only the strings that have not already been changed will be changed.
#
# (Slovene)
# Ta skript zamenja izbrano besedilo v datotekah s slovenskim besedilom.
#
# Če želite narediti lastne spremembe besedila, lahko to storite tako, da kopirate enega od obstoječih ukazov sed in spremenite besedilo v njem. Upoštevajte, da je znak '/' ločilo za različne dele ukaza in da isti znak ne sme obstajati v besedilu, ki ga želite najti ali prilepiti. Če je temu tako, lahko '/' zamenjate z, na primer, '$'.
# Skript translate.sh lahko zaženete kolikorkrat želite, saj se bodo spremenili le nizi, ki še niso bili spremenjeni.
#
# Updated 2025-10-12 /L-Å
#
# Positions correctly in the file structure
alias homepage="cd /home/userid-att-ändra/BirdNET-Pi/"
cd /home/userid-att-ändra/BirdNET-Pi/homepage
#
# index.php - Home page (NOTE!!! In the first line, the text "enter-your-city-or-place-here" must be changed before the script is run.
sed -i 's/ort-eller-plats/Tukaj-vnesi-svoje-mesto-ali-kraj/g' index.php
sed -i 's/You cannot listen to the live audio stream/Prenosa v živo, ne morate poslušati/g' index.php
sed -i 's/>Live Audio</>Zvok v živo</g' index.php
#
# views.php - Menu bar
sed -i 's/>Overview</>Pregled</g' views.php
sed -i "s/>Today's Detections</>Današnje zaznave</g" views.php
sed -i 's/>Best Recordings</>Najboljši posnetki</g' views.php
sed -i 's/>Species Stats</>Statistika vrst</g' views.php
sed -i 's/>Daily Charts</>Dnevni grafikon</g' views.php
sed -i 's/>Recordings</>Posnetki</g' views.php
sed -i 's/>Spectrogram</>Spektrogram</g' views.php
sed -i 's/>View Log</>Preglej dnevnik</g' views.php
sed -i 's/>Tools</>Orodja</g' views.php
sed -i 's/>Weekly Report</>Tedensko poročilo</g' views.php
sed -i 's/>Links</>Povezave</g' views.php
sed -i 's/You cannot edit the settings for this installation/Nastavitev za to namestitev ne morete urejati/g' views.php
sed -i 's/<div class="views">n/<div class="views"><br>/g' views.php
sed -i 's/WARNING: Your latitude and longitude are not set properly. Please do so now in Tools -> Settings./OPOZORILO: Vaša zemljepisna širina in dolžina nista pravilno nastavljeni. Nastavite ju pod Orodja -> Nastavitve./g' views.php
sed -i 's/WARNING: Your latitude is not set properly. Please do so now in Tools -> Settings./OPOZORILO: Vaša zemljepisna širina ni pravilno nastavljena. Nastavite jo pod Orodja -> Nastavitve./g' views.php
sed -i 's/WARNING: Your longitude is not set properly. Please do so now in Tools -> Settings./OPOZORILO: Vaša zemljepisna dolžina ni pravilno nastavljena. Nastavite jo pod Orodja -> Nastavitve.//g' views.php
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
sed -i 's/>Total</>Skupno</g' overview.php
sed -i 's/>Today</>Danes</g' overview.php
sed -i 's/>Last Hour</>Zadnjo uro</g' overview.php
sed -i 's/>Species Detected Today</>Danes zaznane vrste</g' overview.php
sed -i 's/>Total Number of Species</>Število vseh vrst skupaj</g' overview.php
sed -i 's/<h3>Most Recent Detection:/<br><h3>Najnovejše zaznavanje:/g' overview.php
sed -i 's/<h3>Currently Analyzing/<br><br><h3>Trenutno analiziram/g' overview.php
# sed -i '$s/<script>/<br><script>/g' overview.php
sed -i 's/Confidence:/Raven zanesljivosti:/g' overview.php
sed -i 's/Database is busy/Zbirka podatkov je zasedena/g' overview.php
sed -i 's/5 Most Recent Detections/Zadnjih 5 zaznavanj/g' overview.php
sed -i 's/Loading.../Nalagam.../g' overview.php
sed -i 's/Open in new tab/Odpri v novem zavihku/g' overview.php
sed -i '0,/<style>/{s/<style>/<style> a:link { color: blue; } a:visited { color: blue; } a:active { color: blue; }/}' overview.php
sed -i 's/No Detections For Today./Za danes ni bilo zaznavanj./g' overview.php
sed -i 's/View species stats/Ogled statistike vrste/g' overview.php
sed -i 's/Detections Over 30d/Zaznave v zadnjih 30 dneh/g' overview.php
sed -i 's/>Close</>Zapri</g' overview.php
sed -i 's/Are you sure you want to blacklist this image?/Ali ste prepričani, da želite to sliko postaviti na seznam nezaželjenih?/g' overview.php
sed -i 's/Blacklist this image/Dodaj to sliko na seznam nezaželjenih/g' overview.php
sed -i 's/Your system is currently processing a backlog of audio. This can take several hours before normal functionality of your BirdNET-Pi resumes./Vaš sistem trenutno obdeluje zaostale zvočne datoteke. To lahko traja več ur, preden se BirdNET-Pi vrne nazaj v normalno delovanje./g' overview.php
sed -i 's#<a href="https://wikipedia.org/wiki/<?php echo $sciname;?>"#<a href="https://sl.wikipedia.org/wiki/<?php echo $comname;?>"#g' overview.php
sed -i 's#<a href="https://wikipedia.org/wiki/<?php echo $sciname; ?>"#<a href="https://sl.wikipedia.org/wiki/<?php echo $comname;?>"#g' overview.php
sed -i 's/Species Today/Današnje vrste/g' overview.php
sed -i 's/Species Total/Skupno št. vrst/g' overview.php
sed -i 's/New Species/Nove vrste/g' overview.php
sed -i 's/Rare Species/Redke vrste/g' overview.php
sed -i 's/detected today!/Zaznano danes!/g' overview.php
sed -i 's/Max confidence/Max zanesljivost/g' overview.php
sed -i 's/First detection/Prva zaznava/g' overview.php
sed -i 's/Last seen/Nazadnje slišano/g' overview.php
sed -i 's/mo ago/ mesecev nazaj/g' overview.php
sed -i 's/d ago/ dni nazaj/g' overview.php
sed -i "s/'Detections Over ' + days + 'd'/'Zaznave v zadnjih ' + days + ' dni'/g" overview.php
sed -i "s/Open Today's recordings page/Odpri stran z današnjimi posnetki/g" overview.php
#
# todays_detections.php - Today's finds
sed -i 's/>Number of Detections</>Število zaznav</g' todays_detections.php
sed -i 's/>Total</>Skupaj</g' todays_detections.php
sed -i 's/>Today</>Danes</g' todays_detections.php
sed -i 's/>Last Hour</>Zadnjo uro</g' todays_detections.php
sed -i 's/>Unique Species Total</>Skupno št. edinstvenih vrst</g' todays_detections.php
sed -i 's/>Unique Species Today</>Število Edinstvenih vrst danes</g' todays_detections.php
sed -i 's/>Load 40 More...</>Naloži še 40...</g' todays_detections.php
sed -i 's#allaboutbirds.org#sl.wikipedia.org#g' todays_detections.php
sed -i 's/guide/wiki/g' todays_detections.php
sed -i 's/Confidence:/Zanesljivost:/g' todays_detections.php
sed -i "s/Today's Detections/Današnje zaznave/g" todays_detections.php
sed -i "s/Legacy view/Star izgled/g" todays_detections.php
sed -i "s/Normal view/Običajen izgled/g" todays_detections.php
sed -i "s/Search.../Išči.../g" todays_detections.php
sed -i "s/Loading.../Nalagam.../g" todays_detections.php
sed -i 's/Open in new tab/Odpri v novem zavihku/g' todays_detections.php
sed -i 's/No Detections For Today./Danes ni zaznav./g' todays_detections.php
sed -i '0,/<style>/{s/<style>/<style> a:link { color: blue; } a:visited { color: blue; } a:active { color: blue; }/}' todays_detections.php
sed -i 's/View species stats/Ogled statistike vrst/g' todays_detections.php
sed -i 's/Detections Over 30d/Zaznave v zadnjih 30 dneh/g' todays_detections.php
sed -i 's/>Close</>Zapri</g' todays_detections.php
sed -i 's/Are you sure you want to blacklist this image?/Ali ste prepričani, da želite to sliko postaviti na seznam nezaželjenih?/g' todays_detections.php
sed -i 's/Blacklist this image/Dodaj to sliko na seznam nezaželjenih/g' todays_detections.php
sed -i 's/Delete Detection/Izbriši zaznavo/g' todays_detections.php
sed -i 's#<a href="https://wikipedia.org/wiki/<?php echo $sciname;?>"#<a href="https://sl.wikipedia.org/wiki/<?php echo $comname;?>"#g' todays_detections.php
sed -i 's/Species Total/Skupno št. vrst/g' todays_detections.php
sed -i 's/Species Today/Število vrst danes/g' todays_detections.php
#
# stats.php - Best recordings
sed -i 's/Choose a species to load images from Wikimedia Commons/Izberite vrsto za prikaz slik iz Wikimedia Commons/g' stats.php
sed -i 's/Occurrences:/Prisotnosti:/g' stats.php
sed -i 's/Max Confidence:/Max zanesljivost:/g' stats.php
sed -i 's/Best Recording:/Najboljši posnetki:/g' stats.php
sed -i 's#allaboutbirds.org#sl.wikipedia.org#g' stats.php
sed -i 's/guide/wiki/g' stats.php
sed -i 's/All About Birds/Wikipedia/g' stats.php
sed -i 's/Loading Images from/Naloži slike iz/g' stats.php
sed -i 's/Choose a species to load images from Flickr./Izberite vrsto za nalaganje slik iz Flickr-ja./g' stats.php
sed -i 's/Best Recordings for Other Species:/Najboljši posnetki za ostale vrste:/g' stats.php
sed -i 's/Sort by alphabetical/Razvrsti po abecedi/g' stats.php
sed -i 's/Sort by occurrences/Razvrsti po prisotnosti/g' stats.php
sed -i 's/Open in new tab/Odpri v novem zavihku/g' stats.php
sed -i '0,/<style>/{s/<style>/<style> a:link { color: blue; } a:visited { color: blue; } a:active { color: blue; }/}' stats.php
sed -i 's#//wikipedia\.org/wiki/\$sciname#//sl\.wikipedia\.org/wiki/\$comname#g' stats.php
sed -i 's#wikipedia\.org/wiki/\$sciname#sl.wikipedia.org/wiki/\$comname#g' stats.php
sed -i 's/Sort by confidence/Razvrsti po zanesljivosti/g' stats.php
#
# history.php - Daily graphs
sed -i 's/>Submit Date</>Vnesi datum</g' history.php
sed -i 's/Total Detections For The Day/Skupno št. zaznav danes/g' history.php
sed -i 's%echo "<img src=\"/Charts/$chart2?nocache=time()\">";%echo " ";%g' history.php
sed -i 's/No Charts for/Brez grafikonov za/g' history.php
#
# play.php - Recordings
sed -i 's/Sort by date/Razvrsti po datumu/g' play.php
sed -i 's/Sort by confidence/Razvrsti po zanesljivosti/g' play.php
sed -i 's/>By Species</>Po vrsti</g' play.php
sed -i 's/>By Date</>Po datumu</g' play.php
sed -i 's/This file is not delete protected./Ta datoteka ni zaščitena pred izbrisom./g' play.php
sed -i 's/This file is not delete protected./Ta datoteka ni zaščitena pred izbrisom./g' play.php
sed -i 's/Unable to open file!/Datoteke ni mogoče odpreti!/g' play.php
sed -i 's/You must be authenticated to change the protection of files./Za spremembo zaščite datotek morate biti prijavljeni./g' play.php
sed -i 's/This file is delete protected./Ta datoteka je zaščitena pred izbrisom./g' play.php
sed -i 's/Sort by alphabetical/Razvrsti po Abecedi/g' play.php
sed -i 's/Sort by occurrences/Razvrsti po prisotnosti/g' play.php
sed -i 's/No recordings were found./Ni najdenih posnetkov./g' play.php
sed -i 's/They may have been deleted to make space for new recordings. You can modify this setting for the future in Tools/Morda so bili izbrisani za več prostora za nove posnetke. To nastavitev lahko za prihodnje prilagodite v Orodja/g' play.php
sed -i 's/Only Show Purge Excluded/Prikaži le izključene iz brisanja/g' play.php
sed -i 's/This file is not excluded from being purged./Ta datoteka ni izključena iz brisanja./g' play.php
sed -i 's/This file is excluded from being purged./Ta datoteka je zaščitena pred izbrisom./g' play.php
sed -i 's/They may have been deleted to make space for new recordings. You can prevent this from happening in the future by clicking the/Morda so bili izbrisani, da se naredi prostor za nove posnetke. V prihodnje lahko to preprečite tako, da kliknete na ikono/g' play.php
sed -i 's/ icon in the top right of a recording./ v zgornjem desnem kotu posnetka./g' play.php
sed -i 's/You can also modify this behavior globally under /To vedenje lahko spremenite tudi globalno pod/g' play.php
sed -i 's/>here.</>tukaj.</g' play.php
sed -i 's/Database is busy/Podatkovna zbirka je zasedena/g' play.php
sed -i 's/Delete Detection/Izbriši zaznavo/g' play.php
sed -i 's/"Today"/"Danes"/g' play.php
sed -i 's/This file has been shifted down in frequency./Ta datoteka je bila premaknjena navzdol v frekvenci./g' play.php
sed -i 's/This file is not shifted in frequency./Ta datoteka ni bila spremenjena v frekvenci./g' play.php
sed -i 's/Sort by confidence/Razvrsti po zanesljivosti/g' play.php
sed -i 's#wikipedia\.org/wiki/\$sciname#sl\.wikipedia\.org/wiki/\$sciname#g' play.php
sed -i 's#Change Detection#Spremeni zaznavanje#g' play.php
sed -i 's#This file will be deleted when disk space needs to be freed.#Ta datoteka bo izbrisana, ko bo potrebno narediti prostor na disku.#g' play.php
sed -i 's#\(>95% usage\)\.# (>95% zasedeno).#g' play.php
#
# spectrogram.php - Spectrogram
sed -i 's/Gain:/Ojačitev:/g' spectrogram.php
sed -i 's/Loading.../Nalagam.../g' spectrogram.php
sed -i 's/Compression:/Stiskanje:/g' spectrogram.php
sed -i 's/Freq shift:/Frekvenčni zamik:/g' spectrogram.php
#
# daily_plot.py - Graph
sed -i 's#\(xlabel="Detections"\)#xlabel="Zaznave"#g' daily_plot.py
sed -i 's#\(xlabel="Hour of Day"\)#xlabel="Ure dneva"#g' daily_plot.py
sed -i "s#plot_type = 'All'#plot_type = 'Vse'#g" daily_plot.py
sed -i 's#{readings} Last Updated:#{readings} Nazadnje posodobljeno:#g' daily_plot.py
#
# plotly_streamlit.py - Species statistics
sed -i 's/Single Day View/Pogled za en dan/g' plotly_streamlit.py
sed -i 's/Resample Resolution/Ločljivost vzorčenja/g' plotly_streamlit.py
sed -i 's/Select resolution for species - DAILY provides time series/Izberite ločljivost za vrste - DNEVNA časovnica/g' plotly_streamlit.py
sed -i 's/Select start and end date, if same date get a clockplot for a single day/Izberite začetni in končni datum; če sta enaka, dobite graf za en sam dan/g' plotly_streamlit.py
sed -i 's/Select if you want single day view, unselect for multi-day views/Izberite za enodnevni pogled, počistite za večdnevni pogled/g' plotly_streamlit.py
sed -i 's/Raw/Neobdelani podatki/g' plotly_streamlit.py
sed -i 's/15 minutes/15 Minut/g' plotly_streamlit.py
sed -i 's/Hourly/Urni/g' plotly_streamlit.py
sed -i 's/DAILY/DNEVNI/g' plotly_streamlit.py
sed -i 's/Which bird would you like to explore for the dates/Izberite za enodnevni pogled, počistite za večdnevni pogled/g' plotly_streamlit.py
sed -i 's/Species in Date Range/Vrste v izbranem obdobju/g' plotly_streamlit.py
sed -i "s/' to '/' - '/g" plotly_streamlit.py
sed -i 's/Total Detect:/Skupno zaznav:/g' plotly_streamlit.py
sed -i 's/Download plot as a png/Prenesi graf kot PNG/g' plotly_streamlit.py
sed -i 's/Zoom/Povečava/g' plotly_streamlit.py
sed -i 's/Pan/Pomik/g' plotly_streamlit.py
sed -i 's/Box Select/Izbor z oknom/g' plotly_streamlit.py
sed -i 's/Lasso Select/Izbor z lasom/g' plotly_streamlit.py
sed -i 's/Zoom in/Povečaj/g' plotly_streamlit.py
sed -i 's/Zoom out/Pomanjšaj/g' plotly_streamlit.py
sed -i 's/Auto scale/Avtomatsko prilagodi/g' plotly_streamlit.py
sed -i 's/Reset views/Ponastavi pogled/g' plotly_streamlit.py
sed -i 's/Produces with Plotly/Ustvarjeno s Plotly/g' plotly_streamlit.py
sed -i 's/Confidence Max:/Max zanesljivost:/g' plotly_streamlit.py
sed -i 's/Reviewed/Pregledano/g' plotly_streamlit.py
sed -i 's/Available recordings/Razpoložljivi posnetki/g' plotly_streamlit.py
sed -i 's/View fullscreen/Pogled v celozaslonskem načinu/g' plotly_streamlit.py
sed -i 's/Made with Streamlit/Ustvarjeno s Streamlit/g' plotly_streamlit.py
# Due to changed time format, it is no longer possible to translate the hours to Swedish format
# sed -i "s/'12am', '1am', '2am', '3am', '4am', '5am', '6am', '7am', '8am', '9am',/'00', '01, '02', '03', '04', '05', '06', '07', '08', '09',/g" plotly_streamlit.py
# sed -i "s/ '10am', '11am', '12pm', '1pm', '2pm', '3pm', '4pm', '5pm', '6pm',/ '10', '11', '12', '13', '14', '15', '16', '17', '18',/g" plotly_streamlit.py
# sed -i "s/'7pm', '8pm', '9pm', '10pm', '11pm'],/'19', '20', '21', '22, '23'],/g" plotly_streamlit.py
# sed -i "s/'12am', '1am', '2am', '3am', '4am', '5am', '6am', '7am', '8am',/'00', '01', '02', '03', '04', '05', '06', '07', '08',/g" plotly_streamlit.py
# sed -i "s/'9am', '10am', '11am', '12pm', '1pm', '2pm', '3pm', '4pm', '5pm',/ '09', '10', '11', '12', '13', '14', '15', '16', '17',/g" plotly_streamlit.py
# sed -i "s/'6pm', '7pm', '8pm', '9pm', '10pm', '11pm'],/'18', '19', '20', '21', '22', '23'],/g" plotly_streamlit.py
sed -i 's/RUNNING.../OBRATUJE.../g' plotly_streamlit.py
sed -i 's/Please wait.../Prosim počakajte.../g' plotly_streamlit.py
sed -i 's/Date to View/Datum za pregled/g' plotly_streamlit.py
sed -i 's/Select Number of Birds to Show/Izberite število ptic za prikaz/g' plotly_streamlit.py
sed -i 's/sampling interval./interval vzorčenja./g' plotly_streamlit.py
sed -i 's/<br>for/<br>za/g' plotly_streamlit.py
sed -i 's/Species in/Vrste v/g' plotly_streamlit.py
sed -i 's/Max:/Max:/g' plotly_streamlit.py
sed -i 's/Median:/Median:/g' plotly_streamlit.py
sed -i 's/RECORDING NOT AVAILABLE :(/POSNETEK NI NA VOLJO :(/g' plotly_streamlit.py
sed -i 's/Date Range/Časovno obdobje/g' plotly_streamlit.py
sed -i 's/Select Color Pallet for Daily Detections/Izberite barvno paleto za dnevne zaznave/g' plotly_streamlit.py
sed -i 's/Alla/Vse/g' plotly_streamlit.py
sed -i "s/'<b>Top'/<b>Top'/g" plotly_streamlit.py
sed -i "s/' Species For '/' Vrste za '/g" plotly_streamlit.py
sed -i "s/ '<b>Daily ' + str(start_date) + ' Detections on ' + resample_sel + ' interval</ '<b>Dnevne ' + str(start_date) + ' zaznave v intervalu ' + resample_sel + '</g" plotly_streamlit.py
sed -i "s/subplot_titles=('<b>Top ' +/subplot_titles=('<b>Top ' +/g" plotly_streamlit.py
sed -i "s/+ str(top_N) + /+ str(top_N) + ','+ /g" plotly_streamlit.py
#
# config.php - Settings
sed -i 's/mailto:tim@birdweather.com/mailto:birdnetpi@birdweather.com/g' config.php
#
# links.php - Links
sed -i 's/Program-related links/Povezave v zvezi z programom/g' links.php
sed -i 's/Program source/Vir programa/g' links.php
sed -i 's/Wiki help page/Wiki-pomoč/g' links.php
sed -i 's/Questions and answers about BirdNET-Pi (English)/Vprašanja in odgovori o BirdNET-Pi (angleško)/g' links.php
sed -i 's/Own links/Lastne povezave/g' links.php
sed -i 's/Other BirdNET-Pi/Ostali BirdNET-Pi/g' links.php
sed -i 's/Please email if you have any questions or would like to do your own installation/Prosimo pošljite e-pošto, če imate vprašanja ali želite izvesti lastno namestitev/g' links.php
#
# weekly_report.php - Weekly report
sed -i 's/Report week/Tedensko poročilo/g' weekly_report.php
sed -i 's/Top 10 Species/Top 10 Vrst/g' weekly_report.php
sed -i 's/Species Detected for the First Time/Prvič zaznane vrste/g' weekly_report.php
sed -i 's/No new species were seen this week/Ta teden ni bilo zaznanih novih vrst/g' weekly_report.php
sed -i 's/percentages are calculated relative to week/odstotki so izračunani glede na teden/g' weekly_report.php