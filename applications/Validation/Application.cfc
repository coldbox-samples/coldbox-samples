/** 
 * Validation Sample
 */
component extends="coldbox.system.Coldbox" {
	
	// Application properties
	this.name = "validation" & hash(getCurrentTemplatePath());
	this.sessionManagement = true;
	this.sessionTimeout = createTimeSpan(0,0,90,0);
	this.setClientCookies = true;
	
	// ColdBox Specifics
	COLDBOX_APP_ROOT_PATH = getDirectoryFromPath(getCurrentTemplatePath());
	COLDBOX_APP_MAPPING = "";
	COLDBOX_CONFIG_FILE = "";
	COLDBOX_APP_KEY = "";
	
	// fix for nested orm apps in Mac OS
	this.mappings["/"] = COLDBOX_APP_ROOT_PATH;
	this.mappings["/validationSample"] = COLDBOX_APP_ROOT_PATH;
	
	// ORM SETTINGS
	this.ormEnabled = true;
	this.datasource = "validationSample";
	this.ormSettings = {
		dbcreate = "dropcreate",
		eventhandling = true,
		flushAtRequestEnd = false,
		cfclocation = "model",
		logsql = true,
		useDBForMapping = false,
		secondaryCacheEnabled = false
	};
	
	
	
	public boolean function onApplicationStart() output=false {
		loadColdBox();
		return true;
	}
	
	public boolean function onRequestStart(String targetPage){
		//ORM Reload
		if( structKeyExists(URL,"ORMReload") ){
			ORMReload();
		}
		// Reload Checks
		reloadChecks();
		
		//Process a ColdBox request only
		if( findNoCase('index.cfm',listLast(arguments.targetPage,"/")) ){
			processColdBoxRequest();
		}
		
		return true;
	}
	
}