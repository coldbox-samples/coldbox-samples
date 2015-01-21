component {
			
		// Configure ColdBox Application
		function configure(){
		
			// coldbox directives
			coldbox = {
				//Application Setup
				appName 				= "ORM Example",
				
				//Development Settings
				debugMode				= true,
				debugPassword			= "",
				reinitPassword			= "",
				handlersIndexAutoReload = true,
				configAutoReload		= false,
				
				//Implicit Events
				defaultEvent			= "general.index",
				requestStartHandler		= "Main.onRequestStart",
				
				//Error/Exception Handling
				customErrorTemplate		= "/coldbox/system/includes/BugReport.cfm",
					
				//Application Aspects
				handlerCaching 			= false,
				eventCaching			= false
			};
			
			//Register interceptors as an array, we need order
			interceptors = [
				 //SES
				 {class="coldbox.system.interceptors.SES"}
			];
			
		}

}