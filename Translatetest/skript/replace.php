<?php

//
// This script replaces two text blocks in views.php to add custom selection to the menu and QA page. The script is called from 7_translate.sh.
//
// 2025-08-26  L-Å
//
//


$filnamn = "/home/userid-att-ändra/BirdNET-Pi/homepage/views.php";

// Läs in filen
$innehall = file_get_contents($filnamn);

// ---- FIX: Följande rader tar bort extra blanksteg i början av varje rad ----
$gammalt_block = <<<'EOT'
<div class="topnav" id="myTopnav">
  <button type="submit" name="view" value="Overview" form="views">Overview</button>
  <button type="submit" name="view" value="Todays Detections" form="views">Today's Detections</button>
  <button type="submit" name="view" value="Spectrogram" form="views">Spectrogram</button>
  <button type="submit" name="view" value="Species Stats" form="views">Best Recordings</button>
  <button type="submit" name="view" value="Streamlit" form="views">Species Stats</button>
  <button type="submit" name="view" value="Daily Charts" form="views">Daily Charts</button>
  <button type="submit" name="view" value="Weekly Report" form="views">Weekly Report</button>
  <button type="submit" name="view" value="Recordings" form="views">Recordings</button>
  <button type="submit" name="view" value="View Log" form="views">View Log</button>
  <button type="submit" name="view" value="Tools" form="views">Tools<?php if(isset($_SESSION['behind']) && intval($_SESSION['behind']) >= 50 && ($config['SILENCE_UPDATE_INDICATOR'] != 1)){ $updatediv = ' <div class="updatenumber">'.$_SESSION["behind"].'</div>'; } else { $updatediv = ""; } echo $updatediv; ?></button>
  <button type="button" href="javascript:void(0);" class="icon" onclick="myFunction()"><img src="images/menu.png"></button>
</div>
EOT;
$gammalt_block = preg_replace('/^\s+/', '', $gammalt_block);

$nytt_block = <<<'EOT'
<div class="topnav" id="myTopnav">
  <button type="submit" name="view" value="Overview" form="views">Overview</button>
  <button type="submit" name="view" value="Todays Detections" form="views">Today's Detections</button>
  <button type="submit" name="view" value="Spectrogram" form="views">Spectrogram</button>
  <button type="submit" name="view" value="Species Stats" form="views">Best Recordings</button>
  <button type="submit" name="view" value="Streamlit" form="views">Species Stats</button>
  <button type="submit" name="view" value="Daily Charts" form="views">Daily Charts</button>
  <button type="submit" name="view" value="Weekly Report" form="views">Weekly Report</button>
  <button type="submit" name="view" value="Recordings" form="views">Recordings</button>
  <button type="submit" name="view" value="View Log" form="views">View Log</button>
  <button type="submit" name="view" value="Links" form="views">Links</button>
  <button type="submit" name="view" value="Tools" form="views">Tools<?php if(isset($_SESSION['behind']) && intval($_SESSION['behind']) >= 50 && ($config['SILENCE_UPDATE_INDICATOR'] != 1)){ $updatediv = ' <div class="updatenumber">'.$_SESSION["behind"].'</div>'; } else { $updatediv = ""; } echo $updatediv; ?></button>
  <button type="button" href="javascript:void(0);" class="icon" onclick="myFunction()"><img src="images/menu.png"></button>
</div>
EOT;
$nytt_block = preg_replace('/^\s+/', '', $nytt_block);

// Ersätt
$innehall = str_replace($gammalt_block, $nytt_block, $innehall);

// Skriv tillbaka
file_put_contents($filnamn, $innehall);

echo "Första blocket ersatt!\n";

// ---- FIX: Följande rader tar bort extra blanksteg i början av varje rad ----
$gammalt_block = <<<'EOT'
if($_GET['view'] == "Spectrogram"){include('spectrogram.php');}
  if($_GET['view'] == "View Log"){echo "<body style=\"scroll:no;overflow-x:hidden;\"><iframe style=\"width:calc( 100% + 1em);\" src=\"log\"></iframe></body>";}
  if($_GET['view'] == "Overview"){include('overview.php');}
  if($_GET['view'] == "Todays Detections"){include('todays_detections.php');}
  if($_GET['view'] == "Kiosk"){$kiosk = true;include('todays_detections.php');}
  if($_GET['view'] == "Species Stats"){include('stats.php');}
  if($_GET['view'] == "Weekly Report"){include('weekly_report.php');}
  if($_GET['view'] == "Streamlit"){echo "<iframe src=\"stats\"></iframe>";}
  if($_GET['view'] == "Daily Charts"){include('history.php');}
  if($_GET['view'] == "Tools"){
EOT;
$gammalt_block = preg_replace('/^\s+/', '', $gammalt_block);

$nytt_block = <<<'EOT'
if($_GET['view'] == "Spectrogram"){include('spectrogram.php');}
  if($_GET['view'] == "View Log"){echo "<body style=\"scroll:no;overflow-x:hidden;\"><iframe style=\"width:calc( 100% + 1em);\" src=\"log\"></iframe></body>";}
  if($_GET['view'] == "Overview"){include('overview.php');}
  if($_GET['view'] == "Todays Detections"){include('todays_detections.php');}
  if($_GET['view'] == "Kiosk"){$kiosk = true;include('todays_detections.php');}
  if($_GET['view'] == "Species Stats"){include('stats.php');}
  if($_GET['view'] == "Weekly Report"){include('weekly_report.php');}
  if($_GET['view'] == "Streamlit"){echo "<iframe src=\"stats\"></iframe>";}
  if($_GET['view'] == "Daily Charts"){include('history.php');}
  if($_GET['view'] == "Links"){include('scripts/links.php');}
  if($_GET['view'] == "QA"){include('scripts/qa.php');}
  if($_GET['view'] == "Tools"){
EOT;
$nytt_block = preg_replace('/^\s+/', '', $nytt_block);

// Ersätt
$innehall = str_replace($gammalt_block, $nytt_block, $innehall);

// Skriv tillbaka
file_put_contents($filnamn, $innehall);

echo "Andra blocket ersatt!\n";

?>
