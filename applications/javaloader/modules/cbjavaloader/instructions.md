INSTRUCTIONS
============

Just drop into your **modules** folder or use the box-cli to install

`box install cbjavaloader`

The module has a default folder called `lib` where any jars you drop there will be class loaded automatically.  However, we recommed using the `loadpaths` setting for selecting an array of locations to class load, so when the module updates you won't loose those files.

## Models
The module registers the following mapping in WireBox: `loader@cbjavaloader`. Which is the class you will use to class load, append paths and much more.  Check out the included API Docs for much more information.

## WireBox DSL
The module also registers a new WireBox DSL called `javaloader`.  You can then use this custom DSL for injecting direct java class loaded classes very easily:

```js
property name="name"  inject="javaloader:{class-path}";
property name="hello" inject="javaloader:HelloWorld";
property name="buffer" inject="javaloader:org.class.path.StringBuffer";
```

## Settings
Here are the module settings you can place in your `ColdBox.cfc` under an `javaloader` structure:

```js
// JavaLoader settings
javaloader = {
	// The array paths to load
	loadPaths = getJars( getDirectoryFromPath( getCurrentTemplatePath() ) & "lib" ),
	// Load ColdFusion classes with loader
	loadColdFusionClassPath = false,
	// Attach a custom class loader as a parent
	parentClassLoader = "",
	// Directories that contain Java source code that are to be dynamically compiled
	sourceDirectories = [],
	// the directory to build the .jar file for dynamic compilation in, defaults to ./tmp
	compileDirectory = getDirectoryFromPath( getCurrentTemplatePath() ) & "model/javaloader/tmp",
	// Whether or not the source is trusted, i.e. it is going to change? Defaults to false, so changes will be recompiled and loaded
	trustedSource = false
};
```


Below is a simple example:

```js
/**
* My Event Handler Hint
*/
component{
	// Inject JavaLoader
	property name="javaloader" inject="loader@cbjavaloader";

	// Index
	any function index( event,rc, prc ){
		// creat a java class
		prc.hello = javaloader.create( "HelloWorld" ).init().hello();
	}

	// Run on first init
	any function onAppInit( event, rc, prc ){
		// on application start, load up more jars
		javaloader.appendPaths( getSetting( "ApplicationPath" ) & "jars" );
	}

}
```