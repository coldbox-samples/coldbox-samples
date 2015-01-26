component {
		
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
			customErrorTemplate		= "/coldbox/system/includes/BugReport.cfm",
	
			//Application Aspects
			handlerCaching 			= false,
			eventCaching			= false
		};
	
		//Layout Settings
		layoutSettings = {
			defaultLayout = "Main.cfm"
		};
	
		//Register interceptors as an array, we need order
		interceptors = [
			 //Autowire
		 {class="#appMapwithDots#models.securityInterceptor"}
		];
	
		//LogBox DSL
		logBox = {
			// Define Appenders
			appenders = {
				coldboxFile = {
					class="coldbox.system.logging.appenders.RollingFileAppender",
					properties={filePath="logs",
					fileName=coldbox.appname,
					autoExpand=true,
					fileMaxSize=2000,
					fileMaxArchives=2,
					async=true}
				}
			},
			// Root Logger
			root = { levelmax="INFO", appenders="*" },
			// Implicit Level Categories
			info = [ "coldbox.system" ]
		};
	
	}

}
