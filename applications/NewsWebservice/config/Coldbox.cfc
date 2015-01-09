component {
	function configure(){

		// coldbox directives
		coldbox = {
			//Application Setup
			appName 				= "News Webservices Feed",

			//Development Settings
			debugMode				= true,
			debugPassword			= "",
			reinitPassword			= "",
			handlersIndexAutoReload = false,
			configAutoReload		= false,

			//Implicit Events
			defaultEvent			= "general.dspHome",

			//Error/Exception Handling
			exceptionHandler		= "",
			onInvalidEvent			= "",
			customErrorTemplate		= "/coldbox/system/includes/BugReport.cfm",

			//Application Aspects
			handlerCaching 			= false,
			eventCaching			= false,
			proxyReturnCollection 	= false,
			flashURLPersistScope	= "session"
		};

		//webservices
		webservices = {
			newsfeed = "http://www.coldbox.org/distribution/updatews.cfc?wsdl"
		};
	}

}