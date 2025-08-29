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
<h3>Hur fungerar det rent tekniskt?</h3>
Programmet lyssnar kontinuerligt och delar upp ljudet i intervaller om 15 sekunder. Varje intervall delas sedan i sin tur in i avsnitt om 3 sekunder som jämförs med en analysmodell. Om det minsta sannolikhetsvärde man definierat i inställningarna uppnås registreras en träff för arten. Flera träffar kan alltså ske för varje femtonsekundersintervall, antingen av olika arter eller av samma art. Alla träffar inom femtonsekundersintervallet får samma tidsstämpel. Det är därför man ibland kan se flera träffar för samma art under exakt samma tid. Under valet "Logg" i menyn kan man se hur programmet jobbar. Det kan ibland ta cirka 30 sekunder innan loggen visas.
<br><br>
<h3>Kostar programmet något?</h3>
Nej, enligt licensen som BirdNET-Pi körs under är det gratis och ingen får tjäna pengar på det. Endast kostnad för hårdvara tillkommer.
<br><br>
<h3>Hur lång tid tillbaka sparas inspelningar?</h3>
Det beror på minneskortets/SSD-minnets storlek, men flera år. När minnet blir fullt tas de äldsta bort. Administratör kan raderingsskydda inspelnigar och dessa kommer då att ligga kvar.
<br><br>
<h3>Varför blir det ibland fel i artbestämningen?</h3>
Analysmodellen bygger på ljud från en mängd individer som alla har individuella läten och modellen består därför av ett genomsnitt av alla dessa och då kan det ibland bli fel. Nya och förfinade analysmodeller kommer med tiden.
<br><br>
<h3>Varför hörs en helt annan art än den som inspelningen säger?</h3>
Flera arter kan finnas på en inspelning och det behöver inte vara den som hörs starkast som artbestämningen gäller. Systemet uppfattar svagare ljud än det mänskliga örat och kan därför hitta och artbestämma svagare ljud än vi kan höra. Det läte som hörs starkare kan finnas på en annan inspelning med samma tidstämpel. 
<br><br>
<h3>Kan man i efterhand lyssna på ett läte som man hört men som inte finns med bland fynden i systemet?</h3>
Nej, i allmänhet inte, Någon kontinuerlig inspelning finns inte sparad. Om man vet ungefärlig tid när man hörde lätet kan administratören för systemet i databasen leta upp de inspelningar som gjordes ungefär samtidigt och har man tur kan det läte man hört finnas med på inspelning för annan art.
<br><br>
<h3>Finns möjlighet till ytterligare information om en viss art?</h3>
De flesta blåmarkerade artnamn är klickbara liksom de små ikonerna till höger om artnamnen och en ny flik öppnas då för information på engelska respektive svenska. Under menyvalet "Bästa inspelningarna" laddas bilder ner från Flickr när man väljer en viss art. Under menyvalet "Artstatistik" kan man på artnivå få information om förekomst av en viss art för den tid man väljer.
<br><br>
<h3>Hur gammal är den väderinformation som visas högst upp under menyraden?</h3>
SMHI uppdaterar informationen varje timma och det är användarens webbläsare som laddar ner datat direkt från SMHI. Funktionen måste installeras separat för varje installation.
<br><br>
<h3>Vad betyder den lilla röda symbolen till höger om artnamnet?</h3>
Symbolen är klickbar och visar förekomst av arten de senaste 30 dagarna samt trend.
<br><br>
<h3>Vad är kostnaden om jag vill installera ett eget system och hur gör jag?</h3>
Själva programmet (som körs i Linux) är gratis och hårdvaran kostar cirka 1500 kr, lite beroende på vad man vill ha i form av mikrofonkabel, lagringsmedia och monteringslåda till själva datorn. Översättning och anpassning till svenska finns i form av ett antal skript som man kör vid installation och efter varje uppgradering. Skicka ett meddelande till birdnet@svardsten.com för mer information.
<br><br>
<h3>Kan systemet installeras utomhus?</h3>
Det är inga problem att ha datorn utomhus bara man har tillgång till el och att den skyddas från fukt i t ex en plastlåda. Värme på sommaren är ett större problem än kyla på vintern. WiFi fungerar som kommunikation om man har tillräckligt bra täckning för detta.
<br><br>
<h3>Kan mänskliga röster spelas in?</h3>
Ja, även mänskligt tal och annat kan höras på en inspelning. Det går dock att aktivera ett integritetsskydd som gör att inspelning inte sparas om mänskligt tal hörs samtidigt. Man bör vara medveten om att systemet kan höra röster utanför den egna tomten. Mer info finns hos <a href="https://www.imy.se/" target="_blank" style="color:blue" rel="noopener noreferrer">Integrationsskyddsmyndigheten</a>.
<br><br>
<h3>Hur många installationer finns i Sverige?</h3>
På webbsidan <a href="https://app.birdweather.com" target="_blank" style="color:blue" rel="noopener noreferrer">BirdWeather</a> syns ett tjugotal installationer i Sverige och troligen finns några till. På den här sidan kan man klicka på en installation (grön droppe) och sedan se statistik och även spela upp läten. De mörkgröna dropparna förekomster av BirdWeather PUC, som använder en liknande teknik.
<br><br>
</center>
</div>