#!/bin/bash
# set -e  # Avbryt vid fel

# Stopp av "core services" innan modifiering körs
stop_core_services.sh
echo "Core services stoppade"

# Backup av egna filer
cd ~/BirdNET-Pi/Translate/skript
sudo ./6_backupegna.sh && echo "Backup gjord på egna filer"

# Ta bort gammal Translate-mapp
sudo rm -rf ~/BirdNET-Pi/Translate_gammal && echo "Gammal Translate-backup borttagen"
sudo rm -rf ~/BirdNET-Pi/Translate_old && echo "Gammal Translate-backup borttagen"

# Byt namn på gammal Translate-mapp
cd ~/BirdNET-Pi
mv Translate Translate_old && echo "Translate-mapp omdöpt"

# Ladda ner och extrahera ny Translate.zip
wget -O Translate.zip "https://raw.githubusercontent.com/Svardsten53/Translate/test/sweden/Translate.zip" && unzip -o Translate.zip && rm Translate.zip
echo "Ny Translate.zip nedladdad, extraherad och borttagen"

# Sätt rättigheter
sudo chown -R $USER:$USER ~/BirdNET-Pi /home/$USER/BirdSongs
sudo chmod -R g+rw ~/BirdNET-Pi /home/$USER/BirdSongs
sudo chmod u+x Translate/skript/*.sh
echo "Filbehörigheter satta"

# Sätt parametrar för Git
git checkout -f main && git pull -f
update_birdnet.sh
echo "BirdNET-Pi uppdaterad"

# Återställ egna filer från gammal Translate-mapp
cp -r -n ~/BirdNET-Pi/Translate_old/egnafiler/ ~/BirdNET-Pi/Translate/ && echo "Egna filer återställda"

# Återställ övriga skript, filer och kataloger från gammal Translate-mapp om de är nyare
cp -n ~/BirdNET-Pi/Translate_old/skript/* ~/BirdNET-Pi/Translate/skript/ && echo "Övriga skript, filer och kataloger återställda"

# Ta bort gammal Translate-mapp
# sudo rm -rf ~/BirdNET-Pi/Translate_old && echo "Gammal Translate borttagen"

# Anpassa skript med aktuell användare
cd Translate/skript
sudo sed -i "s|/home/userid-att-ändra|$HOME|g" 2_backuporg.sh 5_kopieraegna.sh 3_restoreorg.sh 6_backupegna.sh 7_translate.sh 8_restoreegna.sh replace.php
echo "Aktuell systemanvändare uppdaterad i skript"

# Kör backup- och översättningsskript
sudo ./2_backuporg.sh && echo "Originalfiler sparade"
sudo ./5_kopieraegna.sh && echo "Egna filer kopierade"
sudo ./7_translate.sh && echo "Översättning och anpassning till svenska gjord"
sudo ./8_restoreegna.sh && echo "Egenmodifierade filer återställda"

# Sätt behörigheter för specifika filer
sudo chown $USER:$USER ~/BirdNET-Pi/scripts/{links.php,qa.php}
sudo chmod 777 ~/BirdNET-Pi/scripts/{links.php,qa.php}
echo "Behörigheter satta för links.php och qa.php"

# Omstart av "services" efter modifieringen
restart_services.sh
echo "Services startade"

cd ~/BirdNET-Pi
echo "* * * * * Modifiering av uppdateringen klar! * * * * *"
