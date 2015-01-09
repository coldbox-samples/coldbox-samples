#INSTRUCTIONS

Just drop into your **modules** folder or use the box-cli to install

`box install cbfeeds`

The module registers the following mappings in WireBox:

* `FeedReader@cbfeeds` - Reads feeds with caching enhancements
* `feedGenerator@cbfeeds` - Generate all kinds of feeds

Then you can use each of the model objects to read or generate feeds to your heart's content.

##Settings
The module can be configured via settings in your `ColdBox.cfc` in a structure called `feeds`:

```js
feeds = {
    // leverage the cache for storage of feed reading, leverages the 'default' cache
    useCache  = true,
    // The cache provider to use for storing the cached elements
    cacheProvider = "default",
    // where to store the cache, options are: [ram, file]
    cacheType = "ram",
    // if using file cache, the location to store the cached files
    cacheLocation = "",
    // the cache timeout for the items in seconds
    cacheTimeout = 30,
    // the http timeout for the cfhttp operations in seconds
    httpTimeout = 30
};
```

##Samples + Documentation
If you want examples just look at the shell sample app in the repository:
https://github.com/ColdBox/cbox-feeds

Or the online documentation for the module:

* http://wiki.coldbox.org/wiki/Plugins:FeedReader.cfm
* http://wiki.coldbox.org/wiki/Plugins:FeedGenerator.cfm
* http://wiki.coldbox.org/wiki/Plugins:FeedGeneratorElements.cfm
