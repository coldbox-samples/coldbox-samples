<cfcomponent output="false" hint="My App Configuration">
<cfscript>
/**
structures to create for configuration

- coldbox
- settings
- conventions
- environments
- ioc
- models
- debugger
- mailSettings
- i18n
- webservices
- datasources
- layoutSettings
- layouts
- cacheEngine
- interceptorSettings
- interceptors
- modules

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
		appName 				= "Sample Login Application",

		//Development Settings
		debugMode				= true,
		debugPassword			= "coldbox",
		reinitPassword			= "",
		handlersIndexAutoReload = false,
		configAutoReload		= false,

		//Implicit Events
		defaultEvent			= "general.login",
		requestStartHandler		= "general.onRequestStart",
		requestEndHandler		= "",
		applicationStartHandler = "",
		applicationEndHandler	= "",
		sessionStartHandler 	= "",
		sessionEndHandler		= "",
		missingTemplateHandler	= "",

		//Error/Exception Handling
		exceptionHandler		= "",
		onInvalidEvent			= "",
		customErrorTemplate		= "",

		//Application Aspects
		handlerCaching 			= false,
		eventCaching			= false
	};

	//Layout Settings
	layoutSettings = {
		defaultLayout = "Layout.Main.cfm"
	};

	//Register interceptors as an array, we need order
	interceptors = [
		 //Autowire
		 {class="#appMapwithDots#model.securityInterceptor"}
	];

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

}

</cfscript>
</cfcomponent>