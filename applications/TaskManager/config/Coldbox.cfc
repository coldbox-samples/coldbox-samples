component{
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
- bugTracers
- webservices
- datasources
- layoutSettings
- layouts
- cacheEngine
- interceptorSettings
- interceptors

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
			appName 				= "Awesome Task Manager",
			
			//Development Settings
			debugMode				= true,
			debugPassword			= "",
			reinitPassword			= "",
			handlersIndexAutoReload = true,
			configAutoReload		= false,
			
			//Implicit Events
			defaultEvent			= "General.index",
			requestStartHandler		= "",
			requestEndHandler		= "",
			applicationStartHandler = "",
			applicationEndHandler	= "",
			sessionStartHandler 	= "",
			sessionEndHandler		= "",
			missingTemplateHandler	= "",
			
			//Extension Points
			UDFLibraryFile 			= "",
			coldboxExtensionsLocation = "",
			pluginsExternalLocation = "",
			viewsExternalLocation	= "",
			layoutsExternalLocation = "",
			handlersExternalLocation  = "",
			requestContextDecorator = "",
			
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
			
		};
		
		//LogBox
		logBoxConfig.appender(name="coldboxTracer",class="coldbox.system.logging.appenders.ColdboxTracerAppender");
		logBoxConfig.appender(name="fileTracer",class="coldbox.system.logging.appenders.AsyncRollingFileAppender",
							  properties={filePath="logs",fileName=coldbox.AppName});
		logBoxConfig.root(levelMax=logBoxConfig.logLevels.DEBUG,appenders="*");
		logBoxConfig.info("coldbox.system");
		
		//Layout Settings
		layoutSettings = {
			defaultLayout = "Layout.Main.cfm"
		};
		
		//Register interceptors as an array, we need order
		interceptors = [
			//Autowire
			{class="coldbox.system.interceptors.Autowire"},
			//SES
			{class="coldbox.system.interceptors.SES"}
		];

	}
	
}