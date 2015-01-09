# INSTRUCTIONS
Just drop into your **modules** folder or use CommandBox to install

`box install cbmessagebox`

## WireBox Mappings
The module registers the MessageBox model: `messagebox@cbmessagebox` that you can use to emit messages. Check out the API Docs for all the possible functions.

## Settings
You can use the MessageBox as is with the current skin or use the functions or settings to overide styles and skinning.  You must place the settings in your `ColdBox.cfc` file under a `messagebox` struct:

```js
messagebox = {
    // The default HTMl template for emitting the messages
	template 		= "#moduleMapping#/views/MessageBox.cfm",
    // Override the internal styles, true to override
	styleOverride 	= false
};
```