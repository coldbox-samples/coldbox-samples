<cfscript>
	// General Properties

	// Base URL
	if( len(getSetting('AppMapping') ) lte 1){
		setBaseURL("http://#cgi.HTTP_HOST#/index.cfm");
	}
	else{
		setBaseURL("http://#cgi.HTTP_HOST#/#getSetting('AppMapping')#/index.cfm");
	}

	with(pattern="/api", handler="rest.")
		.addRoute(pattern="/hello", handler="contacts", action="hello")
		.addRoute(pattern="/contacts", handler="contacts", action="list")
		.addRoute(pattern="/:action", handler="contacts")
	.endWith();

	// Your Application Routes
	addRoute(pattern=":handler/:action?");
</cfscript>