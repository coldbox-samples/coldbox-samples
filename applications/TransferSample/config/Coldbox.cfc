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
			appName 				= "TransferSample",
			eventName 				= "event",

			//Development Settings
			debugMode				= false,
			debugPassword			= "",
			reinitPassword			= "",
			handlersIndexAutoReload = false,
			configAutoReload		= false,

			//Implicit Events
			defaultEvent			= "users.dspHome",
			requestStartHandler		= "General.onRequestStart",
			applicationStartHandler = "General.onAppInit",

			//Error/Exception Handling
			exceptionHandler		= "",
			onInvalidEvent			= "users.dspHome",
			customErrorTemplate		= "",

			//Application Aspects
			handlerCaching 			= true,
			eventCaching			= false,
			proxyReturnCollection 	= false,
			flashURLPersistScope	= "session"
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

		//Layout Settings
		layoutSettings = {
			defaultLayout = "Layout.Main.cfm",
			defaultView   = ""
		};

		//Datasources
		datasources = {
			MyDSN = {name="transfersample", dbType="mssql"}
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
			//SES
			{class="coldbox.system.interceptors.SES",
			 properties={configFile="config/routes.cfm"}
			},
			//Transfer
			{class="coldbox.system.orm.transfer.TransferLoader",
			 properties={
			 	ConfigPath="/#AppMapping#/config/transfer.xml.cfm",
				definitionPath="/#AppMapping#/config/definitions",
				datasourceAlias="MyDSN"
			 }
			}
		];

		//i18n & Localization
		i18n = {
			defaultLocale = "en_US",
			localeStorage = "session",
			unknownTranslation = "**NOT FOUND**"
		};
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
	}

</cfscript>
</cfcomponent>