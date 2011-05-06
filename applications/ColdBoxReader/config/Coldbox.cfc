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

		//converts the coldbox app mapping to a dot class path for instantiations, not part of a regular config
		var appMapwithDots = reReplace(appMapping,"(/|\\)",".","all");
		if (len(appMapwithDots)) {
			appMapwithDots = appMapwithDots & ".";
		}

		// coldbox directives
		coldbox = {
			//Application Setup
			appName 				= "ColdBoxReader",
			eventName 				= "event",

			//Development Settings
			debugMode				= false,
			debugPassword			= "",
			reinitPassword			= "",
			handlersIndexAutoReload = false,
			configAutoReload		= false,

			//Implicit Events
			defaultEvent			= "general.dspStart",
			requestStartHandler = "main.onRequestStart",
			ExceptionHandler = "main.onException",

			//Error/Exception Handling
			exceptionHandler		= "",
			onInvalidEvent			= "",
			customErrorTemplate		= "",

			//Application Aspects
			handlerCaching 			= false,
			eventCaching			= false,
			proxyReturnCollection 	= false,
			flashURLPersistScope	= "session"
		};

		// custom settings
		settings = {
			Version="2.2",
			ModelBasePath="#appMapwithDots#components",
			ownerEmail = "info@coldbox.org",
			// messagebox
			messagebox_style_override=true,
			//FeedReader Settings
			feedReader_useCache=true,
			feedReader_cacheType="file",
			feedReader_cacheLocation="cache",
			feedReader_cacheTimeout="30"
		};

		//IOC Integration
		ioc = {
			framework 		= "wirebox",
			definitionFile  = "config/WireBox"
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

		//Datasources
		datasources = {
			coldboxreader  = {name="coldboxreader", dbType="mssql"}
		};

		//Layout Settings
		layoutSettings = {
			defaultLayout = "Layout.None.cfm",
			defaultView   = ""
		};

		//Register Layouts
		layouts = [
			{ name = "clean",
		 	  file = "Layout.Main.cfm",
			  views = "general/dspstart"
			}
		];

		//Interceptor Settings
		interceptorSettings = {
			throwOnInvalidStates = false,
			CustomInterceptionPoints = ""
		};

		//Register interceptors as an array, we need order
		interceptors = [
			//Autowire
			{class="coldbox.system.interceptors.Autowire",
			 properties={}
			}
		];
	}

</cfscript>
</cfcomponent>