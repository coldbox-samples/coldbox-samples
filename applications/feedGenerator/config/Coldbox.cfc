<cfcomponent output="false" hint="My App Configuration">
<cfscript>
/**
structures/arrays to create for configuration

- coldbox (struct)
- settings (struct)
- conventions (struct)
- environments (struct)
- ioc (struct)
- models (struct)
- debugger (struct)
- mailSettings (struct)
- i18n (struct)
- webservices (struct)
- datasources (struct)
- layoutSettings (struct)
- layouts (array of structs)
- cacheBox (struct)
- interceptorSettings (struct)
- interceptors (array of structs)
- modules (struct)
- logBox (struct)

Available objects in variable scope
- controller
- logBoxConfig
- appMapping (auto calculated by ColdBox)

Required Methods
- configure() : The method ColdBox calls to configure the application.
Optional Methods
- detectEnvironment() : If declared the framework will call it and it must return the name of the environment you are on.
- {environment}() : The name of the environment found and called by the framework.

*/

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
			customErrorTemplate		= "",

			//Application Aspects
			handlerCaching 			= false,
			eventCaching			= false,
			proxyReturnCollection 	= false,
			flashURLPersistScope	= "session",
			UDFLibraryFile			= "includes/helpers/ApplicationHelper.cfm"
		};

		//LogBox DSL
		logBox = {
			// Define Appenders
			appenders = {
				coldboxTracer = { class="coldbox.system.logging.appenders.ColdboxTracerAppender" }
			},
			// Root Logger
			root = { levelmax="INFO", appenders="*" },
			// Implicit Level Categories
			info = [ "coldbox.system" ]
		};

		// environment settings, create a detectEnvironment() method to detect it yourself.
		// create a function with the name of the environment so it can be executed if that environment is detected
		// the value of the environment is a list of regex patterns to match the cgi.http_host.
		environments = {
			development = "dev,localhost,dev.coldbox.com"
		};

		//Layout Settings
		layoutSettings = {
			defaultLayout = "Layout.Main.cfm",
			defaultView   = ""
		};

		//Register Layouts
		layouts = [
			{ name = "xml",
		 	  file = "Layout.xml.cfm",
			  views = "vwDisplayFeed"
			},
			{ name = "xmlEtag",
		 	  file = "Layout.xml.etag.cfm",
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
			//Autowire
			{class="coldbox.system.interceptors.Autowire",
			 properties={enableSetterInjection=true}
			},
			//SES
			{class="coldbox.system.interceptors.SES",
			 properties={configFile="config/routes.cfm"}
			}
		];
	}

	/**
	* Executed whenever the development environment is detected
	*/
	function development(){
		// Override coldbox directives
		settings.TierControlFired = true;
	}

</cfscript>
</cfcomponent>