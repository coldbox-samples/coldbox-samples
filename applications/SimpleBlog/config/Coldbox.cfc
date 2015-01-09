component {
	
	// Configure ColdBox Application
	function configure(){
	
		// coldbox directives
		coldbox = {
			//Application Setup
			appName 				= "SimpleBlog5",
			
			//Development Settings
			debugMode				= false,
			debugPassword			= "",
			reinitPassword			= "",
			handlersIndexAutoReload = false,
			configAutoReload		= false,
			
			//Implicit Events
			defaultEvent			= "Main.home",
			requestStartHandler		= "Main.onRequestStart",
			requestEndHandler		= "",
			applicationStartHandler = "Main.onAppInit",
			applicationEndHandler	= "",
			sessionStartHandler 	= "",
			sessionEndHandler		= "",
			missingTemplateHandler	= "",
			
			//Extension Points
			UDFLibraryFile 				= "includes/helpers/ApplicationHelper.cfm",
			coldboxExtensionsLocation 	= "",
			modulesExternalLocation		= [],
			pluginsExternalLocation 	= "",
			viewsExternalLocation		= "",
			layoutsExternalLocation 	= "",
			handlersExternalLocation  	= "",
			requestContextDecorator 	= "",
			
			//Error/Exception Handling
			exceptionHandler		= "",
			onInvalidEvent			= "",
			customErrorTemplate		= "/coldbox/system/includes/BugReport.cfm",
				
			//Application Aspects
			handlerCaching 			= true,
			eventCaching			= true,
			proxyReturnCollection 	= false,
			flashURLPersistScope	= "session"	
		};
	
		// custom settings
		settings = {
			authorName = "Luis Majano",
			maxRSSBodyLength = "200"
		};
		
		// environment settings, create a detectEnvironment() method to detect it yourself.
		// create a function with the name of the environment so it can be executed if that environment is detected
		// the value of the environment is a list of regex patterns to match the cgi.http_host.
		environments = {
			dev = "^cf.*,^railo.*"
		};
		
		//LogBox DSL
		logBox = {
			// Define Appenders
			appenders = {
				files = {class="coldbox.system.logging.appenders.RollingFileAppender",
						 properties={
						 	filePath = "logs", fileName=coldbox.appName, fileMaxArchives = 2, FileMaxSize=2000
						 }
				}	
			},
			// Root Logger
			root = { levelmax="INFO", appenders="*" },
			// Implicit Level Categories
			info = [ "coldbox.system" ] 
		};
		
		//Layout Settings
		layoutSettings = {
			defaultLayout = "Main.cfm",
			defaultView   = ""
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
			 properties={}
			},
			//Security
			{class="cbsecurity.interceptors.Security",
			 properties={
				rulesSource = "xml",
				rulesFile = "config/securityRules.xml.cfm",
				validatorModel="SecurityService" 
			 }
			}
		];
		
		
		//Register Layouts
		layouts = [
			{ name = "ajax",
		 	  file = "ajax.cfm",
			  folders = "ajax"
			}
		];
	}
	
	function dev(){
		coldbox.handlerCaching=false;
		coldbox.handlersIndexAutoReload = true;
		coldbox.debugMode = false;
		coldbox.eventcaching = true;
		
		wirebox.singletonReload = true;
	}
	
}