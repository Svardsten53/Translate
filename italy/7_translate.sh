#!/bin/bash
#
# This script replaces selected text in files with Italian text.
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
sed -i 's/ort-eller-plats/Inserisci-la-tua-posizione-o-luogo-qui/g' index.php
sed -i 's/You cannot listen to the live audio stream/Non è possibile ascoltare lo streaming audio dal vivo/g' index.php
sed -i 's/>Live Audio</>Audio in diretta</g' index.php
#
# views.php - Menu bar
sed -i "/<button type=\"submit\" name=\"view\" value=\"Recordings\" form=\"views\">Recordings<\/button>/a <button type=\"submit\" name=\"view\" value=\"Links\" form=\"views\">Links<\/button>" views.php
sed -i "/if(\$_GET\['view'\] == \"Daily Charts\"){include('history.php');}/a if(\$_GET['view'] == \"Links\"){include('scripts/links.php');}" views.php
sed -i "/if(\$_GET\['view'\] == \"Links\"){include('scripts\/links.php');}/a if(\$_GET['view'] == \"QA\"){include('scripts/qa.php');}" views.php
sed -i 's/>Overview</>Panoramica</g' views.php
sed -i "s/>Today's Detections</>Rilevamenti di oggi</g" views.php
sed -i 's/>Best Recordings</>Migliori registrazioni</g' views.php
sed -i 's/>Species Stats</>Statistiche delle specie</g' views.php
sed -i 's/>Daily Charts</>Grafici giornalieri</g' views.php
sed -i 's/>Recordings</>Registrazioni</g' views.php
sed -i 's/>Spectrogram</>Spettrogramma</g' views.php
sed -i 's/>View Log</>Visualizza log</g' views.php
sed -i 's/>Tools</>Strumenti</g' views.php
sed -i 's/>Weekly Report</>Report settimanale</g' views.php
sed -i 's/>Links</>Link</g' views.php
sed -i 's/You cannot edit the settings for this installation/Non è possibile modificare le impostazioni per questa installazione/g' views.php
sed -i 's/<div class="views">n/<div class="views"><br>/g' views.php
sed -i 's/WARNING: Your latitude and longitude are not set properly. Please do so now in Tools -> Settings./ATTENZIONE: La tua latitudine e longitudine non sono impostate correttamente. Si prega di farlo ora in Strumenti -> Impostazioni./g' views.php
sed -i 's/WARNING: Your latitude is not set properly. Please do so now in Tools -> Settings./ATTENZIONE: La tua latitudine non è impostata correttamente. Si prega di farlo ora in Strumenti -> Impostazioni./g' views.php
sed -i 's/WARNING: Your longitude is not set properly. Please do so now in Tools -> Settings./ATTENZIONE: La tua longitudine non è impostata correttamente. Si prega di farlo ora in Strumenti -> Impostazioni./g' views.php
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
sed -i 's/>Total</>Totale</g' overview.php
sed -i 's/>Today</>Oggi</g' overview.php
sed -i 's/>Last Hour</>Ultima ora</g' overview.php
sed -i 's/>Species Detected Today</>Specie rilevate oggi</g' overview.php
sed -i 's/>Total Number of Species</>Numero totale di specie</g' overview.php
sed -i 's/<h3>Most Recent Detection:/<br><h3>Rilevamento più recente:/g' overview.php
sed -i 's/<h3>Currently Analyzing/<br><br><h3>In fase di analisi/g' overview.php
# sed -i '$s/<script>/<br><script>/g' overview.php
sed -i 's/Confidence:/Fiducia:/g' overview.php
sed -i 's/Database is busy/Il database è occupato/g' overview.php
sed -i 's/5 Most Recent Detections/Gli ultimi 5 rilevamenti/g' overview.php
sed -i 's/Loading.../Caricamento.../g' overview.php
sed -i 's/Open in new tab/Apri in una nuova scheda/g' overview.php
sed -i '0,/<style>/{s/<style>/<style> a:link { color: blue; } a:visited { color: blue; } a:active { color: blue; }/}' overview.php
sed -i 's/No Detections For Today./Nessun rilevamento per oggi./g' overview.php
sed -i 's/View species stats/Visualizza statistiche delle specie/g' overview.php
sed -i 's/Detections Over 30d/Rilevamenti negli ultimi 30 giorni/g' overview.php
sed -i 's/>Close</>Chiudi</g' overview.php
sed -i 's/Are you sure you want to blacklist this image?/Sei sicuro di voler inserire questa immagine nella lista nera?/g' overview.php
sed -i 's/Blacklist this image/Inserisci questa immagine nella lista nera/g' overview.php
sed -i 's/Your system is currently processing a backlog of audio. This can take several hours before normal functionality of your BirdNET-Pi resumes./Il tuo sistema sta attualmente elaborando un arretrato di audio. Ciò può richiedere diverse ore prima che la normale funzionalità del tuo BirdNET-Pi riprenda./g' overview.php
# Addition for Nachtzuster
sed -i 's#<a href="https://wikipedia.org/wiki/<?php echo $sciname;?>"#<a href="https://it.wikipedia.org/wiki/<?php echo $comname;?>"#g' overview.php
sed -i 's#<a href="https://wikipedia.org/wiki/<?php echo $sciname; ?>"#<a href="https://it.wikipedia.org/wiki/<?php echo $comname;?>"#g' overview.ph
sed -i 's#title="Wikipedia"#title="Wikipedia"#g' overview.php
sed -i 's/Species Today/Specie oggi/g' overview.php
sed -i 's/Species Total/Specie totali/g' overview.php
sed -i 's/New Species/Nuove specie/g' overview.php
sed -i 's/Rare Species/Specie rare/g' overview.php
sed -i 's/detected today!/rilevate oggi!/g' overview.php
sed -i 's/Max confidence/Massima fiducia/g' overview.php
sed -i 's/First detection/Primo rilevamento/g' overview.php
sed -i 's/Last seen/Ultima vista/g' overview.php
sed -i 's/mo ago/ mesi fa/g' overview.php
sed -i 's/d ago/ giorni fa/g' overview.php
sed -i "s/'Detections Over ' + days + 'd'/'Rilevamenti negli ultimi ' + days + ' giorni'/g" overview.php
sed -i "s/Open Today's recordings page/Apri la pagina delle registrazioni di oggi/g" overview.php
#
# todays_detections.php - Today's finds
sed -i 's/>Number of Detections</>Numero di rilevamenti</g' todays_detections.php
sed -i 's/>Total</>Totale</g' todays_detections.php
sed -i 's/>Today</>Oggi</g' todays_detections.php
sed -i 's/>Last Hour</>Ultima ora</g' todays_detections.php
sed -i 's/>Unique Species Total</>Specie uniche totali</g' todays_detections.php
sed -i 's/>Unique Species Today</>Specie uniche oggi</g' todays_detections.php
sed -i 's/>Load 40 More...</>Carica altre 40...</g' todays_detections.php
sed -i 's#allaboutbirds.org#it.wikipedia.org#g' todays_detections.php
sed -i 's/guide/wiki/g' todays_detections.php
sed -i 's/Confidence:/Fiducia:/g' todays_detections.php
sed -i "s/Today's Detections/Rilevamenti di oggi/g" todays_detections.php
sed -i "s/Legacy view/Visualizzazione legacy/g" todays_detections.php
sed -i "s/Normal view/Visualizzazione normale/g" todays_detections.php
sed -i "s/Search.../Cerca.../g" todays_detections.php
sed -i "s/Loading.../Caricamento.../g" todays_detections.php
sed -i 's/Open in new tab/Apri in una nuova scheda/g' todays_detections.php
sed -i 's/No Detections For Today./Nessun rilevamento per oggi./g' todays_detections.php
sed -i '0,/<style>/{s/<style>/<style> a:link { color: blue; } a:visited { color: blue; } a:active { color: blue; }/}' todays_detections.php
sed -i 's/View species stats/Visualizza statistiche delle specie/g' todays_detections.php
sed -i 's/Detections Over 30d/Rilevamenti negli ultimi 30 giorni/g' todays_detections.php
sed -i 's/>Close</>Chiudi</g' todays_detections.php
sed -i 's/Are you sure you want to blacklist this image?/Sei sicuro di voler inserire questa immagine nella lista nera?/g' todays_detections.php
sed -i 's/Blacklist this image/Inserisci questa immagine nella lista nera/g' todays_detections.php
sed -i 's/Delete Detection/Elimina rilevamento/g' todays_detections.php
# Addition for Nachtzuster
sed -i 's#<a href="https://wikipedia.org/wiki/<?php echo $sciname;?>"#<a href="https://it.wikipedia.org/wiki/<?php echo $comname;?>"#g' todays_detections.php
sed -i 's/Species Total/Specie totali/g' todays_detections.php
sed -i 's/Species Today/Specie oggi/g' todays_detections.php
#
# stats.php - Best recordings
sed -i 's/Choose a species to load images from Wikimedia Commons/Scegli una specie per caricare le immagini da Wikimedia Commons/g' stats.php
sed -i 's/Occurrences:/Occorrenze:/g' stats.php
sed -i 's/Max Confidence:/Massima fiducia:/g' stats.php
sed -i 's/Best Recording:/Migliore registrazione:/g' stats.php
sed -i 's#allaboutbirds.org#it.wikipedia.org#g' stats.php
sed -i 's/guide/wiki/g' stats.php
sed -i 's/All About Birds/Wikipedia/g' stats.php
sed -i 's/Loading Images from/Caricamento immagini da/g' stats.php
sed -i 's/Choose a species to load images from Flickr./Scegli una specie per caricare le immagini da Flickr./g' stats.php
sed -i 's/Best Recordings for Other Species:/Migliori registrazioni per altre specie:/g' stats.php
sed -i 's/Sort by alphabetical/Ordina alfabeticamente/g' stats.php
sed -i 's/Sort by occurrences/Ordina per occorrenze/g' stats.php
sed -i 's/Open in new tab/Apri in una nuova scheda/g' stats.php
sed -i '0,/<style>/{s/<style>/<style> a:link { color: blue; } a:visited { color: blue; } a:active { color: blue; }/}' stats.php
# Addition for Nachtzuster
sed -i 's#//wikipedia\.org/wiki/\$sciname#//it\.wikipedia\.org/wiki/\$comname#g' stats.php
sed -i 's#wikipedia\.org/wiki/\$sciname#it.wikipedia.org/wiki/\$comname#g' stats.php
sed -i 's/Sort by confidence/Ordina per fiducia/g' stats.php
#
# history.php - Daily graphs
sed -i 's/>Submit Date</>Invia data</g' history.php
sed -i 's/Total Detections For The Day/Numero totale di rilevamenti per il giorno/g' history.php
sed -i 's%echo "<img src=\"/Charts/$chart2?nocache=time()\">";%echo " ";%g' history.php
sed -i 's/No Charts for/Nessun grafico per/g' history.php
#
# play.php - Recordings
sed -i 's/Sort by date/Ordina per data/g' play.php
sed -i 's/Sort by confidence/Ordina per fiducia/g' play.php
sed -i 's/>By Species</>Per specie</g' play.php
sed -i 's/>By Date</>Per data</g' play.php
sed -i "s/This file is not delete protected./Questo file non è protetto dall'eliminazione./g" play.php
sed -i "s/This file is not delete protected./Questo file non è protetto dall'eliminazione./g" play.php
sed -i 's/Unable to open file!/Impossibile aprire il file!/g' play.php
sed -i 's/You must be authenticated to change the protection of files./Devi essere autenticato per modificare la protezione dei file./g' play.php
sed -i "s/This file is delete protected./Questo file è protetto dall'eliminazione./g" play.php
sed -i 's/Sort by alphabetical/Ordina alfabeticamente/g' play.php
sed -i 's/Sort by occurrences/Ordina per occorrenze/g' play.php
sed -i 's/No recordings were found./Nessuna registrazione trovata./g' play.php
sed -i 's/They may have been deleted to make space for new recordings. You can modify this setting for the future in Tools/Potrebbero essere state eliminate per fare spazio a nuove registrazioni. Puoi modificare questa impostazione per il futuro in Strumenti/g' play.php
sed -i 's/Only Show Purge Excluded/Mostra solo gli esclusi dalla pulizia/g' play.php
sed -i 's/This file is not excluded from being purged./Questo file non è escluso dalla pulizia./g' play.php
sed -i 's/This file is excluded from being purged./Questo file è escluso dalla pulizia./g' play.php
sed -i "s/They may have been deleted to make space for new recordings. You can prevent this from happening in the future by clicking the/Potrebbero essere state eliminate per fare spazio a nuove registrazioni. Puoi impedire che ciò accada in futuro cliccando sull'icona/g" play.php
sed -i "s/ icon in the top right of a recording./ nell'angolo in alto a destra di una registrazione./g" play.php
sed -i 's/You can also modify this behavior globally under /Puoi anche modificare questo comportamento a livello globale in/g' play.php
sed -i 's/>here.</>qui.</g' play.php
sed -i 's/Database is busy/Il database è occupato/g' play.php
sed -i 's/Delete Detection/Elimina rilevamento/g' play.php
sed -i 's/"Today"/"Oggi"/g' play.php
sed -i 's/This file has been shifted down in frequency./Questo file è stato spostato verso il basso in frequenza./g' play.php
sed -i 's/This file is not shifted in frequency./Questo file non è spostato in frequenza./g' play.php
sed -i 's/Sort by confidence/Ordina per fiducia/g' play.php
# Addition for Nachtzuster
sed -i 's#wikipedia\.org/wiki/\$sciname#it\.wikipedia\.org/wiki/\$sciname#g' play.php
sed -i 's#Change Detection#Modifica rilevamento#g' play.php
sed -i 's#This file will be deleted when disk space needs to be freed.#Questo file verrà eliminato quando sarà necessario liberare spazio su disco.#g' play.php
sed -i 's#\(>95% usage\)\.# (>95% di utilizzo).#g' play.php
#
# spectrogram.php - Spectrogram
sed -i 's/Gain:/Guadagno:/g' spectrogram.php
sed -i 's/Loading.../Caricamento.../g' spectrogram.php
sed -i 's/Compression:/Compressione:/g' spectrogram.php
sed -i 's/Freq shift:/Spostamento di frequenza:/g' spectrogram.php
#
# daily_plot.py - Graph
sed -i 's#\(xlabel="Detections"\)#xlabel="Rilevamenti"#g' daily_plot.py
sed -i 's#\(xlabel="Hour of Day"\)#xlabel="Ora del giorno"#g' daily_plot.py
sed -i "s#plot_type = 'All'#plot_type = 'Tutti'#g" daily_plot.py
sed -i 's#{readings} Last Updated:#{readings} Ultimo aggiornamento:#g' daily_plot.py
#
# plotly_streamlit.py - Species statistics
sed -i 's/Single Day View/Visualizzazione di un singolo giorno/g' plotly_streamlit.py
sed -i 's/Resample Resolution/Risoluzione di ricampionamento/g' plotly_streamlit.py
sed -i 's/Select resolution for species - DAILY provides time series/Seleziona la risoluzione per le specie - GIORNALIERA fornisce serie temporali/g' plotly_streamlit.py
sed -i 's/Select start and end date, if same date get a clockplot for a single day/Seleziona la data di inizio e fine, se la data è la stessa, ottieni un grafico a orologio per un singolo giorno/g' plotly_streamlit.py
sed -i 's/Select if you want single day view, unselect for multi-day views/Seleziona se vuoi la visualizzazione di un singolo giorno, deseleziona per le visualizzazioni di più giorni/g' plotly_streamlit.py
sed -i 's/Raw/Grezzo/g' plotly_streamlit.py
sed -i 's/15 minutes/15 minuti/g' plotly_streamlit.py
sed -i 's/Hourly/Orario/g' plotly_streamlit.py
sed -i 's/DAILY/GIORNALIERO/g' plotly_streamlit.py
sed -i 's/Which bird would you like to explore for the dates/Quale uccello vorresti esplorare per le date/g' plotly_streamlit.py
sed -i 's/Species in Date Range/Specie nel intervallo di date/g' plotly_streamlit.py
sed -i "s/' to '/' - '/g" plotly_streamlit.py
sed -i 's/Total Detect:/Rilevamento totale:/g' plotly_streamlit.py
sed -i 's/Download plot as a png/Scarica il grafico come png/g' plotly_streamlit.py
sed -i 's/Zoom/Zoom/g' plotly_streamlit.py
sed -i 's/Pan/Panoramica/g' plotly_streamlit.py
sed -i 's/Box Select/Selezione a casella/g' plotly_streamlit.py
sed -i 's/Lasso Select/Selezione a lazo/g' plotly_streamlit.py
sed -i 's/Zoom in/Ingrandisci/g' plotly_streamlit.py
sed -i 's/Zoom out/Rimpicciolisci/g' plotly_streamlit.py
sed -i 's/Auto scale/Scala automatica/g' plotly_streamlit.py
sed -i 's/Reset views/Reimposta visualizzazioni/g' plotly_streamlit.py
sed -i 's/Produces with Plotly/Prodotto con Plotly/g' plotly_streamlit.py
sed -i 's/Confidence Max:/Fiducia max:/g' plotly_streamlit.py
sed -i 's/Reviewed/Revisionato/g' plotly_streamlit.py
sed -i 's/Available recordings/Registrazioni disponibili/g' plotly_streamlit.py
sed -i 's/View fullscreen/Visualizza a schermo intero/g' plotly_streamlit.py
sed -i 's/Made with Streamlit/Realizzato con Streamlit/g' plotly_streamlit.py
# Due to changed time format, it is no longer possible to translate the hours to Swedish format
# sed -i "s/'12am', '1am', '2am', '3am', '4am', '5am', '6am', '7am', '8am', '9am',/'00', '01, '02', '03', '04', '05', '06', '07', '08', '09',/g" plotly_streamlit.py
# sed -i "s/ '10am', '11am', '12pm', '1pm', '2pm', '3pm', '4pm', '5pm', '6pm',/ '10', '11', '12', '13', '14', '15', '16', '17', '18',/g" plotly_streamlit.py
# sed -i "s/'7pm', '8pm', '9pm', '10pm', '11pm'],/'19', '20', '21', '22, '23'],/g" plotly_streamlit.py
# sed -i "s/'12am', '1am', '2am', '3am', '4am', '5am', '6am', '7am', '8am',/'00', '01', '02', '03', '04', '05', '06', '07', '08',/g" plotly_streamlit.py
# sed -i "s/'9am', '10am', '11am', '12pm', '1pm', '2pm', '3pm', '4pm', '5pm',/ '09', '10', '11', '12', '13', '14', '15', '16', '17',/g" plotly_streamlit.py
# sed -i "s/'6pm', '7pm', '8pm', '9pm', '10pm', '11pm'],/'18', '19', '20', '21', '22', '23'],/g" plotly_streamlit.py
sed -i 's/RUNNING.../IN ESECUZIONE.../g' plotly_streamlit.py
sed -i 's/Please wait.../Attendere prego.../g' plotly_streamlit.py
sed -i 's/Date to View/Data da visualizzare/g' plotly_streamlit.py
sed -i 's/Select Number of Birds to Show/Seleziona il numero di uccelli da mostrare/g' plotly_streamlit.py
sed -i 's/sampling interval./intervallo di campionamento./g' plotly_streamlit.py
sed -i 's/<br>for/<br>per/g' plotly_streamlit.py
sed -i 's/Species in/Specie in/g' plotly_streamlit.py
sed -i 's/Max:/Max:/g' plotly_streamlit.py
sed -i 's/Median:/Mediano:/g' plotly_streamlit.py
sed -i 's/RECORDING NOT AVAILABLE :(/REGISTRAZIONE NON DISPONIBILE :(/g' plotly_streamlit.py
sed -i 's/Date Range/Intervallo di date/g' plotly_streamlit.py
sed -i 's/Select Color Pallet for Daily Detections/Seleziona la tavolozza dei colori per i rilevamenti giornalieri/g' plotly_streamlit.py
sed -i 's/Alla/All/g' plotly_streamlit.py
sed -i "s/'<b>Top'/<b>Top'/g" plotly_streamlit.py
sed -i "s/' Species For '/' Specie per '/g" plotly_streamlit.py
sed -i "s/ '<b>Daily ' + str(start_date) + ' Detections on ' + resample_sel + ' interval</ '<b>Rilevamenti giornalieri ' + str(start_date) + ' su intervallo ' + resample_sel + '</g" plotly_streamlit.py
sed -i "s/subplot_titles=('<b>Top ' +/subplot_titles=('<b>Top ' +/g" plotly_streamlit.py
sed -i "s/+ str(top_N) + /+ str(top_N) + ','+ /g" plotly_streamlit.py
#
# config.php - Settings
sed -i 's/mailto:tim@birdweather.com/mailto:birdnetpi@birdweather.com/g' config.php
#
# links.php - Links
sed -i 's/Program-related links/Link relativi al programma/g' links.php
sed -i 's/Program source/Sorgente del programma/g' links.php
sed -i 's/Wiki help page/Pagina di aiuto Wiki/g' links.php
sed -i 's/Questions and answers about BirdNET-Pi (English)/Domande e risposte su BirdNET-Pi (Inglese)/g' links.php
sed -i 's/Own links/Link personali/g' links.php
sed -i 's/Other BirdNET-Pi/Altro BirdNET-Pi/g' links.php
sed -i "s/Please email if you have any questions or would like to do your own installation/Si prega di inviare un'e-mail se avete domande o se desiderate fare una vostra installazione/g" links.php
#
# weekly_report.php - Weekly report
sed -i 's/Report week/Settimana del report/g' weekly_report.php
sed -i 's/Top 10 Species/Top 10 specie/g' weekly_report.php
sed -i 's/Species Detected for the First Time/Specie rilevate per la prima volta/g' weekly_report.php
sed -i 's/No new species were seen this week/Nessuna nuova specie è stata vista questa settimana/g' weekly_report.php
sed -i 's/percentages are calculated relative to week/le percentuali sono calcolate in relazione alla settimana/g' weekly_report.php