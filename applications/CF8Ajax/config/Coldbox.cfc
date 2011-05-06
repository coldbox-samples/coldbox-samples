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
			appName 				= "CF8Ajax",
			appMapping				= "cf8ajax",
			eventName 				= "event",

			//Development Settings
			debugMode				= false,
			debugPassword			= "",
			reinitPassword			= "",
			handlersIndexAutoReload = true,
			configAutoReload		= false,

			//Implicit Events
			defaultEvent			= "General.index",
			requestStartHandler		= "Main.onRequestStart",
			requestEndHandler		= "Main.onRequestEnd",
			applicationStartHandler = "Main.onAppInit",
			applicationEndHandler	= "",
			sessionStartHandler 	= "Main.onSessionStart",
			sessionEndHandler		= "Main.onSessionEnd",

			//Application Aspects
			handlerCaching 			= true,
			eventCaching			= true,
			proxyReturnCollection 	= false,
			flashURLPersistScope	= "session",
			UDFLibraryFile			= "includes/udf.cfm"
		};

		//IOC Integration via wirebox to have everything work the same, cool hugh?
		ioc = {
			framework 		= "wirebox",
			reload 	  	  	= false,
			objectCaching 	= true,
			definitionFile  = "#appMapwithDots#config.WireBox"
		};

		// custom settings
		settings = {
			//whether to encrypt the values or not
			cookiestorage_encryption = true,
			//The encryption seed to use. Else, use a default one (Not Recommened) -
			cookiestorage_encryption_seed = "MyCF8AjaxKey",
			//The encryption algorithm to use (According to CFML Engine)
			cookiestorage_encryption_algorithm = "CFMX_COMPAT",
			//Messagebox Plugin (You can now override the storage scope without affecting all framework applications)
			MessageBox_storage_scope = "session",
			//set datasource
			cfartgallery = "cfartgallery",
			//Path needed for LigthWire
			cfcroot="#appMapwithDots#"
		};

		// environment settings, create a detectEnvironment() method to detect it yourself.
		// create a function with the name of the environment so it can be executed if that environment is detected
		// the value of the environment is a list of regex patterns to match the cgi.http_host.
		environments = {
			development = "localhost,dev.coldbox.com",
			staging = "staging.cf8ajax.com",
			live = "www.cf8ajax.com"
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

		//Datasources
		datasources = {
			cfartgallery   = {name="cfartgallery", alias="cfartgallery", dbType="Apache Derby Embedded"}
		};

		//Interceptor Settings
		interceptorSettings = {
			throwOnInvalidStates = false,
			customInterceptors = ""
		};

		//Register interceptors as an array, we need order
		interceptors = [
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
		coldbox.handlerCaching = false;
		coldbox.eventCaching = false;
		coldbox.handlersIndexAutoReload = true;
		coldbox.debugMode = true;
		coldbox.IOCObjectCaching = false;
	}

	/**
	* Executed whenever the staging environment is detected
	*/
	function staging(){
		// Override coldbox directives
		settings.COOKIESTORAGE_ENCRYPTION_SEED = "MyCF8AjaxKeyStaging";
	}


	/**
	* Executed whenever the live environment is detected
	*/
	function live(){
		// Override coldbox directives
		settings.COOKIESTORAGE_ENCRYPTION_SEED = "MyCF8AjaxKeyLive";
	}

</cfscript>
</cfcomponent>