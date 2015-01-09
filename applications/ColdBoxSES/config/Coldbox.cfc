component {

	// Configure ColdBox Application
	function configure(){

		// coldbox directives
		coldbox = {
			//Application Setup
			appName 				= "ColdBox_SES_Sample",
			eventName 				= "event",

			//Development Settings
			debugMode				= true,
			debugPassword			= "",
			reinitPassword			= "",
			handlersIndexAutoReload = true,
			configAutoReload		= false,

			//Implicit Events
			defaultEvent			= "General.index",

			//Error/Exception Handling
			exceptionHandler		= "",
			onInvalidEvent			= "",
			customErrorTemplate		= "/coldbox/system/includes/BugReport.cfm",

			//Application Aspects
			handlerCaching 			= true,
			eventCaching			= false,
			proxyReturnCollection 	= false,
			flashURLPersistScope	= "session"
		};

		// custom settings
		settings = {
			cookiestorage_encryption=true,
			cookiestorage_encryption_seed="coldboxseskey",
			MessageBox_storage_scope="session"
		};

		// environment settings, create a detectEnvironment() method to detect it yourself.
		// create a function with the name of the environment so it can be executed if that environment is detected
		// the value of the environment is a list of regex patterns to match the cgi.http_host.
		environments = {
			development = "localhost,dev.coldbox.com",
			staging = "staging.coldboxses.com",
			live = "www.coldboxses.com"
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
			{class="coldbox.system.interceptors.SES"}
		];
	}

	/**
	* Executed whenever the development environment is detected
	*/
	function development(){
		// Override coldbox directives
		coldbox.handlerCaching = false;
		coldbox.eventCaching = false;
		coldbox.handlersIndexAutoReload = true;
		coldbox.debugMode = true;
		coldbox.IOCObjectCaching = false;
	}

	/**
	* Executed whenever the staging environment is detected
	*/
	function staging(){
		// Override coldbox directives
		settings.BaseURL = "http://staging.coldboxses.com/";
	}


	/**
	* Executed whenever the live environment is detected
	*/
	function live(){
		// Override coldbox directives
		settings.BaseURL = "http://www.coldboxses.com/";
	}

}