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
			appName 				= "Security Sample",
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
			flashURLPersistScope	= "session"
		};

		//IOC Integration
		ioc = {
			framework 		= "lightwire",
			reload 	  	  	= true,
			objectCaching 	= false,
			definitionFile  = "#appMapwithDots#config.LightWire"
		};

		// custom settings
		settings = {
			//Transfer ORM settings
			TransferSettings.datasourcePath = "config/datasource.xml.cfm",
			TransferSettings.configPath = "config/transfer.xml.cfm",
			TransferSettings.definitionPath = "/#appMapping#/config/definitions",
			//Path needed for LigthWire
			cfc.model.root="#appMapwithDots#"
		};


		//LogBox DSL
		logBox = {
			// Define Appenders
			appenders = {
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

		//i18n & Localization
		i18n = {
			defaultResourceBundle = "includes/i18n/main",
			defaultLocale = "en_US",
			localeStorage = "session",
			unknownTranslation = "**NOT FOUND**"
		};

		//Datasources
		datasources = {
			dsn1   = {name="transfersample", dbType="mysql"}
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
			},
			//SSL
			{class="#appMapwithDots#interceptors.ssl",
			 properties={isSSLCheck=false,sslEventList="*"}
			},
			//Security
			{class="coldbox.system.interceptors.Security",
			 properties={
			 	rulesSource="xml",
				rulesFile="config/securityrules.xml.cfm",
				debugMode=true,
				validatorIOC="securityManager"
				}
			}
		];
	}

</cfscript>
</cfcomponent>