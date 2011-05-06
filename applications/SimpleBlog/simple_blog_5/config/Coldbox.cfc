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
			customErrorTemplate		= "includes/generic_error.cfm",
				
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
				coldboxTracer = { class="coldbox.system.logging.appenders.ColdboxTracerAppender" },
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
			 properties={
			 	entityInjection = true
			 }
			},
			//SES
			{class="coldbox.system.interceptors.SES",
			 properties={}
			},
			//Security
			{class="coldbox.system.interceptors.Security",
			 properties={
				rulesSource = "xml",
				rulesFile = "config/securityRules.xml.cfm",
				validatorModel="SecurityService" 
			 }
			}
		];
		
		//Model Integration view WireBox
		wirebox = {
			enabled = true
		};
		
		//Datasources
		datasources = {
			blogDSN   = {name="simpleblog", dbType="mysql", username="", password=""}
		};
		
		//Register Layouts
		layouts = [
			{ name = "ajax",
		 	  file = "Layout.ajax.cfm",
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
	
</cfscript>
</cfcomponent>