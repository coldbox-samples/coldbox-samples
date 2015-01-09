<cfscript>
	// General Properties
	setUniqueURLS(false);
	//setAutoReload(false);
	
	// Base URL
	if( len(getSetting('AppMapping') ) lte 1){
		setBaseURL("http://#cgi.HTTP_HOST#/index.cfm");
	}
	else{
		setBaseURL("http://#cgi.HTTP_HOST#/#getSetting('AppMapping')#/index.cfm");
	}
	
	// MY Routes
	addRoute(pattern="entry/:id",handler="blog",action="viewPost");
	addRoute(pattern="blog/:action",handler="blog");
	addRoute(pattern="blog",handler="blog",action="entries");
	addRoute(pattern="rss/:feedType?",handler="blog",action="rss",feedType="full");
	
	// Your Application Routes
	addRoute(pattern=":handler/:action?");
</cfscript>