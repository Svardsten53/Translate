<html>
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
.servicecontrols button,.servicecontrols button {
  border: 2px solid black;
  background-color: rgb(219, 255, 235);
  padding: 5px;
  width: 30%;
}
</style>
<br>
<center>
<h3>How does it work technically?</h3>
The program listens continuously and splits the audio into 15-second intervals. Each interval is then divided into 3-second sections that are compared to an analysis model. If the minimum confidence value you've defined in the settings is met, a hit for that species is registered. Thus, multiple hits can occur for each fifteen-second interval, either by different species or the same species. All hits within the fifteen-second interval get the same timestamp. This is why you can sometimes see multiple hits for the same species at the exact same time. Under the "Log" option in the menu, you can see how the program works. It can sometimes take about 30 seconds before the log is displayed.
<br><br>
<h3>Does the program cost anything?</h3>
No, according to the license under which BirdNET-Pi runs, it is free and no one is allowed to make money from it. Only hardware costs are added.
<br><br>
<h3>How far back are recordings saved?</h3>
It depends on the size of the memory card/SSD memory, but several years. When the memory is full, the oldest recordings are deleted. The administrator can protect recordings from being deleted, and they will then remain.
<br><br>
<h3>Why are there sometimes errors in species identification?</h3>
The analysis model is based on sounds from a large number of individuals who all have individual calls, and the model therefore consists of an average of all of these, which is why there can sometimes be errors. New and refined analysis models will come over time.
<br><br>
<h3>Why can you hear a completely different species than the one the recording says?</h3>
Several species may be present on a recording, and the species identification does not necessarily apply to the one that is heard the strongest. The system perceives fainter sounds than the human ear and can therefore find and identify fainter sounds than we can hear. The louder sound may be on another recording with the same timestamp.
<br><br>
<h3>Is it possible to listen to a sound you heard later if it's not among the finds in the system?</h3>
No, generally not. There is no continuous recording saved. If you know the approximate time you heard the sound, the system administrator can search the database for the recordings made around the same time, and if you are lucky, the sound you heard may be included in the recording for another species.
<br><br>
<h3>Is there an option for further information about a specific species?</h3>
Most blue-highlighted species names are clickable, as are the small icons to the right of the species names, and a new tab then opens for information in English and Swedish respectively. Under the "Best Recordings" menu option, images are downloaded from Flickr when you select a certain species. Under the "Species Statistics" menu option, you can get information at the species level about the occurrence of a certain species for the time you choose.
<br><br>
<h3>How old is the weather information displayed at the top under the menu bar?</h3>
SMHI updates the information every hour, and it is the user's web browser that downloads the data directly from SMHI. The function must be installed separately for each installation.
<br><br>
<h3>What does the small red symbol to the right of the species name mean?</h3>
The symbol is clickable and shows the occurrence of the species over the last 30 days, as well as the trend.
<br><br>
<h3>What is the cost if I want to install my own system, and how do I do it?</h3>
The program itself (which runs in Linux) is free, and the hardware costs about 1500 SEK, depending on what you want in terms of microphone cable, storage media, and mounting box for the computer itself. Translation and adaptation to Swedish are available in the form of a number of scripts that you run during installation and after each upgrade. Send a message to birdnet@svardsten.com for more information.
<br><br>
<h3>Can the system be installed outdoors?</h3>
There are no problems with having the computer outdoors as long as you have access to electricity and it is protected from moisture in, for example, a plastic box. Heat in the summer is a bigger problem than cold in the winter. WiFi works as communication if you have good enough coverage for it.
<br><br>
<h3>Can human voices be recorded?</h3>
Yes, human speech and other things can also be heard on a recording. However, it is possible to activate a privacy shield that prevents the recording from being saved if human speech is heard at the same time. One should be aware that the system can hear voices outside one's own property. More info is available from the <a href="https://www.imy.se/" target="_blank" style="color:blue" rel="noopener noreferrer">Swedish Authority for Privacy Protection</a>.
<br><br>
<h3>How many installations are there in Sweden?</h3>
On the website <a href="https://app.birdweather.com" target="_blank" style="color:blue" rel="noopener noreferrer">BirdWeather</a>, there are about twenty installations visible in Sweden, and there are probably a few more. On this page, you can click on an installation (green drop) and then see statistics and also play back calls. The dark green drops represent occurrences of BirdWeather PUC, which uses a similar technology.
<br><br>
</center>
</div>