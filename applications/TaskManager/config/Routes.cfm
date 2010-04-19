<cfscript>
	// General Properties
	setUniqueURLS(false);	
	setAutoReload(false);
	
	// Base URL
	if( len(getSetting('AppMapping') ) lte 1){
		setBaseURL("http://#cgi.HTTP_HOST#/index.cfm");
	}
	else{
		setBaseURL("http://#cgi.HTTP_HOST#/#getSetting('AppMapping')#/index.cfm");
	}
	
	// Your Application Routes
	formatConstraints = {format="(xml|json)"};
	
	addRoute(pattern="/api/:format/tasks/completed",handler="tasksAPI",action="list",constraints=formatConstraints,completed=true);
	addRoute(pattern="/api/:format/tasks",handler="tasksAPI",action="list",constraints=formatConstraints);
	addRoute(pattern="/api/:format?",handler="tasksAPI",action="invalid");
	
	addRoute(pattern="/tasks/list/:status?",handler="tasks",action="index");
	addRoute(pattern=":handler/:action?");
</cfscript>