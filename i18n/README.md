# BirdNET-Pi i18n System

A non-invasive JavaScript-based translation system for BirdNET-Pi that survives updates.

## Features

- **Minimal changes**: Only 2 lines added to BirdNET-Pi (script tags)
- **Survives updates**: After a BirdNET-Pi update, just run `update.sh`
- **Easy translations**: Add new languages by creating a JSON file
- **Dynamic content**: Automatically translates AJAX-loaded content
- **No PHP modifications**: Works entirely client-side

## Quick Install

```bash
cd ~/Translate/scripts
./install.sh nl  # Install with Dutch as default language
```

## Quick Uninstall

```bash
cd ~/Translate/scripts
./uninstall.sh
```

## After BirdNET-Pi Updates

If BirdNET-Pi is updated and translations stop working:

```bash
cd ~/Translate/scripts
./update.sh
```

## Changing Language

### Option 1: URL Parameter
Add `?lang=xx` to the URL:
```
http://your-birdnet-pi/?lang=nl
http://your-birdnet-pi/?lang=sv
http://your-birdnet-pi/?lang=en
```

### Option 2: Browser Console
```javascript
localStorage.setItem('birdnet_i18n_lang', 'nl');
location.reload();
```

### Option 3: Edit config.js
Edit `/home/*/BirdNET-Pi/i18n/config.js` and change the language code.

## Available Languages

| Code | Language | Status |
|------|----------|--------|
| nl | Nederlands (Dutch) | Verified |
| sv | Svenska (Swedish) | Coming soon |
| de | Deutsch (German) | Coming soon |
| fr | Français (French) | Coming soon |

## Adding a New Language

1. Copy an existing language file:
   ```bash
   cp i18n/langs/nl.json i18n/langs/xx.json
   ```

2. Edit the new file and translate all strings:
   ```json
   {
     "meta": {
       "language": "xx",
       "name": "Your Language",
       "author": "Your Name",
       "version": "1.0.0"
     },
     "translations": {
       "Overview": "Your Translation",
       ...
     }
   }
   ```

3. Test by adding `?lang=xx` to the URL

4. Submit a pull request!

## Technical Details

### How It Works

1. `i18n.js` is loaded in both `index.php` (parent frame) and `views.php` (iframe)
2. On page load, it detects the preferred language
3. Loads the corresponding JSON translation file
4. Scans the DOM and replaces English text with translations
5. Uses MutationObserver to translate dynamically loaded content

### Files Structure

```
BirdNET-Pi/
└── i18n/
    ├── i18n.js          # Main translation engine
    ├── config.js        # Default language configuration
    └── langs/
        ├── nl.json      # Dutch translations
        ├── sv.json      # Swedish translations
        └── ...
```

### Modified BirdNET-Pi Files

Only 2 lines are added:

**homepage/index.php** (in `<head>` or after `<body>`):
```html
<script src="/i18n/i18n.js" defer></script>
<script src="/i18n/config.js"></script>
```

**homepage/views.php** (same location):
```html
<script src="/i18n/i18n.js" defer></script>
<script src="/i18n/config.js"></script>
```

## Comparison with sed-based Approach

| Aspect | sed approach | i18n.js |
|--------|-------------|---------|
| PHP files modified | 250+ sed commands | 2 lines |
| Survives updates | No | Yes |
| Add new language | Shell scripting | JSON file |
| Community contribution | Difficult | Easy |
| Revert to English | Difficult | Remove 2 lines |

## Credits

- Original sed-based translation system by [Lars Svardsten](https://github.com/Svardsten53)
- JavaScript i18n system by [Ronny Hullegie](https://github.com/RonnyCHL)
- Dutch translations converted from EMSN2 Project

## License

MIT License - Feel free to use, modify, and distribute.
