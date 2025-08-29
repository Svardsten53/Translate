<?php

$requestUri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
if (strpos($requestUri, '/api/v1/') === 0) {
  include_once 'scripts/api.php';
  die();
}

/* Prevent XSS input */
$_GET   = filter_input_array(INPUT_GET, FILTER_SANITIZE_STRING);
$_POST  = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);
require_once 'scripts/common.php';
$config = get_config();
$site_name = get_sitename();
$color_scheme = get_color_scheme();
set_timezone();

?>
<!DOCTYPE html>
<html lang="en">
<title><?php echo $site_name; ?></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link id="iconLink" rel="shortcut icon" sizes=85x85 href="images/bird.png" />
<link rel="stylesheet" href="<?php echo $color_scheme . '?v=' . date('n.d.y', filemtime($color_scheme)); ?>">
<link rel="stylesheet" type="text/css" href="static/dialog-polyfill.css" />
<body>
<div class="banner">
  <div class="logo">
<?php if(isset($_GET['logo'])) {
echo "<a href=\"https://github.com/Nachtzuster/BirdNET-Pi.git\" target=\"_blank\"><img style=\"width:60;height:60;\" src=\"images/bird.png\"></a>";
} else {
echo "<a href=\"https://github.com/Nachtzuster/BirdNET-Pi.git\" target=\"_blank\"><img src=\"images/bird.png\"></a>";
}?>
  </div>


  <div class="stream">
<?php
if(isset($_GET['stream'])){
  ensure_authenticated('You cannot listen to the live audio stream');
      echo "
  <audio controls autoplay><source src=\"/stream\"></audio>
  </div>
  <h1><img src=\"images/feather.png\" width=\"30\" height=\"45\" alt=\"BirdNET-Pi\">&nbsp;<a href=\"\">BirdNET-Pi</a>&nbsp; &nbsp; <a href=\"\">ort-eller-plats</a>&nbsp;<img src=\"images/flagga.jpg\" width=\"45\" height=\"30\" alt=\"Sweden\">&nbsp;</h1>
  </div>";

/* Ta bort kommentarsmarkeringarna före och efter kodraden för att visa meddelande i rött under rubriken */
/* 
?> <p align="center" style="color:red; font-size:18px; margin-top: 0; margin-bottom: 5;">Uppgradering av systemet pågår</p> <?php
*/

} else {
    echo "
  <form action=\"index.php\" method=\"GET\">
    <button type=\"submit\" name=\"stream\" value=\"play\">Live Audio</button>
  </form>
  </div>
  <h1><img src=\"images/feather.png\" width=\"30\" height=\"45\" alt=\"BirdNET-Pi\">&nbsp;<a href=\"\">BirdNET-Pi</a>&nbsp; &nbsp; <a href=\"\">ort-eller-plats</a>&nbsp;<img src=\"images/flagga.jpg\" width=\"45\" height=\"30\" alt=\"Sweden\">&nbsp;</h1>
  </div>";

/* Ta bort kommentarsmarkeringarna före och efter kodraden för att visa meddelande i rött under rubriken */
/* 
?> <p align="center" style="color:red; font-size:18px; margin-top: 0; margin-bottom: 5;">Uppgradering av systemet pågår</p> <?php
*/


}
if(isset($_GET['filename'])) {
  $filename = $_GET['filename'];
echo "
<iframe src=\"views.php?view=Recordings&filename=$filename\"></iframe>";
} else {
  echo "
<iframe src=\"views.php\"></iframe>";
}