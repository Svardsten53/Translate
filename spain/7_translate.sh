#!/bin/bash
#
# This script replaces selected text in files with Spanish text.
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
sed -i 's/ort-eller-plats/Escribe-tu-ciudad-o-lugar-aquí/g' index.php
sed -i 's/You cannot listen to the live audio stream/No puedes escuchar la transmisión de audio en vivo/g' index.php
sed -i 's/>Live Audio</>Audio en vivo</g' index.php
#
# views.php - Menu bar
sed -i "/<button type=\"submit\" name=\"view\" value=\"Recordings\" form=\"views\">Recordings<\/button>/a <button type=\"submit\" name=\"view\" value=\"Links\" form=\"views\">Links<\/button>" views.php
sed -i "/if(\$_GET\['view'\] == \"Daily Charts\"){include('history.php');}/a if(\$_GET['view'] == \"Links\"){include('scripts/links.php');}" views.php
sed -i "/if(\$_GET\['view'\] == \"Links\"){include('scripts\/links.php');}/a if(\$_GET['view'] == \"QA\"){include('scripts/qa.php');}" views.php
sed -i 's/>Overview</>Visión general</g' views.php
sed -i "s/>Today's Detections</>Detecciones de hoy</g" views.php
sed -i 's/>Best Recordings</>Mejores grabaciones</g' views.php
sed -i 's/>Species Stats</>Estadísticas de especies</g' views.php
sed -i 's/>Daily Charts</>Gráficos diarios</g' views.php
sed -i 's/>Recordings</>Grabaciones</g' views.php
sed -i 's/>Spectrogram</>Espectrograma</g' views.php
sed -i 's/>View Log</>Ver registro</g' views.php
sed -i 's/>Tools</>Herramientas</g' views.php
sed -i 's/>Weekly Report</>Informe semanal</g' views.php
sed -i 's/>Links</>Enlaces</g' views.php
sed -i 's/You cannot edit the settings for this installation/No puedes editar la configuración de esta instalación/g' views.php
sed -i 's/<div class="views">n/<div class="views"><br>/g' views.php
sed -i 's/WARNING: Your latitude and longitude are not set properly. Please do so now in Tools -> Settings./ADVERTENCIA: Tu latitud y longitud no están configuradas correctamente. Hazlo ahora en Herramientas -> Configuración./g' views.php
sed -i 's/WARNING: Your latitude is not set properly. Please do so now in Tools -> Settings./ADVERTENCIA: Tu latitud no está configurada correctamente. Hazlo ahora en Herramientas -> Configuración./g' views.php
sed -i 's/WARNING: Your longitude is not set properly. Please do so now in Tools -> Settings./ADVERTENCIA: Tu longitud no está configurada correctamente. Hazlo ahora en Herramientas -> Configuración./g' views.php
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
sed -i 's/>Today</>Hoy</g' overview.php
sed -i 's/>Last Hour</>Última hora</g' overview.php
sed -i 's/>Species Detected Today</>Especies detectadas hoy</g' overview.php
sed -i 's/>Total Number of Species</>Número total de especies</g' overview.php
sed -i 's/<h3>Most Recent Detection:/<br><h3>Detección más reciente:/g' overview.php
sed -i 's/<h3>Currently Analyzing/<br><br><h3>Analizando actualmente/g' overview.php
sed -i 's/Confidence:/Confianza:/g' overview.php
sed -i 's/Database is busy/La base de datos está ocupada/g' overview.php
sed -i 's/5 Most Recent Detections/Las 5 detecciones más recientes/g' overview.php
sed -i 's/Loading.../Cargando.../g' overview.php
sed -i 's/Open in new tab/Abrir en nueva pestaña/g' overview.php
sed -i '0,/<style>/{s/<style>/<style> a:link { color: blue; } a:visited { color: blue; } a:active { color: blue; }/}' overview.php
sed -i 's/No Detections For Today./No hay detecciones para hoy./g' overview.php
sed -i 's/View species stats/Ver estadísticas de especies/g' overview.php
sed -i 's/Detections Over 30d/Detecciones de los últimos 30 días/g' overview.php
sed -i 's/>Close</>Cerrar</g' overview.php
sed -i 's/Are you sure you want to blacklist this image?/¿Estás seguro de que quieres poner esta imagen en la lista negra?/g' overview.php
sed -i 's/Blacklist this image/Poner esta imagen en la lista negra/g' overview.php
sed -i 's/Your system is currently processing a backlog of audio. This can take several hours before normal functionality of your BirdNET-Pi resumes./Tu sistema está procesando actualmente una acumulación de audio. Esto puede tomar varias horas antes de que la funcionalidad normal de tu BirdNET-Pi se reanude./g' overview.php
sed -i 's#<a href="https://wikipedia.org/wiki/<?php echo $sciname;?>"#<a href="https://es.wikipedia.org/wiki/<?php echo $comname;?>"#g' overview.php
sed -i 's#<a href="https://wikipedia.org/wiki/<?php echo $sciname; ?>"#<a href="https://es.wikipedia.org/wiki/<?php echo $comname;?>"#g' overview.php
sed -i 's/Species Today/Especies hoy/g' overview.php
sed -i 's/Species Total/Especies totales/g' overview.php
sed -i 's/New Species/Nuevas especies/g' overview.php
sed -i 's/Rare Species/Especies raras/g' overview.php
sed -i 's/detected today!/detectadas hoy!/g' overview.php
sed -i 's/Max confidence/Confianza máxima/g' overview.php
sed -i 's/First detection/Primera detección/g' overview.php
sed -i 's/Last seen/Visto por última vez/g' overview.php
sed -i 's/mo ago/ meses atrás/g' overview.php
sed -i 's/d ago/ días atrás/g' overview.php
sed -i "s/'Detections Over ' + days + 'd'/'Detecciones de los últimos ' + days + ' días'/g" overview.php
sed -i "s/Open Today's recordings page/Abrir la página de grabaciones de hoy/g" overview.php
#
# todays_detections.php - Today's finds
sed -i 's/>Number of Detections</>Número de detecciones</g' todays_detections.php
sed -i 's/>Total</>Total</g' todays_detections.php
sed -i 's/>Today</>Hoy</g' todays_detections.php
sed -i 's/>Last Hour</>Última hora</g' todays_detections.php
sed -i 's/>Unique Species Total</>Especies únicas totales</g' todays_detections.php
sed -i 's/>Unique Species Today</>Especies únicas hoy</g' todays_detections.php
sed -i 's/>Load 40 More...</>Cargar 40 más...</g' todays_detections.php
sed -i 's#allaboutbirds.org#es.wikipedia.org#g' todays_detections.php
sed -i 's/guide/wiki/g' todays_detections.php
sed -i 's/Confidence:/Confianza:/g' todays_detections.php
sed -i "s/Today's Detections/Detecciones de hoy/g" todays_detections.php
sed -i "s/Legacy view/Vista clásica/g" todays_detections.php
sed -i "s/Normal view/Vista normal/g" todays_detections.php
sed -i "s/Search.../Buscar.../g" todays_detections.php
sed -i "s/Loading.../Cargando.../g" todays_detections.php
sed -i 's/Open in new tab/Abrir en nueva pestaña/g' todays_detections.php
sed -i 's/No Detections For Today./No hay detecciones para hoy./g' todays_detections.php
sed -i '0,/<style>/{s/<style>/<style> a:link { color: blue; } a:visited { color: blue; } a:active { color: blue; }/}' todays_detections.php
sed -i 's/View species stats/Ver estadísticas de especies/g' todays_detections.php
sed -i 's/Detections Over 30d/Detecciones de los últimos 30 días/g' todays_detections.php
sed -i 's/>Close</>Cerrar</g' todays_detections.php
sed -i 's/Are you sure you want to blacklist this image?/¿Estás seguro de que quieres poner esta imagen en la lista negra?/g' todays_detections.php
sed -i 's/Blacklist this image/Poner esta imagen en la lista negra/g' todays_detections.php
sed -i 's/Delete Detection/Eliminar detección/g' todays_detections.php
sed -i 's#<a href="https://wikipedia.org/wiki/<?php echo $sciname;?>"#<a href="https://es.wikipedia.org/wiki/<?php echo $comname;?>"#g' todays_detections.php
sed -i 's/Species Total/Especies totales/g' todays_detections.php
sed -i 's/Species Today/Especies hoy/g' todays_detections.php
#
# stats.php - Best recordings
sed -i 's/Choose a species to load images from Wikimedia Commons/Elige una especie para cargar imágenes de Wikimedia Commons/g' stats.php
sed -i 's/Occurrences:/Ocurrencias:/g' stats.php
sed -i 's/Max Confidence:/Confianza máxima:/g' stats.php
sed -i 's/Best Recording:/Mejor grabación:/g' stats.php
sed -i 's#allaboutbirds.org#es.wikipedia.org#g' stats.php
sed -i 's/guide/wiki/g' stats.php
sed -i 's/All About Birds/Wikipedia/g' stats.php
sed -i 's/Loading Images from/Cargando imágenes de/g' stats.php
sed -i 's/Choose a species to load images from Flickr./Elige una especie para cargar imágenes de Flickr./g' stats.php
sed -i 's/Best Recordings for Other Species:/Mejores grabaciones para otras especies:/g' stats.php
sed -i 's/Sort by alphabetical/Ordenar alfabéticamente/g' stats.php
sed -i 's/Sort by occurrences/Ordenar por ocurrencias/g' stats.php
sed -i 's/Open in new tab/Abrir en nueva pestaña/g' stats.php
sed -i '0,/<style>/{s/<style>/<style> a:link { color: blue; } a:visited { color: blue; } a:active { color: blue; }/}' stats.php
sed -i 's#//wikipedia\.org/wiki/\$sciname#//es\.wikipedia\.org/wiki/\$comname#g' stats.php
sed -i 's/Sort by confidence/Ordenar por confianza/g' stats.php
#
# history.php - Daily graphs
sed -i 's/>Submit Date</>Enviar fecha</g' history.php
sed -i 's/Total Detections For The Day/Total de detecciones del día/g' history.php
sed -i 's%echo "<img src=\"/Charts/$chart2?nocache=time()\">";%echo " ";%g' history.php
sed -i 's/No Charts for/No hay gráficos para/g' history.php
#
# play.php - Recordings
sed -i 's/Sort by date/Ordenar por fecha/g' play.php
sed -i 's/Sort by confidence/Ordenar por confianza/g' play.php
sed -i 's/>By Species</>Por especie</g' play.php
sed -i 's/>By Date</>Por fecha</g' play.php
sed -i "s/This file is not delete protected./Este archivo no está protegido contra eliminación./g" play.php
sed -i "s/This file is not delete protected./Este archivo no está protegido contra eliminación./g" play.php
sed -i 's/Unable to open file!/¡No se puede abrir el archivo!/g' play.php
sed -i 's/You must be authenticated to change the protection of files./Debes estar autenticado para cambiar la protección de los archivos./g' play.php
sed -i "s/This file is delete protected./Este archivo está protegido contra eliminación./g" play.php
sed -i 's/Sort by alphabetical/Ordenar alfabéticamente/g' play.php
sed -i 's/Sort by occurrences/Ordenar por ocurrencias/g' play.php
sed -i 's/No recordings were found./No se encontraron grabaciones./g' play.php
sed -i 's/They may have been deleted to make space for new recordings. You can modify this setting for the future in Tools/Es posible que hayan sido eliminadas para dejar espacio a nuevas grabaciones. Puedes modificar esta configuración para el futuro en Herramientas/g' play.php
sed -i 's/Only Show Purge Excluded/Mostrar solo los excluidos de la purga/g' play.php
sed -i 's/This file is not excluded from being purged./Este archivo no está excluido de ser purgado./g' play.php
sed -i 's/This file is excluded from being purged./Este archivo está excluido de ser purgado./g' play.php
sed -i 's/They may have been deleted to make space for new recordings. You can prevent this from happening in the future by clicking the/Es posible que hayan sido eliminadas para dejar espacio a nuevas grabaciones. Puedes evitar que esto suceda en el futuro haciendo clic en el ícono/g' play.php
sed -i 's/ icon in the top right of a recording./ en la esquina superior derecha de una grabación./g' play.php
sed -i 's/You can also modify this behavior globally under /También puedes modificar este comportamiento globalmente en/g' play.php
sed -i 's/>here.</>aquí.</g' play.php
sed -i 's/Database is busy/La base de datos está ocupada/g' play.php
sed -i 's/Delete Detection/Eliminar detección/g' play.php
sed -i 's/"Today"/"Hoy"/g' play.php
sed -i 's/This file has been shifted down in frequency./Este archivo ha sido desplazado hacia abajo en frecuencia./g' play.php
sed -i 's/This file is not shifted in frequency./Este archivo no está desplazado en frecuencia./g' play.php
sed -i 's/Sort by confidence/Ordenar por confianza/g' play.php
sed -i 's#wikipedia\.org/wiki/\$sciname#es\.wikipedia\.org/wiki/\$sciname#g' play.php
sed -i 's#Change Detection#Cambiar detección#g' play.php
sed -i 's#This file will be deleted when disk space needs to be freed.#Este archivo se eliminará cuando se necesite liberar espacio en el disco.#g' play.php
sed -i 's#\(>95% usage\)\.# (>95% de uso).#g' play.php
#
# spectrogram.php - Spectrogram
sed -i 's/Gain:/Ganancia:/g' spectrogram.php
sed -i 's/Loading.../Cargando.../g' spectrogram.php
sed -i 's/Compression:/Compresión:/g' spectrogram.php
sed -i 's/Freq shift:/Desplazamiento de frecuencia:/g' spectrogram.php
#
# daily_plot.py - Graph
sed -i 's#\(xlabel="Detections"\)#xlabel="Detecciones"#g' daily_plot.py
sed -i 's#\(xlabel="Hour of Day"\)#xlabel="Hora del día"#g' daily_plot.py
sed -i "s#plot_type = 'All'#plot_type = 'Todas'#g" daily_plot.py
sed -i 's#{readings} Last Updated:#{readings} Última actualización:#g' daily_plot.py
#
# plotly_streamlit.py - Species statistics
sed -i 's/Single Day View/Vista de un solo día/g' plotly_streamlit.py
sed -i 's/Resample Resolution/Resolución de remuestreo/g' plotly_streamlit.py
sed -i 's/Select resolution for species - DAILY provides time series/Selecciona la resolución para las especies - DIARIA proporciona series de tiempo/g' plotly_streamlit.py
sed -i 's/Select start and end date, if same date get a clockplot for a single day/Selecciona la fecha de inicio y fin, si es la misma fecha, obtén un gráfico de reloj para un solo día/g' plotly_streamlit.py
sed -i 's/Select if you want single day view, unselect for multi-day views/Selecciona si quieres vista de un solo día, deselecciona para vistas de varios días/g' plotly_streamlit.py
sed -i 's/Raw/Crudo/g' plotly_streamlit.py
sed -i 's/15 minutes/15 minutos/g' plotly_streamlit.py
sed -i 's/Hourly/Por hora/g' plotly_streamlit.py
sed -i 's/DAILY/DIARIA/g' plotly_streamlit.py
sed -i 's/Which bird would you like to explore for the dates/Qué ave te gustaría explorar para las fechas/g' plotly_streamlit.py
sed -i 's/Species in Date Range/Especies en el rango de fechas/g' plotly_streamlit.py
sed -i "s/' to '/' - '/g" plotly_streamlit.py
sed -i 's/Total Detect:/Detección total:/g' plotly_streamlit.py
sed -i 's/Download plot as a png/Descargar gráfico como png/g' plotly_streamlit.py
sed -i 's/Zoom/Zoom/g' plotly_streamlit.py
sed -i 's/Pan/Panorámica/g' plotly_streamlit.py
sed -i 's/Box Select/Selección de caja/g' plotly_streamlit.py
sed -i 's/Lasso Select/Selección de lazo/g' plotly_streamlit.py
sed -i 's/Zoom in/Acercar/g' plotly_streamlit.py
sed -i 's/Zoom out/Alejar/g' plotly_streamlit.py
sed -i 's/Auto scale/Escala automática/g' plotly_streamlit.py
sed -i 's/Reset views/Restablecer vistas/g' plotly_streamlit.py
sed -i 's/Produces with Plotly/Producido con Plotly/g' plotly_streamlit.py
sed -i 's/Confidence Max:/Confianza máx:/g' plotly_streamlit.py
sed -i 's/Reviewed/Revisado/g' plotly_streamlit.py
sed -i 's/Available recordings/Grabaciones disponibles/g' plotly_streamlit.py
sed -i 's/View fullscreen/Ver en pantalla completa/g' plotly_streamlit.py
sed -i 's/Made with Streamlit/Hecho con Streamlit/g' plotly_streamlit.py
sed -i 's/RUNNING.../EN EJECUCIÓN.../g' plotly_streamlit.py
sed -i 's/Please wait.../Por favor espera.../g' plotly_streamlit.py
sed -i 's/Date to View/Fecha a ver/g' plotly_streamlit.py
sed -i 's/Select Number of Birds to Show/Selecciona el número de aves a mostrar/g' plotly_streamlit.py
sed -i 's/sampling interval./intervalo de muestreo./g' plotly_streamlit.py
sed -i 's/<br>for/<br>para/g' plotly_streamlit.py
sed -i 's/Species in/Especies en/g' plotly_streamlit.py
sed -i 's/Max:/Máx:/g' plotly_streamlit.py
sed -i 's/Median:/Mediana:/g' plotly_streamlit.py
sed -i 's/RECORDING NOT AVAILABLE :(/GRABACIÓN NO DISPONIBLE :(/g' plotly_streamlit.py
sed -i 's/Date Range/Rango de fechas/g' plotly_streamlit.py
sed -i 's/Select Color Pallet for Daily Detections/Selecciona la paleta de colores para las detecciones diarias/g' plotly_streamlit.py
sed -i 's/Alla/Todos/g' plotly_streamlit.py
sed -i "s/'<b>Top'/<b>Top'/g" plotly_streamlit.py
sed -i "s/' Species For '/' especies para '/g" plotly_streamlit.py
sed -i "s/ '<b>Daily ' + str(start_date) + ' Detections on ' + resample_sel + ' interval</ '<b>Detecciones diarias ' + str(start_date) + ' en intervalo ' + resample_sel + '</g" plotly_streamlit.py
sed -i "s/subplot_titles=('<b>Top ' +/subplot_titles=('<b>Top ' +/g" plotly_streamlit.py
sed -i "s/+ str(top_N) + /+ str(top_N) + ','+ /g" plotly_streamlit.py
#
# config.php - Settings
sed -i 's/mailto:tim@birdweather.com/mailto:birdnetpi@birdweather.com/g' config.php
#
# links.php - Links
sed -i 's/Program-related links/Enlaces relacionados con el programa/g' links.php
sed -i 's/Program source/Fuente del programa/g' links.php
sed -i 's/Wiki help page/Página de ayuda de la Wiki/g' links.php
sed -i 's/Questions and answers about BirdNET-Pi (English)/Preguntas y respuestas sobre BirdNET-Pi (Inglés)/g' links.php
sed -i 's/Own links/Enlaces propios/g' links.php
sed -i 's/Other BirdNET-Pi/Otros BirdNET-Pi/g' links.php
sed -i "s/Please email if you have any questions or would like to do your own installation/Por favor, envía un correo electrónico si tienes alguna pregunta o si te gustaría hacer tu propia instalación/g" links.php
#
# weekly_report.php - Weekly report
sed -i 's/Report week/Semana del informe/g' weekly_report.php
sed -i 's/Top 10 Species/Top 10 especies/g' weekly_report.php
sed -i 's/Species Detected for the First Time/Especies detectadas por primera vez/g' weekly_report.php
sed -i 's/No new species were seen this week/No se vieron nuevas especies esta semana/g' weekly_report.php
sed -i 's/percentages are calculated relative to week/los porcentajes se calculan en relación a la semana/g' weekly_report.php