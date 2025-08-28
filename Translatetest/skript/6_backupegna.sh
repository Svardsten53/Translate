#!/bin/bash
#
# Detta skript hämtar alla egenmodifierade html- och php-filer, flaggbild, caddyfil samt exkluderingslistan för arter
# och lägger dessa som backup.
# Filerna index2.php och views2.php sparas inte längre eftersom de för närvarande inte fungerar i Nachtzuster-versionen.
# Uppdaterat 2025-08-07  /L-Å
#
rm /home/userid-att-ändra/BirdNET-Pi/Translate/egnafiler/*.*
cp /home/userid-att-ändra/BirdNET-Pi/scripts/links.php /home/userid-att-ändra/BirdNET-Pi/Translate/egnafiler
cp /home/userid-att-ändra/BirdNET-Pi/exclude_species_list.txt /home/userid-att-ändra/BirdNET-Pi/Translate/egnafiler
cp /home/userid-att-ändra/BirdNET-Pi/whitelist_species_list.txt /home/userid-att-ändra/BirdNET-Pi/Translate/egnafiler
cp /home/userid-att-ändra/BirdNET-Pi/homepage/images/flagga.jpg /home/userid-att-ändra/BirdNET-Pi/Translate/egnafiler
cp /home/userid-att-ändra/BirdNET-Pi/homepage/images/feather.png /home/userid-att-ändra/BirdNET-Pi/Translate/egnafiler
cp /home/userid-att-ändra/BirdNET-Pi/homepage/index.php /home/userid-att-ändra/BirdNET-Pi/Translate/egnafiler
# cp /home/userid-att-ändra/BirdNET-Pi/homepage/index2.php /home/userid-att-ändra/BirdNET-Pi/Translate/egnafiler
cp /home/userid-att-ändra/BirdNET-Pi/homepage/views.php /home/userid-att-ändra/BirdNET-Pi/Translate/egnafiler
# cp /home/userid-att-ändra/BirdNET-Pi/homepage/views2.php /home/userid-att-ändra/BirdNET-Pi/Translate/egnafiler
cp /home/userid-att-ändra/BirdNET-Pi/homepage/style.css /home/userid-att-ändra/BirdNET-Pi/Translate/egnafiler
cp /home/userid-att-ändra/BirdNET-Pi/model/labels.txt /home/userid-att-ändra/BirdNET-Pi/Translate/egnafiler
cp /home/userid-att-ändra/BirdNET-Pi/scripts/birds.db /home/userid-att-ändra/BirdNET-Pi/Translate/egnafiler
cp /home/userid-att-ändra/BirdNET-Pi/scripts/daily_plot.py /home/userid-att-ändra/BirdNET-Pi/Translate/egnafiler
cp /home/userid-att-ändra/BirdNET-Pi/scripts/qa.php /home/userid-att-ändra/BirdNET-Pi/Translate/egnafiler
cp /home/userid-att-ändra/BirdNET-Pi/birdnet.conf /home/userid-att-ändra/BirdNET-Pi/Translate/egnafiler
cp /home/userid-att-ändra/BirdNET-Pi/model/labels.txt /home/userid-att-ändra/BirdNET-Pi/Translate/egnafiler
cp /etc/caddy/Caddyfile /home/userid-att-ändra/BirdNET-Pi/Translate/egnafiler



