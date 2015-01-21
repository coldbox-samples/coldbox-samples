component extends="coldbox.system.Bootstrap" {
	this.name = hash(getCurrentTemplatePath()); 
	this.sessionManagement = true;
	this.sessionTimeout = createTimeSpan(0,0,30,0);
	this.setClientCookies = true;
	
	// ORM Settings
	root = GetDirectoryFromPath( GetBaseTemplatePath() );
	this.mappings["/models"] = root & "models\";
	this.mappings["/cborm"] = root & "modules\cborm";
	
	// Use embedded H2 data source for non-Adobe engines
	if( server.ColdFusion.productName neq 'ColdFusion' ) {
		this.datasources["cfbookclub"] = {
			  class: 'org.h2.Driver',
			  connectionString: 'jdbc:h2:#root#H2DB\cfbookclub\cfbookclub;MODE=MySQL'
		};		
	}
	
	
	this.ormEnabled = true;
	this.datasource = "cfbookclub";
	this.ormSettings = {
		cfclocation="models",
		//dialect = "Derby",
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

