<p align="center">
  <img src="https://user-images.githubusercontent.com/60325264/140656397-bf76bad4-f110-467c-897d-992ff0f96476.png" />
</p>
<p align="center">
Icon made by <a href="https://www.freepik.com" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a>
</p>

# **BirdNET-Pi: Language Customization and Personalized Presentation**

Ever since I started using BirdNET-Pi several years ago, I have adapted the appearance to my own wishes. One of the most important customizations has been to have the different pages in my own language. I have shared this adaptation with others in Sweden, and now I have further developed it so that a single command is all that is needed to do everything required to customize BirdNET-Pi. Perhaps more people are interested?

### **Features**

* **Multilingual Customization:** Translation of all public pages (that do not require a login) into another language.  
* **Dynamic Page Title:** The name of your installation location can easily be inserted into the page title.  
* **National Flag:** Your own national flag can be added to the page title.  
* **Flexible Space:** The space under the title is flexible, which makes it possible to add local information, such as weather.  
* **Customized Wikipedia Links:** Wikipedia links are automatically changed to your chosen language.

### **Installation and Updates**

All that is required is for you to run a single command the first time. After that, a convenient update button is available under **"System Controls"** on the BirdNET-Pi interface.

The update only takes 30-45 seconds. If the customization is done on an old installation with a large database, the update will take a few minutes. The entire installation is downloaded again with each update (git pull \-f is specified), and then it is modified from scratch, with the exception of the index.php file and some other custom files.
A Translate folder is downloaded locally and contains all files, commands, and necessary tools, so that you can make changes and run the routine locally if needed. If you use this folder, the program with updates is still downloaded, but the customization routine itself is not updated.

Translations into other languages have been made with AI and will likely require some adjustments. I hope that a volunteer from each country can help with this.

### **Contributing**

Please read more in the information files listed above.

## Installation
The modification can be installed with the following commands, one for each country. More countries will be added once the translation has been verified. Be sure to replace the text "Enter your location here" with the location you want in the title.
This command is only run once on an unmodified installation. Subsequent updates can be made from "System Controls" in the Tools menu.

**If you want to go back to the original look, it's very easy, just click the regular "Update" button.**

**Sweden**
```
cd ~/BirdNET-Pi && wget -O nyinstallation.sh https://raw.githubusercontent.com/Svardsten53/Translate/main/sweden/nyinstallation.sh && sudo chmod u+x nyinstallation.sh && dos2unix nyinstallation.sh && sed -i '/export PLATS=/d' ~/.bashrc && echo 'export PLATS="Enter your location here"' >> ~/.bashrc && source ~/.bashrc && bash nyinstallation.sh
```
**France**
```
cd ~/BirdNET-Pi && wget -O nyinstallation.sh https://raw.githubusercontent.com/Svardsten53/Translate/main/france/nyinstallation.sh && sudo chmod u+x nyinstallation.sh && dos2unix nyinstallation.sh && sed -i '/export PLATS=/d' ~/.bashrc && echo 'export PLATS="Enter your location here"' >> ~/.bashrc && source ~/.bashrc && bash nyinstallation.sh
```

### For the following countries, the translation has not yet been verified.
 
**Germany**
```
cd ~/BirdNET-Pi && wget -O nyinstallation.sh https://raw.githubusercontent.com/Svardsten53/Translate/main/germany/nyinstallation.sh && sudo chmod u+x nyinstallation.sh && dos2unix nyinstallation.sh && sed -i '/export PLATS=/d' ~/.bashrc && echo 'export PLATS="Enter your location here"' >> ~/.bashrc && source ~/.bashrc && bash nyinstallation.sh
```

**Italy**
```
cd ~/BirdNET-Pi && wget -O nyinstallation.sh https://raw.githubusercontent.com/Svardsten53/Translate/main/italy/nyinstallation.sh && sudo chmod u+x nyinstallation.sh && dos2unix nyinstallation.sh && sed -i '/export PLATS=/d' ~/.bashrc && echo 'export PLATS="Enter your location here"' >> ~/.bashrc && source ~/.bashrc && bash nyinstallation.sh
```
