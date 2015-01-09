#INSTRUCTIONS
Just drop into your **modules** folder or use CommandBox to install

`box install cbstorages`

## WireBox Mappings
The module registers the following storage mappings:

* `applicationStorage@cbstorages`
* `clientStorage@cbstorages`
* `cookieStorage@cbstorages`
* `clusterStorage@cbstorages`
* `sessionStorage@cbstorages`

You can check out the included API Docs to see all the functions you can use for persistence.

## Settings
The **cluster** and **cookie** storages also have some configuration data that can be set in your application's configuration `ColdBox.cfc` under a `storages` structure:

```js
storages = {
    // If using the cluster storage, this is the cluster key app name to use
    clusterStorage = {
        clusterAppName = "MyApp"
    },
    // Cookie Storage settings
    cookieStorage = {
        useEncryption   = false,
        encryptionSeed  = "CBStorages",
        encryptionAlgorithm = "CFMX_COMPAT",
        encryptionEncoding = "HEX"
    }
};
```