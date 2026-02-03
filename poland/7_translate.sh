#!/bin/bash
#
# This script replaces selected text in files with Polish text.
#
# If you want to make your own changes to the text, you can do so by copying one of the existing sed commands and changing the text in it. Note that the character '#' is a delimiter for the different parts of the command and that the same character must not exist in the text to be found or pasted. If this is the case, '#' can be replaced with, for example, '|'.
# translate.sh can be run any number of times as only the strings that have not already been changed will be changed.
#
# Updated 2026-01-12 /L-Å - Adapted for Polish (PL)
#
# Positions correctly in the file structure
alias homepage="cd /home/userid-att-ändra/BirdNET-Pi/"
cd /home/userid-att-ändra/BirdNET-Pi/homepage
#
# index.php - Home page (NOTE!!! In the first line, the text "enter-your-city-or-place-here" must be changed before the script is run.
sed -i 's/ort-eller-plats/Wprowadź-nazwę-swojego-miasta-lub-miejsca-tutaj/g' index.php
sed -i 's/You cannot listen to the live audio stream/Nie możesz słuchać strumienia audio na żywo/g' index.php
sed -i 's/>Live Audio</>Audio na żywo</g' index.php
#
# views.php - Menu bar
sed -i "/<button type=\"submit\" name=\"view\" value=\"Recordings\" form=\"views\">Recordings<\/button>/a <button type=\"submit\" name=\"view\" value=\"Links\" form=\"views\">Links<\/button>" views.php
sed -i "/if(\$_GET\['view'\] == \"Daily Charts\"){include('history.php');}/a if(\$_GET['view'] == \"Links\"){include('scripts/links.php');}" views.php
sed -i "/if(\$_GET\['view'\] == \"Links\"){include('scripts\/links.php');}/a if(\$_GET['view'] == \"QA\"){include('scripts/qa.php');}" views.php
sed -i 's/>Overview</>Przegląd</g' views.php
sed -i "s/>Today's Detections</>Dzisiejsze detekcje</g" views.php
sed -i 's/>Best Recordings</>Najlepsze nagrania</g' views.php
sed -i 's/>Species Stats</>Statystyki gatunków</g' views.php
sed -i 's/>Daily Charts</>Wykresy dzienne</g' views.php
sed -i 's/>Recordings</>Nagrania</g' views.php
sed -i 's/>Spectrogram</>Spektrogram</g' views.php
sed -i 's/>View Log</>Zobacz dziennik</g' views.php
sed -i 's/>Tools</>Narzędzia</g' views.php
sed -i 's/>Weekly Report</>Raport tygodniowy</g' views.php
sed -i 's/>Links</>Linki</g' views.php
sed -i 's/You cannot edit the settings for this installation/Nie możesz edytować ustawień tej instalacji/g' views.php
sed -i 's/<div class="views">n/<div class="views"><br>/g' views.php
sed -i 's/WARNING: Your latitude and longitude are not set properly. Please do so now in Tools -> Settings./OSTRZEŻENIE: Twoja szerokość i długość geograficzna nie są prawidłowo ustawione. Zrób to teraz w Narzędzia -> Ustawienia./g' views.php
sed -i 's/WARNING: Your latitude is not set properly. Please do so now in Tools -> Settings./OSTRZEŻENIE: Twoja szerokość geograficzna nie jest prawidłowo ustawiona. Zrób to teraz w Narzędzia -> Ustawienia./g' views.php
sed -i 's/WARNING: Your longitude is not set properly. Please do so now in Tools -> Settings./OSTRZEŻENIE: Twoja długość geograficzna nie jest prawidłowo ustawiona. Zrób to teraz w Narzędzia -> Ustawienia./g' views.php
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
sed -i 's/>Total</>Łącznie</g' overview.php
sed -i 's/>Today</>Dzisiaj</g' overview.php
sed -i 's/>Last Hour</>Ostatnia godzina</g' overview.php
sed -i 's/>Species Detected Today</>Gatunki wykryte dzisiaj</g' overview.php
sed -i 's/>Total Number of Species</>Całkowita liczba gatunków</g' overview.php
sed -i 's/<h3>Most Recent Detection:/<br><h3>Najnowsza detekcja:/g' overview.php
sed -i 's/<h3>Currently Analyzing/<br><br><h3>Aktualnie analizuje/g' overview.php
sed -i 's/Confidence:/Pewność:/g' overview.php
sed -i 's/Database is busy/Baza danych jest zajęta/g' overview.php
sed -i 's/5 Most Recent Detections/5 najnowszych detekcji/g' overview.php
sed -i 's/Loading.../Ładowanie.../g' overview.php
sed -i 's/Open in new tab/Otwórz w nowej karcie/g' overview.php
sed -i '0,/<style>/{s/<style>/<style> a:link { color: blue; } a:visited { color: blue; } a:active { color: blue; }/}' overview.php
sed -i 's/No Detections For Today./Brak detekcji na dziś./g' overview.php
sed -i 's/View species stats/Zobacz statystyki gatunków/g' overview.php
sed -i 's/Detections Over 30d/Detekcje z ostatnich 30 dni/g' overview.php
sed -i 's/>Close</>Zamknij</g' overview.php
sed -i 's/Are you sure you want to blacklist this image?/Czy na pewno chcesz umieścić ten obraz na czarnej liście?/g' overview.php
sed -i 's/Blacklist this image/Umieść ten obraz na czarnej liście/g' overview.php
sed -i 's/Your system is currently processing a backlog of audio. This can take several hours before normal functionality of your BirdNET-Pi resumes./Twój system przetwarza obecnie zaległe dane audio. Może to potrwać kilka godzin, zanim normalna funkcjonalność BirdNET-Pi zostanie wznowiona./g' overview.php
sed -i 's#<a href="https://wikipedia.org/wiki/<?php echo $sciname;?>"#<a href="https://pl.wikipedia.org/wiki/<?php echo $comname;?>"#g' overview.php
sed -i 's#<a href="https://wikipedia.org/wiki/<?php echo $sciname; ?>"#<a href="https://pl.wikipedia.org/wiki/<?php echo $comname;?>"#g' overview.php
sed -i 's/Species Today/Gatunki dzisiaj/g' overview.php
sed -i 's/Species Total/Gatunki łącznie/g' overview.php
sed -i 's/New Species/Nowe gatunki/g' overview.php
sed -i 's/Rare Species/Rzadkie gatunki/g' overview.php
sed -i 's/detected today!/wykryte dzisiaj!/g' overview.php
sed -i 's/Max confidence/Maksymalna pewność/g' overview.php
sed -i 's/First detection/Pierwsza detekcja/g' overview.php
sed -i 's/Last seen/Ostatnio widziany/g' overview.php
sed -i 's/mo ago/ mies. temu/g' overview.php
sed -i 's/d ago/ dni temu/g' overview.php
sed -i "s/'Detections Over ' + days + 'd'/'Detekcje z ostatnich ' + days + ' dni'/g" overview.php
sed -i "s/Open Today's recordings page/Otwórz stronę dzisiejszych nagrań/g" overview.php
#
# todays_detections.php - Today's finds
sed -i 's/>Number of Detections</>Liczba detekcji</g' todays_detections.php
sed -i 's/>Total</>Łącznie</g' todays_detections.php
sed -i 's/>Today</>Dzisiaj</g' todays_detections.php
sed -i 's/>Last Hour</>Ostatnia godzina</g' todays_detections.php
sed -i 's/>Unique Species Total</>Unikalne gatunki łącznie</g' todays_detections.php
sed -i 's/>Unique Species Today</>Unikalne gatunki dzisiaj</g' todays_detections.php
sed -i 's/>Load 40 More...</>Załaduj 40 więcej...</g' todays_detections.php
sed -i 's#allaboutbirds.org#pl.wikipedia.org#g' todays_detections.php
sed -i 's/guide/wiki/g' todays_detections.php
sed -i 's/Confidence:/Pewność:/g' todays_detections.php
sed -i "s/Today's Detections/Dzisiejsze detekcje/g" todays_detections.php
sed -i "s/Legacy view/Widok Legacy/g" todays_detections.php
sed -i "s/Normal view/Widok normalny/g" todays_detections.php
sed -i "s/Search.../Szukaj.../g" todays_detections.php
sed -i "s/Loading.../Ładowanie.../g" todays_detections.php
sed -i 's/Open in new tab/Otwórz w nowej karcie/g' todays_detections.php
sed -i 's/No Detections For Today./Brak detekcji na dziś./g' todays_detections.php
sed -i '0,/<style>/{s/<style>/<style> a:link { color: blue; } a:visited { color: blue; } a:active { color: blue; }/}' todays_detections.php
sed -i 's/View species stats/Zobacz statystyki gatunków/g' todays_detections.php
sed -i 's/Detections Over 30d/Detekcje z ostatnich 30 dni/g' todays_detections.php
sed -i 's/>Close</>Zamknij</g' todays_detections.php
sed -i 's/Are you sure you want to blacklist this image?/Czy na pewno chcesz umieścić ten obraz na czarnej liście?/g' todays_detections.php
sed -i 's/Blacklist this image/Umieść ten obraz na czarnej liście/g' todays_detections.php
sed -i 's/Delete Detection/Usuń detekcję/g' todays_detections.php
sed -i 's#<a href="https://wikipedia.org/wiki/<?php echo $sciname;?>"#<a href="https://pl.wikipedia.org/wiki/<?php echo $comname;?>"#g' todays_detections.php
sed -i 's/Species Total/Gatunki łącznie/g' todays_detections.php
sed -i 's/Species Today/Gatunki dzisiaj/g' todays_detections.php
#
# stats.php - Best recordings
sed -i 's/Choose a species to load images from Wikimedia Commons/Wybierz gatunek, aby załadować zdjęcia z Wikimedia Commons/g' stats.php
sed -i 's/Occurrences:/Wystąpienia:/g' stats.php
sed -i 's/Max Confidence:/Maksymalna pewność:/g' stats.php
sed -i 's/Best Recording:/Najlepsze nagranie:/g' stats.php
sed -i 's#allaboutbirds.org#pl.wikipedia.org#g' stats.php
sed -i 's/guide/wiki/g' stats.php
sed -i 's/All About Birds/Wikipedia/g' stats.php
sed -i 's/Loading Images from/Ładowanie zdjęć z/g' stats.php
sed -i 's/Choose a species to load images from Flickr./Wybierz gatunek, aby załadować zdjęcia z Flickr./g' stats.php
sed -i 's/Best Recordings for Other Species:/Najlepsze nagrania dla innych gatunków:/g' stats.php
sed -i 's/Sort by alphabetical/Sortuj alfabetycznie/g' stats.php
sed -i 's/Sort by occurrences/Sortuj według wystąpień/g' stats.php
sed -i 's/Open in new tab/Otwórz w nowej karcie/g' stats.php
sed -i '0,/<style>/{s/<style>/<style> a:link { color: blue; } a:visited { color: blue; } a:active { color: blue; }/}' stats.php
sed -i 's#//wikipedia\.org/wiki/\$sciname#//pl\.wikipedia\.org/wiki/\$comname#g' stats.php
sed -i 's/Sort by confidence/Sortuj według pewności/g' stats.php
#
# history.php - Daily graphs
sed -i 's/>Submit Date</>Wyślij datę</g' history.php
sed -i 's/Total Detections For The Day/Całkowita liczba detekcji dla danego dnia/g' history.php
sed -i 's%echo "<img src=\"/Charts/$chart2?nocache=time()\">";%echo " ";%g' history.php
sed -i 's/No Charts for/Brak wykresów dla/g' history.php
#
# play.php - Recordings
sed -i 's/Sort by date/Sortuj według daty/g' play.php
sed -i 's/Sort by confidence/Sortuj według pewności/g' play.php
sed -i 's/>By Species</>Według gatunku</g' play.php
sed -i 's/>By Date</>Według daty</g' play.php
sed -i 's/This file is not delete protected./Ten plik nie jest chroniony przed usunięciem./g' play.php
sed -i 's/This file is not delete protected./Ten plik nie jest chroniony przed usunięciem./g' play.php
sed -i 's/Unable to open file!/Nie można otworzyć pliku!/g' play.php
sed -i 's/You must be authenticated to change the protection of files./Musisz być uwierzytelniony, aby zmienić ochronę plików./g' play.php
sed -i 's/This file is delete protected./Ten plik jest chroniony przed usunięciem./g' play.php
sed -i 's/Sort by alphabetical/Sortuj alfabetycznie/g' play.php
sed -i 's/Sort by occurrences/Sortuj według wystąpień/g' play.php
sed -i 's/No recordings were found./Nie znaleziono nagrań./g' play.php
sed -i 's/They may have been deleted to make space for new recordings. You can modify this setting for the future in Tools/Mogły zostać usunięte, aby zwolnić miejsce na nowe nagrania. Możesz zmienić to ustawienie na przyszłość w Narzędzia/g' play.php
sed -i 's/Only Show Purge Excluded/Pokaż tylko wyłączone z czyszczenia/g' play.php
sed -i 's/This file is not excluded from being purged./Ten plik nie jest wyłączony z czyszczenia./g' play.php
sed -i 's/This file is excluded from being purged./Ten plik jest wyłączony z czyszczenia./g' play.php
sed -i 's/They may have been deleted to make space for new recordings. You can prevent this from happening in the future by clicking the/Mogły zostać usunięte, aby zwolnić miejsce na nowe nagrania. Możesz temu zapobiec w przyszłości, klikając ikonę/g' play.php
sed -i 's/ icon in the top right of a recording./ w prawym górnym rogu nagrania./g' play.php
sed -i 's/You can also modify this behavior globally under /Możesz również zmodyfikować to zachowanie globalnie pod/g' play.php
sed -i 's/>here.</>tutaj.</g' play.php
sed -i 's/Database is busy/Baza danych jest zajęta/g' play.php
sed -i 's/Delete Detection/Usuń detekcję/g' play.php
sed -i 's/"Today"/"Dzisiaj"/g' play.php
sed -i 's/This file has been shifted down in frequency./Ten plik został przesunięty w dół częstotliwości./g' play.php
sed -i 's/This file is not shifted in frequency./Ten plik nie jest przesunięty w częstotliwości./g' play.php
sed -i 's/Sort by confidence/Sortuj według pewności/g' play.php
sed -i 's#wikipedia\.org/wiki/\$sciname#pl\.wikipedia\.org/wiki/\$sciname#g' play.php
sed -i 's#Change Detection#Zmień detekcję#g' play.php
sed -i 's#This file will be deleted when disk space needs to be freed.#Ten plik zostanie usunięty, gdy będzie trzeba zwolnić miejsce na dysku.#g' play.php
sed -i 's#\(>95% usage\)\.# (>95% użycia).#g' play.php
#
# spectrogram.php - Spectrogram
sed -i 's/Gain:/Wzmocnienie:/g' spectrogram.php
sed -i 's/Loading.../Ładowanie.../g' spectrogram.php
sed -i 's/Compression:/Kompresja:/g' spectrogram.php
sed -i 's/Freq shift:/Przesunięcie częstotliwości:/g' spectrogram.php
#
# daily_plot.py - Graph
sed -i 's#\(xlabel="Detections"\)#xlabel="Detekcje"#g' daily_plot.py
sed -i 's#\(xlabel="Hour of Day"\)#xlabel="Godzina dnia"#g' daily_plot.py
sed -i "s#plot_type = 'All'#plot_type = 'Wszystkie'#g" daily_plot.py
sed -i 's#{readings} Last Updated:#{readings} Ostatnia aktualizacja:#g' daily_plot.py
#
# plotly_streamlit.py - Species statistics
sed -i 's/Single Day View/Widok pojedynczego dnia/g' plotly_streamlit.py
sed -i 's/Resample Resolution/Rozdzielczość ponownego próbkowania/g' plotly_streamlit.py
sed -i 's/Select resolution for species - DAILY provides time series/Wybierz rozdzielczość dla gatunków - CODZIENNIE zapewnia szeregi czasowe/g' plotly_streamlit.py
sed -i 's/Select start and end date, if same date get a clockplot for a single day/Wybierz datę początkową i końcową, jeśli data jest taka sama, uzyskaj wykres zegarowy dla pojedynczego dnia/g' plotly_streamlit.py
sed -i 's/Select if you want single day view, unselect for multi-day views/Wybierz, jeśli chcesz widok pojedynczego dnia, odznacz dla widoków wielodniowych/g' plotly_streamlit.py
sed -i 's/Raw/Surowe/g' plotly_streamlit.py
sed -i 's/15 minutes/15 minut/g' plotly_streamlit.py
sed -i 's/Hourly/Godzinowo/g' plotly_streamlit.py
sed -i 's/DAILY/CODZIENNIE/g' plotly_streamlit.py
sed -i 's/Which bird would you like to explore for the dates/Którego ptaka chciałbyś zbadać dla tych dat/g' plotly_streamlit.py
sed -i 's/Species in Date Range/Gatunki w zakresie dat/g' plotly_streamlit.py
sed -i "s/' to '/' - '/g" plotly_streamlit.py
sed -i 's/Total Detect:/Całkowita liczba detekcji:/g' plotly_streamlit.py
sed -i 's/Download plot as a png/Pobierz wykres jako PNG/g' plotly_streamlit.py
sed -i 's/Zoom/Powiększ/g' plotly_streamlit.py
sed -i 's/Pan/Przesuń/g' plotly_streamlit.py
sed -i 's/Box Select/Wybór ramką/g' plotly_streamlit.py
sed -i 's/Lasso Select/Wybór Lasso/g' plotly_streamlit.py
sed -i 's/Zoom in/Powiększ/g' plotly_streamlit.py
sed -i 's/Zoom out/Pomniejsz/g' plotly_streamlit.py
sed -i 's/Auto scale/Automatyczne skalowanie/g' plotly_streamlit.py
sed -i 's/Reset views/Resetuj widoki/g' plotly_streamlit.py
sed -i 's/Produces with Plotly/Wyprodukowano za pomocą Plotly/g' plotly_streamlit.py
sed -i 's/Confidence Max:/Maksymalna pewność:/g' plotly_streamlit.py
sed -i 's/Reviewed/Sprawdzone/g' plotly_streamlit.py
sed -i 's/Available recordings/Dostępne nagrania/g' plotly_streamlit.py
sed -i 's/View fullscreen/Zobacz pełny ekran/g' plotly_streamlit.py
sed -i 's/Made with Streamlit/Stworzone za pomocą Streamlit/g' plotly_streamlit.py
sed -i 's/RUNNING.../URUCHAMIANIE.../g' plotly_streamlit.py
sed -i 's/Please wait.../Proszę czekać.../g' plotly_streamlit.py
sed -i 's/Date to View/Data do podglądu/g' plotly_streamlit.py
sed -i 's/Select Number of Birds to Show/Wybierz liczbę ptaków do wyświetlenia/g' plotly_streamlit.py
sed -i 's/sampling interval./interwał próbkowania./g' plotly_streamlit.py
sed -i 's/<br>for/<br>dla/g' plotly_streamlit.py
sed -i 's/Species in/Gatunki w/g' plotly_streamlit.py
sed -i 's/Max:/Maks:/g' plotly_streamlit.py
sed -i 's/Median:/Mediana:/g' plotly_streamlit.py
sed -i 's/RECORDING NOT AVAILABLE :(/NAGRANIE NIEDOSTĘPNE :(/g' plotly_streamlit.py
sed -i 's/Date Range/Zakres dat/g' plotly_streamlit.py
sed -i 's/Select Color Pallet for Daily Detections/Wybierz paletę kolorów dla codziennych detekcji/g' plotly_streamlit.py
sed -i 's/Alla/Wszystkie/g' plotly_streamlit.py
sed -i "s/'<b>Top'/<b>Top'/g" plotly_streamlit.py
sed -i "s/' Species For '/' Gatunki dla '/g" plotly_streamlit.py
sed -i "s/ '<b>Daily ' + str(start_date) + ' Detections on ' + resample_sel + ' interval</ '<b>Codzienne ' + str(start_date) + ' Detekcje w interwale ' + resample_sel + '</g" plotly_streamlit.py
sed -i "s/subplot_titles=('<b>Top ' +/subplot_titles=('<b>Top ' +/g" plotly_streamlit.py
sed -i "s/+ str(top_N) + /+ str(top_N) + ','+ /g" plotly_streamlit.py
#
# config.php - Settings
sed -i 's/mailto:tim@birdweather.com/mailto:birdnetpi@birdweather.com/g' config.php
#
# links.php - Links
sed -i 's/Program-related links/Linki związane z programem/g' links.php
sed -i 's/Program source/Źródło programu/g' links.php
sed -i 's/Wiki help page/Strona pomocy Wiki/g' links.php
sed -i 's/Questions and answers about BirdNET-Pi (English)/Pytania i odpowiedzi dotyczące BirdNET-Pi (Angielski)/g' links.php
sed -i 's/Own links/Własne linki/g' links.php
sed -i 's/Other BirdNET-Pi/Inne BirdNET-Pi/g' links.php
sed -i 's/Please email if you have any questions or would like to do your own installation/Wyślij e-mail, jeśli masz pytania lub chciałbyś przeprowadzić własną instalację/g' links.php
#
# weekly_report.php - Weekly report
sed -i 's/Report week/Raport tygodniowy/g' weekly_report.php
sed -i 's/Top 10 Species/Top 10 gatunków/g' weekly_report.php
sed -i 's/Species Detected for the First Time/Gatunki wykryte po raz pierwszy/g' weekly_report.php
sed -i 's/No new species were seen this week/W tym tygodniu nie wykryto nowych gatunków/g' weekly_report.php
sed -i 's/percentages are calculated relative to week/procenty są obliczane względem tygodnia/g' weekly_report.php