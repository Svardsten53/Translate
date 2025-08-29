#!/bin/bash
# set -e # Abort on error

# Stop "core services" before modification runs
stop_core_services.sh
echo "Core services stopped"

# Backup of custom files
cd ~/BirdNET-Pi/Translate/skript
sudo ./6_backupegna.sh && echo "Backup of custom files created"

# Remove old Translate folder
sudo rm -rf ~/BirdNET-Pi/Translate_gammal && echo "Old Translate backup removed"
sudo rm -rf ~/BirdNET-Pi/Translate_old && echo "Old Translate backup removed"

# Rename old Translate folder
cd ~/BirdNET-Pi
mv Translate Translate_old && echo "Translate folder renamed"

# Download and extract new Translate.zip
wget -O Translate.zip "https://raw.githubusercontent.com/Svardsten53/Translate/main/france/Translate.zip" && unzip -o Translate.zip && rm Translate.zip
echo "New Translate.zip downloaded, extracted, and removed"

# Set permissions
sudo chown -R $USER:$USER ~/BirdNET-Pi /home/$USER/BirdSongs
sudo chmod -R g+rw ~/BirdNET-Pi /home/$USER/BirdSongs
sudo chmod u+x Translate/skript/*.sh
echo "File permissions set"

# Set parameters for Git
git checkout -f main && git pull -f
update_birdnet.sh
echo "BirdNET-Pi updated"

# Restore custom files from old Translate folder
cp -r -n ~/BirdNET-Pi/Translate_old/egnafiler/ ~/BirdNET-Pi/Translate/ && echo "Custom files restored"

# Restore other scripts, files, and directories from old Translate folder if they are newer
cp -n ~/BirdNET-Pi/Translate_old/skript/* ~/BirdNET-Pi/Translate/skript/ && echo "Other scripts, files, and directories restored"

# Remove old Translate folder
# sudo rm -rf ~/BirdNET-Pi/Translate_old && echo "Old Translate removed"

# Adapt scripts with current user
cd Translate/skript
sudo sed -i "s|/home/userid-att-ändra|$HOME|g" 2_backuporg.sh 5_kopieraegna.sh 3_restoreorg.sh 6_backupegna.sh 7_translate.sh 8_restoreegna.sh
echo "Current system user updated in scripts"

# Run backup and translation scripts
sudo ./2_backuporg.sh && echo "Original files saved"
sudo ./5_kopieraegna.sh && echo "Custom files copied"
sudo ./7_translate.sh && echo "Translation and adaptation to own language done"
sudo ./8_restoreegna.sh && echo "Custom modified files restored"

# Set permissions for specific files
sudo chown $USER:$USER ~/BirdNET-Pi/scripts/{links.php,qa.php}
sudo chmod 777 ~/BirdNET-Pi/scripts/{links.php,qa.php}
echo "Permissions set for links.php and qa.php"

# Restart services after modification
restart_services.sh
echo "Services started"

cd ~/BirdNET-Pi
echo "* * * * * Update modification complete! * * * * *"