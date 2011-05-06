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
			appName 				= "Illudium PU-36 Code Generator",
			eventName 				= "event",

			//Development Settings
			debugMode				= false,
			debugPassword			= "",
			reinitPassword			= "",
			handlersIndexAutoReload = true,
			configAutoReload		= false,

			//Implicit Events
			defaultEvent			= "generator.dspHome",

			//Application Aspects
			handlerCaching 			= true,
			eventCaching			= true,
			proxyReturnCollection 	= false,
			flashURLPersistScope	= "session"
		};

		// custom settings
		settings = {
			//whether to encrypt the values or not
			adminPass = "coldfusion",
			xslBasePath = "./model/xsl/"
		};

		// environment settings, create a detectEnvironment() method to detect it yourself.
		// create a function with the name of the environment so it can be executed if that environment is detected
		// the value of the environment is a list of regex patterns to match the cgi.http_host.
		environments = {
			development = "localhost,dev.coldbox.com"
		};

		//LogBox DSL
		logBox = {
			// Define Appenders
			appenders = {
				console = { class="coldbox.system.logging.appenders.ConsoleAppender" },
				coldboxTracer = { class="coldbox.system.logging.appenders.ColdboxTracerAppender" },
				coldboxFile = {
					class="coldbox.system.logging.appenders.AsyncRollingFileAppender",
					properties={filePath="logs",
					fileName=coldbox.appname,
					autoExpand=true,
					fileMaxSize=2000,
					fileMaxArchives=2}
				}
			},
			// Root Logger
			root = { levelmax="INFO", appenders="*" },
			// Implicit Level Categories
			info = [ "coldbox.system" ]
		};

		//Layout Settings
		layoutSettings = {
			defaultLayout = "Layout.Main.cfm",
			defaultView   = ""
		};

		//Interceptor Settings
		interceptorSettings = {
			throwOnInvalidStates = false,
			customInterceptors = ""
		};

		//Register interceptors as an array, we need order
		interceptors = [
			//Autowire
			{class="coldbox.system.interceptors.Autowire",
			 properties={}
			}
		];
	}

	/**
	* Executed whenever the development environment is detected
	*/
	function development(){
		// Override coldbox directives
		coldbox.handlerCaching = false;
		coldbox.eventCaching = false;
		coldbox.handlersIndexAutoReload = true;
		coldbox.debugMode = true;
		coldbox.IOCObjectCaching = false;
	}

</cfscript>
</cfcomponent>