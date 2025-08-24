#!/bin/bash
# set -e # Abort on error

# Stop "core services" before modification runs
stop_core_services.sh
echo "Core services stopped"

# Rename old Translate folder that came with migration
cd ~/BirdNET-Pi
mv Translate Translate_old && echo "Translate folder renamed"

# Download and extract Translate.zip
wget -O Translate.zip "wget https://raw.githubusercontent.com/Svardsten53/Translate/main/germany/Translate.zip" && unzip -o Translate.zip && rm Translate.zip
echo "Translate.zip downloaded, extracted, and removed"

# Set permissions
sudo chown -R $USER:$USER $HOME/BirdNET-Pi /home/$USER/BirdSongs
sudo chmod -R g+rw $HOME/BirdNET-Pi /home/$USER/BirdSongs
sudo chmod u+x Translate/skript/*.sh
echo "File permissions set"

# Restore other scripts, files, and directories from old Translate folder if they are newer or don't exist in new Translate folder.
cp -n ~/BirdNET-Pi/Translate_old/skript/* ~/BirdNET-Pi/Translate/skript/ && echo "Other scripts and files restored"

# Set parameters for Git
git checkout -f main && git pull -f
echo "Git parameters set"

# Update BirdNET-Pi
update_birdnet.sh
echo "BirdNET-Pi updated"

# Adapt scripts
cd Translate/skript
sudo sed -i "s|/home/userid-att-ändra|$HOME|g" 2_backuporg.sh 5_kopieraegna.sh 3_restoreorg.sh 6_backupegna.sh 7_translate.sh 8_restoreegna.sh
echo "Current system user updated in scripts"

# Write location to index.php
echo 'export PLATS="Write your location here' >> ~/.bashrc && source ~/.bashrc
source ~/.bashrc && sudo sed -i "s|ort-eller-plats|${PLATS}|g" ~/BirdNET-Pi/Translate/egnafilerorg/index.php
echo "Location written to index.php"

# Run backup and translation scripts
sudo ./2_backuporg.sh && echo "Original files saved"
sudo ./5_kopieraegna.sh && echo "Custom files copied"
sudo ./7_translate.sh && echo "Translation and adaptation to own language done"

# Set permissions for specific files
sudo chown $USER:$USER ~/BirdNET-Pi/scripts/{links.php,qa.php}
sudo chmod 777 ~/BirdNET-Pi/scripts/{links.php,qa.php}
echo "Permissions set for links.php and qa.php"

# Restart services after modification
restart_services.sh
echo "Services started"

cd ~/BirdNET-Pi
echo "* * * * * New installation modification complete! * * * * *"
