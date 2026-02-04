/**
 * BirdNET-Pi i18n System
 * Non-invasive UI translation using DOM text replacement
 *
 * https://github.com/RonnyCHL/Translate
 *
 * Design Goals:
 * - Single script tag injection in index.php and views.php
 * - Works in both parent frame and iframe
 * - Handles dynamic AJAX content via MutationObserver
 * - Translates before user sees English text
 * - Survives BirdNET-Pi updates
 */

(function() {
  'use strict';

  const I18N_VERSION = '1.0.2';
  const I18N_BASE_PATH = '/i18n/';

  // Default configuration (can be overridden by config.js)
  const config = {
    defaultLang: 'nl',
    fallbackLang: 'en',
    debug: false,
    translateDelay: 5,
    observerDebounce: 30
  };

  // Merge user config if available
  if (window.BIRDNET_I18N_CONFIG) {
    Object.assign(config, window.BIRDNET_I18N_CONFIG);
  }

  let translations = {};
  let patterns = {};
  let isLoaded = false;
  let currentLang = null;

  /**
   * Detect language from various sources (priority order)
   */
  function detectLanguage() {
    // 1. URL parameter: ?lang=nl
    const urlParams = new URLSearchParams(window.location.search);
    if (urlParams.has('lang')) {
      const lang = urlParams.get('lang');
      localStorage.setItem('birdnet_i18n_lang', lang);
      return lang;
    }

    // 2. localStorage (persisted choice)
    const stored = localStorage.getItem('birdnet_i18n_lang');
    if (stored) {
      return stored;
    }

    // 3. Browser language
    const browserLang = navigator.language.split('-')[0];
    return browserLang;
  }

  /**
   * Load translation file for given language
   */
  async function loadTranslations(lang) {
    // If we're in an iframe, try to share translations with parent
    if (window.parent !== window && window.parent.BIRDNET_I18N && window.parent.BIRDNET_I18N.translations) {
      translations = window.parent.BIRDNET_I18N.translations;
      patterns = window.parent.BIRDNET_I18N.patterns || {};
      currentLang = window.parent.BIRDNET_I18N.currentLang;
      isLoaded = true;
      if (config.debug) console.log('i18n: Using parent frame translations');
      return true;
    }

    try {
      const response = await fetch(`${I18N_BASE_PATH}langs/${lang}.json?v=${I18N_VERSION}`);
      if (!response.ok) {
        if (lang !== config.fallbackLang && lang !== 'en') {
          console.warn(`i18n: Language '${lang}' not found, trying default '${config.defaultLang}'`);
          return loadTranslations(config.defaultLang);
        }
        // English = no translation needed
        if (lang === 'en') {
          isLoaded = true;
          return true;
        }
        throw new Error(`Translation file not found for ${lang}`);
      }

      const data = await response.json();
      translations = data.translations || {};
      patterns = data.patterns || {};
      currentLang = lang;
      isLoaded = true;

      if (config.debug) {
        console.log(`i18n: Loaded ${Object.keys(translations).length} translations for ${lang}`);
      }

      return true;
    } catch (error) {
      console.error('i18n: Failed to load translations:', error);
      isLoaded = true; // Mark as loaded to prevent infinite retries
      return false;
    }
  }

  /**
   * Translate a single text string
   */
  function translateText(text) {
    if (!text || Object.keys(translations).length === 0) return text;

    const trimmed = text.trim();
    if (!trimmed) return text;

    // 1. Direct exact match
    if (translations[trimmed]) {
      return text.replace(trimmed, translations[trimmed]);
    }

    // 2. Try without leading/trailing special chars (like > or :)
    const cleanText = trimmed.replace(/^[>\s]+|[:\s]+$/g, '');
    if (cleanText && translations[cleanText]) {
      return text.replace(cleanText, translations[cleanText]);
    }

    // 3. Pattern match (regex)
    for (const [pattern, replacement] of Object.entries(patterns)) {
      try {
        const regex = new RegExp(pattern);
        if (regex.test(trimmed)) {
          const translated = trimmed.replace(regex, replacement);
          return text.replace(trimmed, translated);
        }
      } catch (e) {
        // Invalid regex, skip
      }
    }

    return text;
  }

  /**
   * Check if element should be skipped from translation
   */
  function shouldSkipElement(element) {
    if (!element) return true;

    const skipTags = ['SCRIPT', 'STYLE', 'NOSCRIPT', 'IFRAME', 'AUDIO', 'VIDEO', 'INPUT', 'TEXTAREA', 'SELECT', 'OPTION'];
    if (skipTags.includes(element.tagName)) return true;

    // Skip elements marked with data-no-translate
    if (element.hasAttribute && element.hasAttribute('data-no-translate')) return true;

    // Skip code/pre blocks
    if (element.closest && element.closest('pre, code, .no-translate')) return true;

    // Skip elements with specific classes (species names, scientific names)
    if (element.classList && (element.classList.contains('sciname') || element.classList.contains('species-scientific'))) {
      return true;
    }

    return false;
  }

  /**
   * Translate paragraphs that contain mixed HTML (links in text)
   * This handles cases like: <p><a href="...">BirdWeather.com</a> is a weather map...</p>
   */
  function translateMixedContentParagraphs(root) {
    if (!root.querySelectorAll) return;

    // Find paragraphs that might have mixed content (text + links)
    const paragraphs = root.querySelectorAll('p, div.description, span.info-text');

    for (const p of paragraphs) {
      // Get the full text content (without HTML)
      const fullText = p.textContent.trim();

      // Check if we have a translation for the full text
      if (translations[fullText]) {
        // Check if paragraph has child elements (like links)
        if (p.children.length > 0) {
          // Preserve the first link if it exists
          const firstLink = p.querySelector('a');
          if (firstLink) {
            const linkText = firstLink.textContent;
            const linkHref = firstLink.getAttribute('href');
            const linkTarget = firstLink.getAttribute('target');

            // Replace innerHTML with translated text, keeping the link
            const translatedFull = translations[fullText];
            if (translatedFull.includes(linkText)) {
              // The translation includes the link text, so we can safely replace
              const linkHtml = `<a href="${linkHref}"${linkTarget ? ` target="${linkTarget}"` : ''}>${linkText}</a>`;
              p.innerHTML = translatedFull.replace(linkText, linkHtml);
            }
          }
        }
      }
    }
  }

  /**
   * Translate all text nodes in a subtree
   */
  function translateSubtree(root) {
    if (!isLoaded || !root || Object.keys(translations).length === 0) return;

    // First try to translate mixed content paragraphs
    translateMixedContentParagraphs(root);

    const walker = document.createTreeWalker(
      root,
      NodeFilter.SHOW_TEXT,
      {
        acceptNode: function(node) {
          if (!node.nodeValue || !node.nodeValue.trim()) return NodeFilter.FILTER_REJECT;
          if (shouldSkipElement(node.parentElement)) return NodeFilter.FILTER_REJECT;
          return NodeFilter.FILTER_ACCEPT;
        }
      }
    );

    const nodesToTranslate = [];
    while (walker.nextNode()) {
      nodesToTranslate.push(walker.currentNode);
    }

    // Batch DOM updates
    for (const node of nodesToTranslate) {
      const translated = translateText(node.nodeValue);
      if (translated !== node.nodeValue) {
        node.nodeValue = translated;
      }
    }

    // Also translate specific attributes
    translateAttributes(root);
  }

  /**
   * Translate title, placeholder, alt and button attributes
   */
  function translateAttributes(root) {
    if (!root.querySelectorAll) return;

    // Translate title, placeholder, alt attributes
    const attrElements = root.querySelectorAll('[title], [placeholder], [alt]');
    for (const el of attrElements) {
      for (const attr of ['title', 'placeholder', 'alt']) {
        if (el.hasAttribute(attr)) {
          const original = el.getAttribute(attr);
          const translated = translateText(original);
          if (translated !== original) {
            el.setAttribute(attr, translated);
          }
        }
      }
    }

    // Translate button text content
    const buttons = root.querySelectorAll('button');
    for (const btn of buttons) {
      // Skip if button has child elements (icons, etc)
      if (btn.children.length === 0 && btn.textContent) {
        const original = btn.textContent;
        const translated = translateText(original);
        if (translated !== original) {
          btn.textContent = translated;
        }
      }
    }
  }

  /**
   * Setup MutationObserver for dynamic content
   * Uses CSS opacity trick to hide content until translated
   */
  function setupMutationObserver() {
    let pendingNodes = new Set();
    let isTranslating = false;
    let rafId = null;

    const observer = new MutationObserver((mutations) => {
      if (isTranslating) return;

      for (const mutation of mutations) {
        if (mutation.type === 'childList') {
          for (const node of mutation.addedNodes) {
            if (node.nodeType === Node.ELEMENT_NODE) {
              // Immediately hide new elements to prevent flash
              node.style.opacity = '0';
              pendingNodes.add(node);
            } else if (node.nodeType === Node.TEXT_NODE && node.nodeValue && node.nodeValue.trim()) {
              if (!shouldSkipElement(node.parentElement)) {
                pendingNodes.add(node.parentElement || node);
              }
            }
          }
        }
      }

      // Use requestAnimationFrame for smoother updates
      if (pendingNodes.size > 0 && !rafId) {
        rafId = requestAnimationFrame(() => {
          isTranslating = true;
          for (const node of pendingNodes) {
            if (document.contains(node)) {
              translateSubtree(node);
              // Show element after translation
              if (node.style) {
                node.style.opacity = '';
              }
            }
          }
          pendingNodes.clear();
          isTranslating = false;
          rafId = null;
        });
      }
    });

    observer.observe(document.body, {
      childList: true,
      subtree: true
    });

    return observer;
  }

  /**
   * Set language and reload translations
   */
  async function setLanguage(lang) {
    localStorage.setItem('birdnet_i18n_lang', lang);
    currentLang = lang;
    translations = {};
    patterns = {};
    isLoaded = false;

    await loadTranslations(lang);
    translateSubtree(document.body);

    // Also update iframes
    const iframes = document.querySelectorAll('iframe');
    for (const iframe of iframes) {
      try {
        if (iframe.contentWindow && iframe.contentWindow.BIRDNET_I18N) {
          iframe.contentWindow.BIRDNET_I18N.refresh();
        }
      } catch (e) {
        // Cross-origin iframe, skip
      }
    }
  }

  /**
   * Refresh translations (re-translate entire page)
   */
  function refresh() {
    if (window.parent !== window && window.parent.BIRDNET_I18N) {
      translations = window.parent.BIRDNET_I18N.translations;
      patterns = window.parent.BIRDNET_I18N.patterns || {};
      currentLang = window.parent.BIRDNET_I18N.currentLang;
    }
    translateSubtree(document.body);
  }


  /**
   * Main initialization
   */
  async function init() {
    const detectedLang = detectLanguage();
    const lang = detectedLang || config.defaultLang;

    await loadTranslations(lang);

    if (!isLoaded) {
      console.error('i18n: Failed to initialize');
      return;
    }

    // Expose global API
    window.BIRDNET_I18N = {
      version: I18N_VERSION,
      currentLang,
      translations,
      patterns,
      translate: translateText,
      translateSubtree,
      setLanguage,
      refresh
    };

    // Initial translation with slight delay to ensure DOM is ready
    setTimeout(() => {
      translateSubtree(document.body);
    }, config.translateDelay);

    // Setup observer for dynamic content
    setupMutationObserver();

    if (config.debug) {
      console.log(`i18n: Initialized v${I18N_VERSION} with language '${currentLang}'`);
    }
  }

  // Start when DOM is ready
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
  } else {
    init();
  }

  // Also translate when page is fully loaded
  window.addEventListener('load', () => {
    if (isLoaded && Object.keys(translations).length > 0) {
      setTimeout(() => translateSubtree(document.body), 100);
    }
  });

})();
