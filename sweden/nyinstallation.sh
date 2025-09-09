#!/bin/bash
# set -e  # Avbryt vid fel

# Stopp av "core services" innan modifiering körs
stop_core_services.sh
echo "Core services stoppade"

# Byt namn på gammal Translate-mapp när den följt med i migrering
cd ~/BirdNET-Pi
mv Translate Translate_old && echo "Translate-mapp omdöpt"

# Ladda ner och extrahera Translate.zip
wget -O Translate.zip "https://svardsten.com/birdnetpi/nachtzuster/Translate.zip" && unzip -o Translate.zip && rm Translate.zip
echo "Translate.zip nedladdad, extraherad och borttagen"

# Sätt rättigheter
# sudo chown -R $USER:$USER $HOME/BirdNET-Pi /home/$USER/BirdSongs
sudo chown -R $USER:$USER $HOME/BirdNET-Pi
# sudo chmod -R g+rw $HOME/BirdNET-Pi /home/$USER/BirdSongs
sudo chmod -R g+rw $HOME/BirdNET-Pi
sudo chmod u+x Translate/skript/*.sh
echo "Filbehörigheter satta"

# Återställ övriga skript, filer och kataloger från gammal Translate-mapp om de är nyare eller inte finns i ny Translate-mapp.
cp -n ~/BirdNET-Pi/Translate_old/skript/* ~/BirdNET-Pi/Translate/skript/ && echo "Övriga skript och filer återställda"

# Sätt parametrar för Git
git checkout -f main && git pull -f
echo "Git-parametrar satta"

# Uppdatera BirdNET-Pi
update_birdnet.sh
echo "BirdNET-Pi uppdaterad"

# Anpassa skript
cd Translate/skript
sudo sed -i "s|/home/userid-att-ändra|$HOME|g" 2_backuporg.sh 5_kopieraegna.sh 3_restoreorg.sh 6_backupegna.sh 7_translate.sh 8_restoreegna.sh
echo "Aktuell systemanvändare uppdaterad i skript"

# Skriv in plats i index.php
echo 'export PLATS="Skriv in din plats här"' >> ~/.bashrc && source ~/.bashrc
source ~/.bashrc && sudo sed -i "s|ort-eller-plats|${PLATS}|g" ~/BirdNET-Pi/Translate/egnafilerorg/index.php
echo "Plats inskriven i index.php"

# Kör backup och översättningsskript
sudo ./2_backuporg.sh && echo "Originalfiler sparade"
sudo ./5_kopieraegna.sh && echo "Egna filer kopierade"
sudo ./7_translate.sh && echo "Översättning och anpassning till svenska gjord"

# Sätt behörigheter för specifika filer
sudo chown $USER:$USER ~/BirdNET-Pi/scripts/{links.php,qa.php}
sudo chmod 777 ~/BirdNET-Pi/scripts/{links.php,qa.php}
echo "Behörigheter satta för links.php och qa.php"

# Omstart av "services" efter modifieringen
restart_services.sh
echo "Services startade"

cd ~/BirdNET-Pi
echo "* * * * * Modifiering av nyinstallationen klar! * * * * *"


