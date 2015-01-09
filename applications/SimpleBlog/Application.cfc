component extends="coldbox.system.Bootstrap" {
	this.name = hash(getCurrentTemplatePath()); 
	this.sessionManagement = true;
	this.sessionTimeout = createTimeSpan(0,0,30,0);
	this.setClientCookies = true;
	
	// ORM Settings
	root = GetDirectoryFromPath( GetBaseTemplatePath() );
	this.mappings["/models"] = root & "models\";
	this.mappings["/cborm"] = root & "modules\cborm";
	this.ormEnabled = true;
	this.datasource = "simpleblog";
	this.ormSettings = {
		cfclocation="models",
		dialect = "MySQLwithInnoDB",
		logSQL = true,
		flushAtRequestEnd = false,
		eventHandling = true,
		eventHandler = "cborm.models.EventHandler"
	};
	
	function onRequestStart( required string targetPage ) {
		
		// ORM Reload Check
		if( structKeyExists( url, "ormreload" ) ) {
			ORMReload();
		}
		
		reloadChecks();
		
		// Process A ColdBox Request Only
		if( findNoCase( 'index.cfm', listLast( arguments.targetPage, '/' ) ) ) {
			processColdBoxRequest();
		} 			
		
		return true;
	}		
}

