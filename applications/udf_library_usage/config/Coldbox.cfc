component {
	
	// Configure ColdBox Application
	function configure(){
	
		//converts the coldbox app mapping to a dot class path for instantiations, not part of a regular config
		var appMapwithDots = reReplace(appMapping,"(/|\\)",".","all");
	
		// coldbox directives
		coldbox = {
			//Application Setup
			appName 				= "Sample UDF Library Usage",
	
			//Development Settings
			debugMode				= true,
			debugPassword			= "coldbox",
			reinitPassword			= "",
			handlersIndexAutoReload = false,
			configAutoReload		= false,
			customErrorTemplate		= '/coldbox/system/includes/BugReport.cfm',
	
			//Implicit Events
			defaultEvent			= "general.home",
	
			// Application Helper UDFs
			applicationHelper			= "includes/udf.cfm",
	
			//Application Aspects
			handlerCaching 			= false,
			eventCaching			= false
		};
	
		//Layout Settings
		layoutSettings = {
			defaultLayout = "Main.cfm"
		};
	
		//LogBox DSL
		logBox = {
			// Define Appenders
			appenders = {
				coldboxFile = {
					class="coldbox.system.logging.appenders.rollingFileAppender",
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