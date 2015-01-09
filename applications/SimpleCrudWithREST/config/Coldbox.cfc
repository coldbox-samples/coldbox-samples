<cfcomponent output="false" hint="My App Configuration">
<cfscript>
// Configure ColdBox Application
function configure(){

	// coldbox directives
	coldbox = {
		//Application Setup
		appName 				= "Simple Crud With REST",

		//Development Settings
		debugMode				= true,
		debugPassword			= "",
		reinitPassword			= "",
		handlersIndexAutoReload = true,

		//Implicit Events
		defaultEvent			= "contacts.index",
		requestStartHandler		= "",
		requestEndHandler		= "",
		applicationStartHandler = "",
		applicationEndHandler	= "",
		sessionStartHandler 	= "",
		sessionEndHandler		= "",
		missingTemplateHandler	= "",

		//Error/Exception Handling
		exceptionHandler		= "",
		onInvalidEvent			= "",
		customErrorTemplate		= "",

		//Application Aspects
		handlerCaching 			= false,
		eventCaching			= false
	};

	// Custom Settings
	settings = {
	};

	// environment settings, create a detectEnvironment() method to detect it yourself.
	// create a function with the name of the environment so it can be executed if that environment is detected
	// the value of the environment is a list of regex patterns to match the cgi.http_host.
	environments = {
		development = "^localhost,^cf,^railo"
	};

	//Layout Settings
	layoutSettings = {
		defaultLayout = "Layout.Main.cfm"
	};

	//Register interceptors as an array, we need order
	interceptors = [
		 //SES
		 {class="coldbox.system.interceptors.SES"}
	];

	datasources = {
		myDSN = {name="contacts",dbtype="mysql"}
	};

}

function development(){
	coldbox.debugPassword = "";
	coldbox.debugMode = true;
	coldbox.reinitPassword = "";
	coldbox.handlerCaching = false;
	coldbox.handlersIndexAutoReload = true;
	coldbox.eventCaching = true;
}

</cfscript>
</cfcomponent>