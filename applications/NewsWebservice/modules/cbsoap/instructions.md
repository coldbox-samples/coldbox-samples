# INSTRUCTIONS
Just drop into your **modules** folder or use CommandBox to install

`box install cbsoap`

## WireBox Mappings
The module registers the soap webservices manager as: `webservices@cbsoap`
The module registers a new wirebox DSL called: `webservice:alias` so you can retrieve SOAP WebService objects via a nice injection DSL.

## Settings
You can register all the WSDL URLs in your `ColdBox.cfc` via the `webservices` structure:

```js
// List all your webservices here that this module can tallk to.
webservices = {
	// alias = WSDL_URL
}
```

You can also register web service WSDL's manually via the `registerWS()`function in the Webservices manager.