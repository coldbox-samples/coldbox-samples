<cfcomponent output="false">
<cfscript>

	// Configure ColdBox Application
	function configure(){
	
		// coldbox directives
		coldbox = {
			//Application Setup
			appName 				= "ColdBox Samples Browser",
			
			//Development Settings
			debugMode				= true,
			debugPassword			= "",
			reinitPassword			= "",
			handlersIndexAutoReload = false,
			
			//Implicit Events
			defaultEvent			= "Samples.index",
				
			//Application Aspects
			handlerCaching 			= true,
			eventCaching			= true
		};
	
		// custom settings
		settings = {
			amazonURL = "http://www.amazon.com/o/registry/7DPYG3RZG3AF",
			coldboxURL = "http://coldbox.org",
			blogURL = "http://blog.coldbox.org",
			coldboxAPIURl = "http://coldbox.org/api",
			trackerURL = "http://coldbox.assembla.com",
			coldboxReaderApp = "applications/ColdBoxReader",
			cfcGeneratorApp = "applications/cfcGenerator",
			TransferApp = "applications/TransferSample",
			TransferApp2 = "applications/TransferSample2",
			SecurityApp = "applications/securitysample"
		};
		
		//Layout Settings
		layoutSettings = {
			defaultLayout = "Layout.Main.cfm"
		};
		
		//Register interceptors as an array, we need order
		interceptors = [
			//Autowire
			{class="coldbox.system.interceptors.Autowire",
			 properties={}
			},
			//SES
			{class="coldbox.system.interceptors.SES",
			 properties={}
			}
		];
		
		
		//i18n & Localization
		i18n = {
			defaultResourceBundle = "includes/i18n/main",
			defaultLocale = "en_US",
			localeStorage = "cookie"
		};
		
		//LogBox DSL
		logBox = {
			// Define Appenders
			appenders = {
				coldboxTracer = { class="coldbox.system.logging.appenders.ColdboxTracerAppender" }
			},
			// Root Logger
			root = { levelmax="INFO", appenders="*" },
			// Implicit Level Categories
			info = [ "coldbox.system" ] 
		};
		
	}

</cfscript>
</cfcomponent>
