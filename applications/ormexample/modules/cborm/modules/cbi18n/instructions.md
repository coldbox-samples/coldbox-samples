INSTRUCTIONS
============

Just drop into your **modules** folder or use the box-cli to install

`box install cbi18n`

This module registers the following models in WireBox:

- `i18n@cbi18n` : Helper with all kinds of methods for localization
- `resourceService@cbi18n` : Service to interact with language resource bundles

## Settings
You can add a `i18n` structure of settings to your `ColdBox.cfc` or to any other module configuration file: `ModuleConfig.cfc` to configure the module:

```js
i18n = {
    // The base path of the default resource bundle to load
    defaultResourceBundle = "includes/i18n/main",
    // The default locale of the application
    defaultLocale = "en_US",
    // The storage to use for user's locale: session, client, cookie, request
    localeStorage = "cookie",
    // The value to show when a translation is not found
    unknownTranslation = "**NOT FOUND**"
    // Extra resource bundles to load
    resourceBundles = {
        alias = "path"
    }
};
```

Each module in your ColdBox Application can have its own resource bundles that can be loaded by this module.

## Mixin Helpers
The module registers the following methods for **handlers/layouts/views/interceptors**:

```js
/**
* Get the user's currently set locale or default locale according to settings
*/
function getFWLocale()

/**
* Set the locale for a specific user
* @locale The locale to set. Must be Java Style Standard: en_US, if empty it will default to the default locale
* @dontLoadRBFlag Flag to load the resource bundle for the specified locale (If not already loaded)
* 
* @return i18n Service
*/
function setFWLocale( string locale="", boolean dontloadRBFlag=false )

/**
* Retrieve a resource from a resource bundle with replacements or auto-loading
* @resource The resource (key) to retrieve from the main loaded bundle.
* @defaultValue A default value to send back if the resource (key) not found
* @locale Pass in which locale to take the resource from. By default it uses the user's current set locale
* @values An array, struct or simple string of value replacements to use on the resource string
* @bundle The bundle alias to use to get the resource from when using multiple resource bundles. By default the bundle name used is 'default'
*/
function getResource(
    required resource,
    defaultValue,
    locale,
    values,
    bundle,
)

// Alias to getResource
function $r()
```

You can read more about this module here: http://wiki.coldbox.org/wiki/I18n.cfm