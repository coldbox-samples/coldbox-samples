<cfscript>
	// General Properties
	setEnabled(true);
	setUniqueURLS(false);
	//setAutoReload(false);

	// Base URL
	if( len(getSetting('AppMapping') ) lte 1){
		setBaseURL("http://#cgi.HTTP_HOST#/index.cfm");
	}
	else{
		setBaseURL("http://#cgi.HTTP_HOST#/#getSetting('AppMapping')#/index.cfm");
	}

	// Your Application Routes
	addRoute(":handler/:action/:id");
	addRoute(":handler/:action");
	addRoute(":handler");
</cfscript>