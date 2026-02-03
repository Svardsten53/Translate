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
git clone https://github.com/RonnyCHL/Translate.git

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
