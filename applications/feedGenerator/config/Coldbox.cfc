component {

	// Configure ColdBox Application
	function configure(){

		// coldbox directives
		coldbox = {
			//Application Setup
			appName 				= "feedUpdate",
			eventName 				= "event",

			//Development Settings
			debugMode				= false,
			debugPassword			= "",
			reinitPassword			= "",
			handlersIndexAutoReload = true,
			configAutoReload		= false,

			//Implicit Events
			defaultEvent			= "examples.index",
			requestStartHandler		= "main.onRequestStart",
			applicationStartHandler = "main.onAppInit",

			//Error/Exception Handling
			exceptionHandler		= "",
			onInvalidEvent			= "",
			customErrorTemplate		= "/coldbox/system/includes/BugReport.cfm",

			//Application Aspects
			handlerCaching 			= false,
			eventCaching			= false,
			proxyReturnCollection 	= false,
			flashURLPersistScope	= "session",
			UDFLibraryFile			= "includes/helpers/ApplicationHelper.cfm"
		};

		// environment settings, create a detectEnvironment() method to detect it yourself.
		// create a function with the name of the environment so it can be executed if that environment is detected
		// the value of the environment is a list of regex patterns to match the cgi.http_host.
		environments = {
			development = "dev,localhost,dev.coldbox.com"
		};

		//Layout Settings
		layoutSettings = {
			defaultLayout = "Main.cfm",
			defaultView   = ""
		};

		//Register Layouts
		layouts = [
			{ name = "xml",
		 	  file = "xml.cfm",
			  views = "vwDisplayFeed"
			},
			{ name = "xmlEtag",
		 	  file = "xml.etag.cfm",
			  views = "vwCacheFeed"
			}
		];

		//Interceptor Settings
		interceptorSettings = {
			throwOnInvalidStates = false,
			customInterceptors = ""
		};

		//Register interceptors as an array, we need order
		interceptors = [
			//SES
			{class="coldbox.system.interceptors.SES" }
		];
	}

	/**
	* Executed whenever the development environment is detected
	*/
	function development(){
		// Override coldbox directives
		settings.TierControlFired = true;
	}

}