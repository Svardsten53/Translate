#!/bin/bash
#
# This script replaces selected text in files with French text.
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
sed -i 's/ort-eller-plats/Entrez-votre-ville-ou-lieu-ici/g' index.php
sed -i 's/You cannot listen to the live audio stream/Vous ne pouvez pas écouter le flux audio en direct/g' index.php
sed -i 's/>Live Audio</>Audio en direct</g' index.php
#
# views.php - Menu bar
sed -i 's/>Overview</>Aperçu</g' views.php
sed -i "s/>Today's Detections</>Détections du jour</g" views.php
sed -i 's/>Best Recordings</>Meilleures enregistrements</g' views.php
sed -i 's/>Species Stats</>Statistiques des espèces</g' views.php
sed -i 's/>Daily Charts</>Graphiques quotidiens</g' views.php
sed -i 's/>Recordings</>Enregistrements</g' views.php
sed -i 's/>Spectrogram</>Spectrogramme</g' views.php
sed -i 's/>View Log</>Afficher le journal</g' views.php
sed -i 's/>Tools</>Outils</g' views.php
sed -i 's/>Weekly Report</>Rapport hebdomadaire</g' views.php
sed -i 's/>Links</>Liens</g' views.php
sed -i 's/You cannot edit the settings for this installation/Vous ne pouvez pas modifier les paramètres de cette installation/g' views.php
sed -i 's/<div class="views">n/<div class="views"><br>/g' views.php
sed -i 's/WARNING: Your latitude and longitude are not set properly. Please do so now in Tools -> Settings./AVERTISSEMENT : Votre latitude et votre longitude ne sont pas correctement définies. Veuillez le faire maintenant dans Outils -> Paramètres./g' views.php
sed -i 's/WARNING: Your latitude is not set properly. Please do so now in Tools -> Settings./AVERTISSEMENT : Votre latitude n'est pas correctement définie. Veuillez le faire maintenant dans Outils -> Paramètres./g' views.php
sed -i 's/WARNING: Your longitude is not set properly. Please do so now in Tools -> Settings./AVERTISSEMENT : Votre longitude n'est pas correctement définie. Veuillez le faire maintenant dans Outils -> Paramètres./g' views.php
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
sed -i 's/>Today</>Aujourd'hui</g' overview.php
sed -i 's/>Last Hour</>Dernière heure</g' overview.php
sed -i 's/>Species Detected Today</>Espèces détectées aujourd'hui</g' overview.php
sed -i 's/>Total Number of Species</>Nombre total d'espèces</g' overview.php
sed -i 's/<h3>Most Recent Detection:/<br><h3>Dernière détection:/g' overview.php
sed -i 's/<h3>Currently Analyzing/<br><br><h3>Analyse en cours/g' overview.php
# sed -i '$s/<script>/<br><script>/g' overview.php
sed -i 's/Confidence:/Confiance:/g' overview.php
sed -i 's/Database is busy/La base de données est occupée/g' overview.php
sed -i 's/5 Most Recent Detections/5 dernières détections/g' overview.php
sed -i 's/Loading.../Chargement.../g' overview.php
sed -i 's/Open in new tab/Ouvrir dans un nouvel onglet/g' overview.php
sed -i '0,/<style>/{s/<style>/<style> a:link { color: blue; } a:visited { color: blue; } a:active { color: blue; }/}' overview.php
sed -i 's/No Detections For Today./Pas de détections pour aujourd'hui./g' overview.php
sed -i 's/View species stats/Afficher les statistiques des espèces/g' overview.php
sed -i 's/Detections Over 30d/Détections sur 30j/g' overview.php
sed -i 's/>Close</>Fermer</g' overview.php
sed -i 's/Are you sure you want to blacklist this image?/Êtes-vous sûr de vouloir mettre cette image sur la liste noire?/g' overview.php
sed -i 's/Blacklist this image/Mettre cette image sur la liste noire/g' overview.php
sed -i 's/Your system is currently processing a backlog of audio. This can take several hours before normal functionality of your BirdNET-Pi resumes./Votre système est en train de traiter un arriéré d'audio. Cela peut prendre plusieurs heures avant que la fonctionnalité normale de votre BirdNET-Pi reprenne./g' overview.php
# Addition for Nachtzuster
# sed -i 's#wikipedia.org/wiki/<\?php echo \$sciname#fr.wikipedia.org/wiki/<\?php echo \$comname#g' overview.php
sed -i 's#<a href="https://wikipedia.org/wiki/<?php echo $sciname; ?>"#<a href="https://fr.wikipedia.org/wiki/<?php echo $comname;?>"#g' overview.php
sed -i 's#<a href="https://wikipedia.org/wiki/<?php echo $sciname;?>"#<a href="https://fr.wikipedia.org/wiki/<?php echo $comname;?>"#g' overview.php
sed -i 's#title="Wikipedia"#title="Wikipedia"#g' overview.php
sed -i 's/Species Today/Espèces aujourd'hui/g' overview.php
sed -i 's/Species Total/Espèces totales/g' overview.php
sed -i 's/New Species/Nouvelles espèces/g' overview.php
sed -i 's/Rare Species/Espèces rares/g' overview.php
sed -i 's/detected today!/détectées aujourd'hui!/g' overview.php
sed -i 's/Max confidence/Confiance maximale/g' overview.php
sed -i 's/First detection/Première détection/g' overview.php
sed -i 's/Last seen/Dernière vue/g' overview.php
sed -i 's/mo ago/ mois auparavant/g' overview.php
sed -i 's/d ago/ jours auparavant/g' overview.php
sed -i "s/'Detections Over ' + days + 'd'/'Détections sur ' + days + ' jours'/g" overview.php
sed -i "s/Open Today's recordings page/Ouvrir la page des enregistrements d'aujourd'hui/g" overview.php
#
# todays_detections.php - Today's finds
sed -i 's/>Number of Detections</>Nombre de détections</g' todays_detections.php
sed -i 's/>Total</>Total</g' todays_detections.php
sed -i 's/>Today</>Aujourd'hui</g' todays_detections.php
sed -i 's/>Last Hour</>Dernière heure</g' todays_detections.php
sed -i 's/>Unique Species Total</>Espèces uniques totales</g' todays_detections.php
sed -i 's/>Unique Species Today</>Espèces uniques aujourd'hui</g' todays_detections.php
sed -i 's/>Load 40 More...</>Charger 40 de plus...</g' todays_detections.php
sed -i 's#allaboutbirds.org#fr.wikipedia.org#g' todays_detections.php
sed -i 's/guide/wiki/g' todays_detections.php
sed -i 's/Confidence:/Confiance:/g' todays_detections.php
sed -i "s/Today's Detections/Détections du jour/g" todays_detections.php
sed -i "s/Legacy view/Vue classique/g" todays_detections.php
sed -i "s/Normal view/Vue normale/g" todays_detections.php
sed -i "s/Search.../Rechercher.../g" todays_detections.php
sed -i "s/Loading.../Chargement.../g" todays_detections.php
sed -i 's/Open in new tab/Ouvrir dans un nouvel onglet/g' todays_detections.php
sed -i 's/No Detections For Today./Pas de détections pour aujourd'hui./g' todays_detections.php
sed -i '0,/<style>/{s/<style>/<style> a:link { color: blue; } a:visited { color: blue; } a:active { color: blue; }/}' todays_detections.php
sed -i 's/View species stats/Afficher les statistiques des espèces/g' todays_detections.php
sed -i 's/Detections Over 30d/Détections sur 30j/g' todays_detections.php
sed -i 's/>Close</>Fermer</g' todays_detections.php
sed -i 's/Are you sure you want to blacklist this image?/Êtes-vous sûr de vouloir mettre cette image sur la liste noire?/g' todays_detections.php
sed -i 's/Blacklist this image/Mettre cette image sur la liste noire/g' todays_detections.php
sed -i 's/Delete Detection/Supprimer la détection/g' todays_detections.php
# Addition for Nachtzuster
# sed -i 's#wikipedia.org/wiki/<\?php echo \$sciname#fr.wikipedia.org/wiki/<\?php echo \$comname#g' todays_detections.php
sed -i 's#<a href="https://wikipedia.org/wiki/<?php echo $sciname;?>"#<a href="https://fr.wikipedia.org/wiki/<?php echo $comname;?>"#g' todays_detections.php
# sed -i 's#title="Wikipedia"#title="Svenska Wikipedia\"#g' todays_detections.php
sed -i 's/Species Total/Espèces totales/g' todays_detections.php
sed -i 's/Species Today/Espèces aujourd'hui/g' todays_detections.php
#
# stats.php - Best recordings
sed -i 's/Choose a species to load images from Wikimedia Commons/Choisissez une espèce pour charger des images de Wikimedia Commons/g' stats.php
sed -i 's/Occurrences:/Occurrences:/g' stats.php
sed -i 's/Max Confidence:/Confiance max:/g' stats.php
sed -i 's/Best Recording:/Meilleur enregistrement:/g' stats.php
sed -i 's#allaboutbirds.org#fr.wikipedia.org#g' stats.php
sed -i 's/guide/wiki/g' stats.php
sed -i 's/All About Birds/Wikipedia/g' stats.php
sed -i 's/Loading Images from/Chargement des images depuis/g' stats.php
sed -i 's/Choose a species to load images from Flickr./Choisissez une espèce pour charger des images de Flickr./g' stats.php
sed -i 's/Best Recordings for Other Species:/Meilleurs enregistrements pour d'autres espèces:/g' stats.php
sed -i 's/Sort by alphabetical/Trier par ordre alphabétique/g' stats.php
sed -i 's/Sort by occurrences/Trier par occurrences/g' stats.php
sed -i 's/Open in new tab/Ouvrir dans un nouvel onglet/g' stats.php
sed -i '0,/<style>/{s/<style>/<style> a:link { color: blue; } a:visited { color: blue; } a:active { color: blue; }/}' stats.php
# Addition for Nachtzuster
sed -i "s#wikipedia\.org/wiki/\$sciname#fr.wikipedia.org/wiki/\$comname#g" stats.php
sed -i 's#wikipedia.org/wiki/<\?php echo \$sciname#fr.wikipedia.org/wiki/<\?php echo \$comname#g' stats.php
# sed -i 's#"Wikipedia\"#"Svenska Wikipedia\"#g' stats.php
sed -i 's#wikipedia\.org/wiki/\$sciname#fr.wikipedia.org/wiki/\$comname#g' stats.php
sed -i 's/Sort by confidence/Trier par confiance/g' stats.php
#
# history.php - Daily graphs
sed -i 's/>Submit Date</>Soumettre la date</g' history.php
sed -i 's/Total Detections For The Day/Détections totales pour la journée/g' history.php
sed -i 's%echo "<img src=\"/Charts/$chart2?nocache=time()\">";%echo " ";%g' history.php
sed -i 's/No Charts for/Pas de graphiques pour/g' history.php
#
# play.php - Recordings
sed -i 's/Sort by date/Trier par date/g' play.php
sed -i 's/Sort by confidence/Trier par confiance/g' play.php
sed -i 's/>By Species</>Par espèce</g' play.php
sed -i 's/>By Date</>Par date</g' play.php
sed -i "s/This file is not delete protected./Ce fichier n'est pas protégé contre la suppression./g" play.php
sed -i "s/This file is not delete protected./Ce fichier n'est pas protégé contre la suppression./g" play.php
sed -i 's/Unable to open file!/Impossible d'ouvrir le fichier!/g' play.php
sed -i 's/You must be authenticated to change the protection of files./Vous devez être authentifié pour changer la protection des fichiers./g' play.php
sed -i "s/This file is delete protected./Ce fichier est protégé contre la suppression./g" play.php
sed -i 's/Sort by alphabetical/Trier par ordre alphabétique/g' play.php
sed -i 's/Sort by occurrences/Trier par occurrences/g' play.php
sed -i 's/No recordings were found./Aucun enregistrement n'a été trouvé./g' play.php
sed -i 's/They may have been deleted to make space for new recordings. You can modify this setting for the future in Tools/Ils peuvent avoir été supprimés pour faire de la place pour de nouveaux enregistrements. Vous pouvez modifier ce paramètre pour l'avenir dans Outils/g' play.php
sed -i 's/Only Show Purge Excluded/Afficher seulement les exclus de la purge/g' play.php
sed -i 's/This file is not excluded from being purged./Ce fichier n'est pas exclu d'être purgé./g' play.php
sed -i 's/This file is excluded from being purged./Ce fichier est exclu d'être purgé./g' play.php
sed -i 's/They may have been deleted to make space for new recordings. You can prevent this from happening in the future by clicking the/Ils peuvent avoir été supprimés pour faire de la place pour de nouveaux enregistrements. Vous pouvez empêcher que cela se produise à l'avenir en cliquant sur l'icône/g' play.php
sed -i 's/ icon in the top right of a recording./ dans le coin supérieur droit d'un enregistrement./g' play.php
sed -i 's/You can also modify this behavior globally under /Vous pouvez également modifier ce comportement globalement sous/g' play.php
sed -i 's/>here.</>ici.</g' play.php
sed -i 's/Database is busy/La base de données est occupée/g' play.php
sed -i 's/Delete Detection/Supprimer la détection/g' play.php
sed -i 's/"Today"/"Aujourd'hui"/g' play.php
sed -i 's/This file has been shifted down in frequency./Ce fichier a été décalé en fréquence vers le bas./g' play.php
sed -i 's/This file is not shifted in frequency./Ce fichier n'est pas décalé en fréquence./g' play.php
sed -i 's/Sort by confidence/Trier par confiance/g' play.php
# Addition for Nachtzuster
sed -i 's#wikipedia\.org/wiki/\$sciname#fr.wikipedia.org/wiki/\$name#g' play.php
# sed -i 's#"Wikipedia\"#"Svenska Wikipedia\"#g' play.php
sed -i 's#Change Detection#Changer la détection#g' play.php
sed -i 's#This file will be deleted when disk space needs to be freed.#Ce fichier sera supprimé lorsque de l'espace disque devra être libéré.#g' play.php
sed -i 's#\(>95% usage\)\.# (>95% d'utilisation).#g' play.php
#
# spectrogram.php - Spectrogram
sed -i 's/Gain:/Gain:/g' spectrogram.php
sed -i 's/Loading.../Chargement.../g' spectrogram.php
sed -i 's/Compression:/Compression:/g' spectrogram.php
sed -i 's/Freq shift:/Décalage de fréquence:/g' spectrogram.php
#
# daily_plot.py - Graph
sed -i 's#\(xlabel="Detections"\)#xlabel="Détections"#g' daily_plot.py
sed -i 's#\(xlabel="Hour of Day"\)#xlabel="Heure de la journée"#g' daily_plot.py
sed -i "s#plot_type = 'All'#plot_type = 'Toutes'#g" daily_plot.py
sed -i 's#{readings} Last Updated:#{readings} Dernière mise à jour:#g' daily_plot.py
#
# plotly_streamlit.py - Species statistics
sed -i 's/Single Day View/Vue d'une seule journée/g' plotly_streamlit.py
sed -i 's/Resample Resolution/Résolution de ré-échantillonnage/g' plotly_streamlit.py
sed -i 's/Select resolution for species - DAILY provides time series/Sélectionnez la résolution pour les espèces - QUOTIDIEN fournit des séries chronologiques/g' plotly_streamlit.py
sed -i 's/Select start and end date, if same date get a clockplot for a single day/Sélectionnez la date de début et de fin, si la date est la même, obtenez un graphique d'horloge pour une seule journée/g' plotly_streamlit.py
sed -i 's/Select if you want single day view, unselect for multi-day views/Sélectionnez si vous voulez une vue d'une seule journée, désélectionnez pour les vues de plusieurs jours/g' plotly_streamlit.py
sed -i 's/Raw/Brut/g' plotly_streamlit.py
sed -i 's/15 minutes/15 minutes/g' plotly_streamlit.py
sed -i 's/Hourly/Horaire/g' plotly_streamlit.py
sed -i 's/DAILY/QUOTIDIEN/g' plotly_streamlit.py
sed -i 's/Which bird would you like to explore for the dates/Quel oiseau aimeriez-vous explorer pour les dates/g' plotly_streamlit.py
sed -i 's/Species in Date Range/Espèces dans la plage de dates/g' plotly_streamlit.py
sed -i "s/' to '/' - '/g" plotly_streamlit.py
sed -i 's/Total Detect:/Détection totale:/g' plotly_streamlit.py
sed -i 's/Download plot as a png/Télécharger le graphique en png/g' plotly_streamlit.py
sed -i 's/Zoom/Zoomer/g' plotly_streamlit.py
sed -i 's/Pan/Panoramique/g' plotly_streamlit.py
sed -i 's/Box Select/Sélection de zone/g' plotly_streamlit.py
sed -i 's/Lasso Select/Sélection lasso/g' plotly_streamlit.py
sed -i 's/Zoom in/Zoomer avant/g' plotly_streamlit.py
sed -i 's/Zoom out/Dézoomer/g' plotly_streamlit.py
sed -i 's/Auto scale/Mise à l'échelle automatique/g' plotly_streamlit.py
sed -i 's/Reset views/Réinitialiser les vues/g' plotly_streamlit.py
sed -i 's/Produces with Plotly/Produit avec Plotly/g' plotly_streamlit.py
sed -i 's/Confidence Max:/Confiance max:/g' plotly_streamlit.py
sed -i 's/Reviewed/Révisé/g' plotly_streamlit.py
sed -i 's/Available recordings/Enregistrements disponibles/g' plotly_streamlit.py
sed -i 's/View fullscreen/Afficher en plein écran/g' plotly_streamlit.py
sed -i 's/Made with Streamlit/Réalisé avec Streamlit/g' plotly_streamlit.py
# Due to changed time format, it is no longer possible to translate the hours to Swedish format
# sed -i "s/'12am', '1am', '2am', '3am', '4am', '5am', '6am', '7am', '8am', '9am',/'00', '01, '02', '03', '04', '05', '06', '07', '08', '09',/g" plotly_streamlit.py
# sed -i "s/ '10am', '11am', '12pm', '1pm', '2pm', '3pm', '4pm', '5pm', '6pm',/ '10', '11', '12', '13', '14', '15', '16', '17', '18',/g" plotly_streamlit.py
# sed -i "s/'7pm', '8pm', '9pm', '10pm', '11pm'],/'19', '20', '21', '22, '23'],/g" plotly_streamlit.py
# sed -i "s/'12am', '1am', '2am', '3am', '4am', '5am', '6am', '7am', '8am',/'00', '01', '02', '03', '04', '05', '06', '07', '08',/g" plotly_streamlit.py
# sed -i "s/'9am', '10am', '11am', '12pm', '1pm', '2pm', '3pm', '4pm', '5pm',/ '09', '10', '11', '12', '13', '14', '15', '16', '17',/g" plotly_streamlit.py
# sed -i "s/'6pm', '7pm', '8pm', '9pm', '10pm', '11pm'],/'18', '19', '20', '21', '22', '23'],/g" plotly_streamlit.py
sed -i 's/RUNNING.../EN COURS.../g' plotly_streamlit.py
sed -i 's/Please wait.../Veuillez patienter.../g' plotly_streamlit.py
sed -i 's/Date to View/Date à afficher/g' plotly_streamlit.py
sed -i 's/Select Number of Birds to Show/Sélectionner le nombre d'oiseaux à afficher/g' plotly_streamlit.py
sed -i 's/sampling interval./intervalle d'échantillonnage./g' plotly_streamlit.py
sed -i 's/<br>for/<br>pour/g' plotly_streamlit.py
sed -i 's/Species in/Espèces en/g' plotly_streamlit.py
sed -i 's/Max:/Max:/g' plotly_streamlit.py
sed -i 's/Median:/Médiane:/g' plotly_streamlit.py
sed -i 's/RECORDING NOT AVAILABLE :(/ENREGISTREMENT NON DISPONIBLE :(/g' plotly_streamlit.py
sed -i 's/Date Range/Plage de dates/g' plotly_streamlit.py
sed -i 's/Select Color Pallet for Daily Detections/Sélectionner la palette de couleurs pour les détections quotidiennes/g' plotly_streamlit.py
sed -i 's/Alla/Toutes/g' plotly_streamlit.py
sed -i "s/'<b>Top'/<b>Top'/g" plotly_streamlit.py
sed -i "s/' Species For '/' espèces pour '/g" plotly_streamlit.py
sed -i "s/ '<b>Daily ' + str(start_date) + ' Detections on ' + resample_sel + ' interval</ '<b>Détections quotidiennes ' + str(start_date) + ' sur ' + resample_sel + ' intervalle</g" plotly_streamlit.py
sed -i "s/subplot_titles=('<b>Top ' +/subplot_titles=('<b>Top ' +/g" plotly_streamlit.py
sed -i "s/+ str(top_N) + /+ str(top_N) + ','+ /g" plotly_streamlit.py
#
# config.php - Settings
sed -i 's/mailto:tim@birdweather.com/mailto:birdnetpi@birdweather.com/g' config.php
#
# links.php - Links
sed -i 's/Program-related links/Liens liés au programme/g' links.php
sed -i 's/Program source/Source du programme/g' links.php
sed -i 's/Wiki help page/Page d'aide Wiki/g' links.php
sed -i 's/Questions and answers about BirdNET-Pi (English)/Questions et réponses sur BirdNET-Pi (Anglais)/g' links.php
sed -i 's/Own links/Mes propres liens/g' links.php
sed -i 's/Other BirdNET-Pi/Autres BirdNET-Pi/g' links.php
sed -i "s/Please email if you have any questions or would like to do your own installation/Veuillez envoyer un e-mail si vous avez des questions ou si vous souhaitez faire votre propre installation/g" links.php
#
# weekly_report.php - Weekly report
sed -i 's/Report week/Semaine du rapport/g' weekly_report.php
sed -i 's/Top 10 Species/Top 10 des espèces/g' weekly_report.php
sed -i 's/Species Detected for the First Time/Espèces détectées pour la première fois/g' weekly_report.php
sed -i 's/No new species were seen this week/Aucune nouvelle espèce n'a été vue cette semaine/g' weekly_report.php
sed -i 's/percentages are calculated relative to week/les pourcentages sont calculés par rapport à la semaine/g' weekly_report.php