#!/bin/bash
#
# This script replaces English text with Portuguese (Portugal) text in BirdNET-Pi.
#
# Updated 2026-01-13 /L-Å - Adapted for Portuguese (PT)
#
# Positions correctly in the file structure
alias homepage="cd /home/userid-att-ändra/BirdNET-Pi/"
cd /home/userid-att-ändra/BirdNET-Pi/homepage
#
# index.php - Home page
sed -i 's/ort-eller-plats/insira-a-sua-cidade-ou-local-aqui/g' index.php
sed -i 's/You cannot listen to the live audio stream/Não é possível ouvir a transmissão de áudio em direto/g' index.php
sed -i 's/>Live Audio</>Áudio em Direto</g' index.php
#
# views.php - Menu bar
sed -i "/<button type=\"submit\" name=\"view\" value=\"Recordings\" form=\"views\">Recordings<\/button>/a <button type=\"submit\" name=\"view\" value=\"Links\" form=\"views\">Ligações<\/button>" views.php
sed -i "/if(\$_GET\['view'\] == \"Daily Charts\"){include('history.php');}/a if(\$_GET['view'] == \"Links\"){include('scripts/links.php');}" views.php
sed -i "/if(\$_GET\['view'\] == \"Links\"){include('scripts\/links.php');}/a if(\$_GET['view'] == \"QA\"){include('scripts/qa.php');}" views.php
sed -i 's/>Overview</>Visão Geral</g' views.php
sed -i "s/>Today's Detections</>Deteções de Hoje</g" views.php
sed -i 's/>Best Recordings</>Melhores Gravações</g' views.php
sed -i 's/>Species Stats</>Estatísticas de Espécies</g' views.php
sed -i 's/>Daily Charts</>Gráficos Diários</g' views.php
sed -i 's/>Recordings</>Gravações</g' views.php
sed -i 's/>Spectrogram</>Espetrograma</g' views.php
sed -i 's/>View Log</>Ver Registo</g' views.php
sed -i 's/>Tools</>Ferramentas</g' views.php
sed -i 's/>Weekly Report</>Relatório Semanal</g' views.php
sed -i 's/>Links</>Ligações</g' views.php
sed -i 's/You cannot edit the settings for this installation/Não pode editar as definições desta instalação/g' views.php
sed -i 's/WARNING: Your latitude and longitude are not set properly. Please do so now in Tools -> Settings./AVISO: A sua latitude e longitude não estão configuradas corretamente. Por favor, ajuste-as em Ferramentas -> Definições./g' views.php
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
sed -i 's/>Total</>Total</g' overview.php
sed -i 's/>Today</>Hoje</g' overview.php
sed -i 's/>Last Hour</>Última Hora</g' overview.php
sed -i 's/>Species Detected Today</>Espécies Detetadas Hoje</g' overview.php
sed -i 's/>Total Number of Species</>Número Total de Espécies</g' overview.php
sed -i 's/<h3>Most Recent Detection:/<br><h3>Deteção mais recente:/g' overview.php
sed -i 's/<h3>Currently Analyzing/<br><br><h3>A analisar agora/g' overview.php
sed -i 's/Confidence:/Confiança:/g' overview.php
sed -i 's/Database is busy/A base de dados está ocupada/g' overview.php
sed -i 's/5 Most Recent Detections/As 5 Deteções mais Recentes/g' overview.php
sed -i 's/Loading.../A carregar.../g' overview.php
sed -i 's/Open in new tab/Abrir em novo separador/g' overview.php
sed -i 's/No Detections For Today./Sem deteções hoje./g' overview.php
sed -i 's/View species stats/Ver estatísticas de espécies/g' overview.php
sed -i 's/Detections Over 30d/Deteções nos últimos 30 dias/g' overview.php
sed -i 's/>Close</>Fechar</g' overview.php
sed -i 's/Are you sure you want to blacklist this image?/Tem a certeza de que deseja colocar esta imagem na lista negra?/g' overview.php
sed -i 's/Blacklist this image/Lista negra para esta imagem/g' overview.php
# Wikipedia link in overview
sed -i 's#<a href="https://wikipedia.org/wiki/<?php echo $sciname;?>"#<a href="https://pt.wikipedia.org/wiki/<?php echo $comname;?>"#g' overview.php
sed -i 's#<a href="https://wikipedia.org/wiki/<?php echo $sciname; ?>"#<a href="https://pt.wikipedia.org/wiki/<?php echo $comname;?>"#g' overview.php
sed -i 's/Species Today/Espécies hoje/g' overview.php
sed -i 's/Species Total/Total de espécies/g' overview.php
sed -i 's/New Species/Novas espécies/g' overview.php
sed -i 's/Rare Species/Espécies raras/g' overview.php
sed -i 's/detected today!/detetadas hoje!/g' overview.php
sed -i 's/Max confidence/Confiança máx./g' overview.php
sed -i 's/First detection/Primeira deteção/g' overview.php
sed -i 's/Last seen/Visto pela última vez/g' overview.php
sed -i 's/mo ago/ meses atrás/g' overview.php
sed -i 's/d ago/ dias atrás/g' overview.php
#
# todays_detections.php - Today's detections
sed -i 's/>Number of Detections</>Número de Deteções</g' todays_detections.php
sed -i 's/>Total</>Total</g' todays_detections.php
sed -i 's/>Today</>Hoje</g' todays_detections.php
sed -i 's/>Last Hour</>Última Hora</g' todays_detections.php
sed -i 's/>Unique Species Total</>Total de Espécies Únicas</g' todays_detections.php
sed -i 's/>Unique Species Today</>Espécies Únicas Hoje</g' todays_detections.php
sed -i 's/>Load 40 More...</>Carregar mais 40...</g' todays_detections.php
sed -i 's#allaboutbirds.org#pt.wikipedia.org#g' todays_detections.php
sed -i 's/guide/wiki/g' todays_detections.php
sed -i 's/Confidence:/Confiança:/g' todays_detections.php
sed -i "s/Today's Detections/Deteções de Hoje/g" todays_detections.php
sed -i "s/Legacy view/Vista clássica/g" todays_detections.php
sed -i "s/Normal view/Vista normal/g" todays_detections.php
sed -i "s/Search.../Procurar.../g" todays_detections.php
sed -i 's/No Detections For Today./Sem deteções hoje./g' todays_detections.php
sed -i 's#<a href="https://wikipedia.org/wiki/<?php echo $sciname;?>"#<a href="https://pt.wikipedia.org/wiki/<?php echo $comname;?>"#g' todays_detections.php
#
# stats.php - Best recordings
sed -i 's/Choose a species to load images from Wikimedia Commons/Escolha uma espécie för carregar imagens do Wikimedia Commons/g' stats.php
sed -i 's/Occurrences:/Ocorrências:/g' stats.php
sed -i 's/Max Confidence:/Confiança Máx.:/g' stats.php
sed -i 's/Best Recording:/Melhor Gravação:/g' stats.php
sed -i 's#allaboutbirds.org#pt.wikipedia.org#g' stats.php
sed -i 's/guide/wiki/g' stats.php
sed -i 's/All About Birds/Wikipedia/g' stats.php
sed -i 's/Sort by alphabetical/Ordenar por ordem alfabética/g' stats.php
sed -i 's/Sort by occurrences/Ordenar por ocorrências/g' stats.php
sed -i 's#//wikipedia\.org/wiki/\$sciname#//pt\.wikipedia\.org/wiki/\$comname#g' stats.php
sed -i 's/Sort by confidence/Ordenar por confiança/g' stats.php
#
# history.php - Daily graphs
sed -i 's/>Submit Date</>Enviar Data</g' history.php
sed -i 's/Total Detections For The Day/Deteções totais do dia/g' history.php
sed -i 's/No Charts for/Sem gráficos para/g' history.php
#
# play.php - Recordings
sed -i 's/Sort by date/Ordenar por data/g' play.php
sed -i 's/Sort by confidence/Ordenar por confiança/g' play.php
sed -i 's/>By Species</>Por Espécie</g' play.php
sed -i 's/>By Date</>Por Data</g' play.php
sed -i 's/This file is not delete protected./Este ficheiro não está protegido contra eliminação./g' play.php
sed -i 's/Unable to open file!/Não foi possível abrir o ficheiro!/g' play.php
sed -i 's/This file is delete protected./Este ficheiro está protegido contra eliminação./g' play.php
sed -i 's/No recordings were found./Não foram encontradas gravações./g' play.php
sed -i 's/Only Show Purge Excluded/Mostrar apenas excluídos da limpeza/g' play.php
sed -i 's/Delete Detection/Eliminar Deteção/g' play.php
sed -i 's/"Today"/"Hoje"/g' play.php
sed -i 's#wikipedia\.org/wiki/\$sciname#pt\.wikipedia\.org/wiki/\$sciname#g' play.php
sed -i 's#Change Detection#Alterar Deteção#g' play.php
#
# spectrogram.php - Spectrogram
sed -i 's/Gain:/Ganho:/g' spectrogram.php
sed -i 's/Compression:/Compressão:/g' spectrogram.php
sed -i 's/Freq shift:/Desvio de freq.:/g' spectrogram.php
#
# daily_plot.py - Graph script
sed -i 's#\(xlabel="Detections"\)#xlabel="Deteções"#g' daily_plot.py
sed -i 's#\(xlabel="Hour of Day"\)#xlabel="Hora do Dia"#g' daily_plot.py
sed -i "s#plot_type = 'All'#plot_type = 'Tudo'#g" daily_plot.py
sed -i 's#{readings} Last Updated:#{readings} Última atualização:#g' daily_plot.py
#
# plotly_streamlit.py - Species statistics
sed -i 's/Single Day View/Vista de um único dia/g' plotly_streamlit.py
sed -i 's/Resample Resolution/Resolução de amostragem/g' plotly_streamlit.py
sed -i 's/Raw/Original/g' plotly_streamlit.py
sed -i 's/15 minutes/15 minutos/g' plotly_streamlit.py
sed -i 's/Hourly/Horário/g' plotly_streamlit.py
sed -i 's/DAILY/DIÁRIO/g' plotly_streamlit.py
sed -i 's/Species in Date Range/Espécies no intervalo de datas/g' plotly_streamlit.py
sed -i 's/Total Detect:/Total Deteções:/g' plotly_streamlit.py
sed -i 's/Download plot as a png/Descarregar gráfico como PNG/g' plotly_streamlit.py
sed -i 's/Zoom/Zoom/g' plotly_streamlit.py
sed -i 's/Pan/Mover/g' plotly_streamlit.py
sed -i 's/Auto scale/Escala automática/g' plotly_streamlit.py
sed -i 's/Reset views/Repor vistas/g' plotly_streamlit.py
sed -i 's/Confidence Max:/Confiança Máx.:/g' plotly_streamlit.py
sed -i 's/Reviewed/Revisto/g' plotly_streamlit.py
sed -i 's/Available recordings/Gravações disponíveis/g' plotly_streamlit.py
sed -i 's/View fullscreen/Ver em ecrã inteiro/g' plotly_streamlit.py
sed -i 's/RUNNING.../A EXECUTAR.../g' plotly_streamlit.py
sed -i 's/Please wait.../Por favor, aguarde.../g' plotly_streamlit.py
sed -i 's/Date to View/Data a visualizar/g' plotly_streamlit.py
sed -i 's/Species in/Espécies em/g' plotly_streamlit.py
sed -i 's/RECORDING NOT AVAILABLE :(/GRAVAÇÃO NÃO DISPONÍVEL :(/g' plotly_streamlit.py
sed -i 's/Date Range/Intervalo de datas/g' plotly_streamlit.py
sed -i 's/Alla/Tudo/g' plotly_streamlit.py
#
# links.php - Links
sed -i 's/Program-related links/Ligações relacionadas com o programa/g' links.php
sed -i 's/Program source/Código fonte/g' links.php
sed -i 's/Wiki help page/Página de ajuda Wiki/g' links.php
sed -i 's/Questions and answers about BirdNET-Pi (English)/Perguntas e respostas sobre o BirdNET-Pi (Inglês)/g' links.php
sed -i 's/Own links/Ligações próprias/g' links.php
sed -i 's/Other BirdNET-Pi/Outros BirdNET-Pi/g' links.php
#
# weekly_report.php - Weekly report
sed -i 's/Report week/Semana do relatório/g' weekly_report.php
sed -i 's/Top 10 Species/Top 10 Espécies/g' weekly_report.php
sed -i 's/Species Detected for the First Time/Espécies detetadas pela primeira vez/g' weekly_report.php
sed -i 's/No new species were seen this week/Não foram vistas novas espécies esta semana/g' weekly_report.php
sed -i 's/percentages are calculated relative to week/as percentagens são calculadas em relação à semana/g' weekly_report.php