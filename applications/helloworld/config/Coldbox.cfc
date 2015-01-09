component {
		
	// Configure ColdBox Application
	function configure(){
	
		// coldbox directives
		coldbox = {
			//Application Setup
			appName 				= "Your app Name Here",
			
			//Development Settings
			debugMode				= true,
			debugPassword			= "",
			reinitPassword			= "",
			handlersIndexAutoReload = true,
			configAutoReload		= false,
			customErrorTemplate		= '/coldbox/system/includes/BugReport.cfm',
			
			//Implicit Events
			defaultEvent			= "general.hello",
				
			//Application Aspects
			handlerCaching 			= false,
			eventCaching			= false
		};
			
		interceptors = [
			// Need to configure the tracer appender after confguration loads 
			// otherwise the debugger module won't have been loaded yet.
			{ class="#appMapping#.interceptors.LogBox" }
		];
		
	}

}