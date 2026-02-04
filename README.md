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
The modification can be installed with the following commands, one for each country. If there is a request for translation for more countries, I can also try this.. Be sure to replace the text "Enter your location here" with the location you want in the title.
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
**Slovenia**
```
cd ~/BirdNET-Pi && wget -O nyinstallation.sh https://raw.githubusercontent.com/Svardsten53/Translate/main/slovene/nyinstallation.sh && sudo chmod u+x nyinstallation.sh && dos2unix nyinstallation.sh && sed -i '/export PLATS=/d' ~/.bashrc && echo 'export PLATS="Enter your location here"' >> ~/.bashrc && source ~/.bashrc && bash nyinstallation.sh
```
**Netherlands (Dutch)**
```
cd ~/BirdNET-Pi && wget -O nyinstallation.sh https://raw.githubusercontent.com/Svardsten53/Translate/main/nederland/nyinstallation.sh && sudo chmod u+x nyinstallation.sh && dos2unix nyinstallation.sh && sed -i '/export PLATS=/d' ~/.bashrc && echo 'export PLATS="Enter your location here"' >> ~/.bashrc && source ~/.bashrc && bash nyinstallation.sh
```

### The following countries can be installed, but the translation is not yet verified and may contain some errors.

**Norway**
```
cd ~/BirdNET-Pi && wget -O nyinstallation.sh https://raw.githubusercontent.com/Svardsten53/Translate/main/norway/nyinstallation.sh && sudo chmod u+x nyinstallation.sh && dos2unix nyinstallation.sh && sed -i '/export PLATS=/d' ~/.bashrc && echo 'export PLATS="Enter your location here"' >> ~/.bashrc && source ~/.bashrc && bash nyinstallation.sh
```
**Denmark**
```
cd ~/BirdNET-Pi && wget -O nyinstallation.sh https://raw.githubusercontent.com/Svardsten53/Translate/main/denmark/nyinstallation.sh && sudo chmod u+x nyinstallation.sh && dos2unix nyinstallation.sh && sed -i '/export PLATS=/d' ~/.bashrc && echo 'export PLATS="Enter your location here"' >> ~/.bashrc && source ~/.bashrc && bash nyinstallation.sh
```
**Finland**
```
cd ~/BirdNET-Pi && wget -O nyinstallation.sh https://raw.githubusercontent.com/Svardsten53/Translate/main/finland/nyinstallation.sh && sudo chmod u+x nyinstallation.sh && dos2unix nyinstallation.sh && sed -i '/export PLATS=/d' ~/.bashrc && echo 'export PLATS="Enter your location here"' >> ~/.bashrc && source ~/.bashrc && bash nyinstallation.sh
```
 
**Germany**
```
cd ~/BirdNET-Pi && wget -O nyinstallation.sh https://raw.githubusercontent.com/Svardsten53/Translate/main/germany/nyinstallation.sh && sudo chmod u+x nyinstallation.sh && dos2unix nyinstallation.sh && sed -i '/export PLATS=/d' ~/.bashrc && echo 'export PLATS="Enter your location here"' >> ~/.bashrc && source ~/.bashrc && bash nyinstallation.sh
```
**Italy**
```
cd ~/BirdNET-Pi && wget -O nyinstallation.sh https://raw.githubusercontent.com/Svardsten53/Translate/main/italy/nyinstallation.sh && sudo chmod u+x nyinstallation.sh && dos2unix nyinstallation.sh && sed -i '/export PLATS=/d' ~/.bashrc && echo 'export PLATS="Enter your location here"' >> ~/.bashrc && source ~/.bashrc && bash nyinstallation.sh
```
**Spain**
```
cd ~/BirdNET-Pi && wget -O nyinstallation.sh https://raw.githubusercontent.com/Svardsten53/Translate/main/spain/nyinstallation.sh && sudo chmod u+x nyinstallation.sh && dos2unix nyinstallation.sh && sed -i '/export PLATS=/d' ~/.bashrc && echo 'export PLATS="Enter your location here"' >> ~/.bashrc && source ~/.bashrc && bash nyinstallation.sh
```
**Poland**
```
cd ~/BirdNET-Pi && wget -O nyinstallation.sh https://raw.githubusercontent.com/Svardsten53/Translate/main/poland/nyinstallation.sh && sudo chmod u+x nyinstallation.sh && dos2unix nyinstallation.sh && sed -i '/export PLATS=/d' ~/.bashrc && echo 'export PLATS="Enter your location here"' >> ~/.bashrc && source ~/.bashrc && bash nyinstallation.sh
```
**Czechia**
```
cd ~/BirdNET-Pi && wget -O nyinstallation.sh https://raw.githubusercontent.com/Svardsten53/Translate/main/czechia/nyinstallation.sh && sudo chmod u+x nyinstallation.sh && dos2unix nyinstallation.sh && sed -i '/export PLATS=/d' ~/.bashrc && echo 'export PLATS="Enter your location here"' >> ~/.bashrc && source ~/.bashrc && bash nyinstallation.sh
```
**Slovakia**
```
cd ~/BirdNET-Pi && wget -O nyinstallation.sh https://raw.githubusercontent.com/Svardsten53/Translate/main/slovakia/nyinstallation.sh && sudo chmod u+x nyinstallation.sh && dos2unix nyinstallation.sh && sed -i '/export PLATS=/d' ~/.bashrc && echo 'export PLATS="Enter your location here"' >> ~/.bashrc && source ~/.bashrc && bash nyinstallation.sh
```
**Hungary**
```
cd ~/BirdNET-Pi && wget -O nyinstallation.sh https://raw.githubusercontent.com/Svardsten53/Translate/main/hungary/nyinstallation.sh && sudo chmod u+x nyinstallation.sh && dos2unix nyinstallation.sh && sed -i '/export PLATS=/d' ~/.bashrc && echo 'export PLATS="Enter your location here"' >> ~/.bashrc && source ~/.bashrc && bash nyinstallation.sh
```
**Portugal**
```
cd ~/BirdNET-Pi && wget -O nyinstallation.sh https://raw.githubusercontent.com/Svardsten53/Translate/main/portugal/nyinstallation.sh && sudo chmod u+x nyinstallation.sh && dos2unix nyinstallation.sh && sed -i '/export PLATS=/d' ~/.bashrc && echo 'export PLATS="Enter your location here"' >> ~/.bashrc && source ~/.bashrc && bash nyinstallation.sh
```


<p align="center">
  <img src="https://user-images.githubusercontent.com/60325264/140656397-bf76bad4-f110-467c-897d-992ff0f96476.png" />
</p>

# BirdNET-Pi i18n Translation System

A JavaScript-based internationalization (i18n) system for BirdNET-Pi that translates the web interface without modifying core PHP files.

## Why This Approach?

| Feature | sed-based approach | i18n.js |
|---------|-------------------|---------|
| Modifies PHP files | Yes (250+ sed commands) | No (only 2 lines added) |
| Survives BirdNET-Pi updates | No (must re-run everything) | Yes (just run `update.sh`) |
| Adding a new language | Complex shell scripting | Simple: add a JSON file |
| Community contributions | Difficult | Easy: edit JSON |
| Reverting changes | Difficult | Easy: run `uninstall.sh` |

## Available Languages

| Language | Code | File |
|----------|------|------|
| English | `en` | (default, no file needed) |
| Nederlands (Dutch) | `nl` | `nl.json` |
| Svenska (Swedish) | `sv` | `sv.json` |
| Deutsch (German) | `de` | `de.json` |
| Français (French) | `fr` | `fr.json` |
| Polski (Polish) | `pl` | `pl.json` |
| Suomi (Finnish) | `fi` | `fi.json` |
| Dansk (Danish) | `da` | `da.json` |

## Installation

### Quick Install

```bash
# Clone the repository
cd ~
git clone https://github.com/Svardsten53/Translate.git

# Run the installer
cd Translate
chmod +x scripts/*.sh
./scripts/install.sh
```

The installer will:
1. Copy the `i18n/` folder to your BirdNET-Pi installation
2. Add two script tags to `index.php` and `views.php`
3. That's it!

### Set Your Language

After installation, set your language in one of these ways:

1. **URL parameter** (temporary): `http://your-birdnet-pi/?lang=nl`
2. **Browser settings**: The system detects your browser language automatically
3. **Permanently**: Add `?lang=nl` to your bookmark, or the system remembers your last choice

## After a BirdNET-Pi Update

When BirdNET-Pi updates, it may overwrite the script tags. Simply run:

```bash
cd ~/Translate
./scripts/update.sh
```

This only takes a second and re-adds the 2 script tags. Your translations remain intact.

## Uninstallation

To completely remove the i18n system:

```bash
cd ~/Translate
./scripts/uninstall.sh
```

## How It Works

The system uses client-side JavaScript to translate text:

1. **On page load**: Loads the JSON translation file for your language
2. **Scans the DOM**: Finds all text nodes and replaces English text with translations
3. **Watches for changes**: Uses MutationObserver to translate dynamically loaded content (AJAX)
4. **Works in iframes**: BirdNET-Pi uses iframes; the script works in both parent and child frames

### Technical Details

- **No server changes**: All translation happens in the browser
- **Fast loading**: Translation files are cached
- **500+ translations**: Covers all UI elements, menus, buttons, messages
- **Pattern matching**: Handles dynamic text like dates and numbers

## Configuration

To change the default language, edit the config file:

```bash
nano ~/BirdNET-Pi/i18n/config.js
```

```javascript
window.BIRDNET_I18N_CONFIG = {
  defaultLang: 'nl',  // Your language code
  debug: false
};
```

## Adding a New Language

1. Copy an existing language file:
   ```bash
   cp i18n/langs/nl.json i18n/langs/es.json
   ```

2. Edit the new file and translate the strings:
   ```json
   {
     "meta": {
       "language": "es",
       "name": "Español",
       "version": "1.0.0"
     },
     "translations": {
       "Overview": "Resumen",
       "Today's Detections": "Detecciones de Hoy",
       ...
     }
   }
   ```

3. That's it! The new language is automatically available with `?lang=es`

## File Structure

```
Translate/
├── i18n/
│   ├── i18n.js              # Main translation engine
│   ├── config.js            # Configuration (language settings)
│   └── langs/
│       ├── nl.json          # Dutch
│       ├── sv.json          # Swedish
│       ├── de.json          # German
│       ├── fr.json          # French
│       ├── pl.json          # Polish
│       ├── fi.json          # Finnish
│       └── da.json          # Danish
├── scripts/
│   ├── install.sh           # Installation script
│   ├── update.sh            # Re-adds script tags after BP update
│   └── uninstall.sh         # Remove i18n system
└── README.md
```

## Contributing

Contributions are welcome! You can help by:

- **Improving translations**: Fix errors in existing language files
- **Adding languages**: Create a new JSON file for your language
- **Testing**: Report issues or missing translations

### Translation Tips

- Keep the exact format of dynamic text (e.g., `{0}` placeholders)
- Test your translations on a live BirdNET-Pi installation
- Some technical terms may be better left in English

## Credits

- **Lars Svardsten** - Original sed-based translation system and Swedish translations
- **Ronny** - JavaScript i18n engine development
- **BirdNET-Pi Team** - The amazing bird detection software

## License

This project is provided as-is for the BirdNET-Pi community.

---

<p align="center">
Icon made by <a href="https://www.freepik.com" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a>
</p>
