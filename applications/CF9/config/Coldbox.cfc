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
			appName 				= "CF9",
			
			//Development Settings
			debugMode				= true,
			debugPassword			= "",
			reinitPassword			= "",
			handlersIndexAutoReload = true,
			configAutoReload		= false,
			
			//Implicit Events
			defaultEvent			= "General.index",
			requestStartHandler		= "Main.onRequestStart",
			requestEndHandler		= "",
			applicationStartHandler = "Main.onAppInit",
			applicationEndHandler	= "",
			sessionStartHandler 	= "",
			sessionEndHandler		= "",
			missingTemplateHandler	= "",
			
			//Extension Points
			UDFLibraryFile 			= "includes/helpers/ApplicationHelper.cfm",
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
	
		
		//LogBox
		logBox = {
			appenders = {
				coldboxTracer = {class="coldbox.system.logging.appenders.ColdboxTracerAppender"},
				fileLog = {
					class="coldbox.system.logging.appenders.AsyncRollingFileAppender",
				 	properties={
						filePath = "logs",
						fileName = coldbox.appName,
						autoExpand = true,
						fileMaxSize = 2000,
						fileMaxArchives = 3
					}
				}
			
			},
			root = {levelMax="DEBUG", appenders="*"}
		};
		
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