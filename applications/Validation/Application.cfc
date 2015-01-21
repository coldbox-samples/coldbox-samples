/**
 * Validation Sample
 */
component extends="coldbox.system.Bootstrap" {

	// Application properties
	this.name = "Validation Sample" & hash(getCurrentTemplatePath());
	this.sessionManagement = true;
	this.sessionTimeout = createTimeSpan(0,0,90,0);
	this.setClientCookies = true;

	// ColdBox Specifics
	COLDBOX_APP_ROOT_PATH = getDirectoryFromPath(getCurrentTemplatePath());
	COLDBOX_APP_MAPPING = "";
	COLDBOX_CONFIG_FILE = "";
	COLDBOX_APP_KEY = "";

	// fix for nested orm apps in Mac OS
	this.mappings["/validationSample"] = COLDBOX_APP_ROOT_PATH;
	root = GetDirectoryFromPath( GetBaseTemplatePath() );
	this.mappings["/models"] = root & "models\";
	this.mappings["/cborm"] = root & "modules\cborm";

	// ORM SETTINGS
	this.ormEnabled = true;
	this.datasource = "validationSample";
	this.ormSettings = {
		dbcreate = "update",
		cfclocation="models",
		flushAtRequestEnd = false,
		autoManageSession	= false,
		logsql = true,
		eventHandling = true,
		eventHandler = "cborm.models.EventHandler"
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