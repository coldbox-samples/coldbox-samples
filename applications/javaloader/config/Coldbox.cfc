component {

	function configure(){

		// coldbox directives
		coldbox = {
			//Application Setup
			appName 				= "Java Loader Example",
			eventName 				= "event",

			//Development Settings
			debugMode				= true,
			debugPassword			= "coldbox",
			reinitPassword			= "",
			handlersIndexAutoReload = false,
			configAutoReload		= false,

			//Implicit Events
			defaultEvent			= "general.dspHello",

			//Error/Exception Handling
			exceptionHandler		= "",
			onInvalidEvent			= "",
			customErrorTemplate		= '/coldbox/system/includes/BugReport.cfm',

			//Application Aspects
			handlerCaching 			= true,
			eventCaching			= false,
			proxyReturnCollection 	= false,
			flashURLPersistScope	= "session"
		};


		// JavaLoader settings
		javaloader = {
		    // The array paths to load
		    loadPaths = ['#controller.getAppRootPath()#/includes/helloworld.jar'],
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
		
	}

}