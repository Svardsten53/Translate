#!/bin/bash
#
# Detta skript skriver tillbaks de egenmodifierade filer man tagit backup på före uppdatering av programmet, t ex index.php om man lagt in väderdata där och links.php om länkarna har modifierats.
# Filen style.css kopieras bara över om kommentaren tas bort, samma för views.php. Nödvändig ändring för att göra plats för väderdata med mera sker nu automatiskt i anpassningen. Om man gjort egna modifieringar kan kommentaren tas bort.
# Samma sak gäller för filen daily_plot.py.
# Filerna index2.php och views2.php kopieras inte tillbaks, eftersom de för närvarande inte fungerar i Nachtzuster. De finns dock sparade från tidigare installation.
# Före uppdatering av BirdNET-Pi måste först backup på filerna göras med 6_backupegna.sh innan uppdatering sker.
# Uppdaterat 2025-04-22  /L-Å 
#
cp /home/userid-att-ändra/BirdNET-Pi/Translate/egnafiler/index.php /home/userid-att-ändra/BirdNET-Pi/homepage/index.php
# cp /home/userid-att-ändra/BirdNET-Pi/Translate/egnafiler/index2.php /home/userid-att-ändra/BirdNET-Pi/homepage/index2.php
# cp /home/userid-att-ändra/BirdNET-Pi/Translate/egnafiler/views.php /home/userid-att-ändra/BirdNET-Pi/homepage/views.php
# cp /home/userid-att-ändra/BirdNET-Pi/Translate/egnafiler/views2.php /home/userid-att-ändra/BirdNET-Pi/homepage/views2.php
# cp /home/userid-att-ändra/BirdNET-Pi/Translate/egnafiler/style.css /home/userid-att-ändra/BirdNET-Pi/homepage/style.css
cp /home/userid-att-ändra/BirdNET-Pi/Translate/egnafiler/links.php /home/userid-att-ändra/BirdNET-Pi/scripts/links.php
# cp /home/userid-att-ändra/BirdNET-Pi/Translate/egnafiler/daily_plot.py /home/userid-att-ändra/BirdNET-Pi/scripts/daily_plot.py
# cp /home/userid-att-ändra/BirdNET-Pi/Translate/egnafiler/qa.php /home/userid-att-ändra/BirdNET-Pi/scripts/qa.php
