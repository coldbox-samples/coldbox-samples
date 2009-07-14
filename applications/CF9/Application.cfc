/**
********************************************************************************
Copyright 2005-2007 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
www.coldboxframework.com | www.luismajano.com | www.ortussolutions.com
********************************************************************************

Author     :	Luis Majano
Date        :	10/16/2007
Description :
	This is the Application.cfc for usage withing the ColdBox Framework.
	Make sure that it extends the coldbox object:
	coldbox.system.Coldbox
	
	So if you have refactored your framework, make sure it extends coldbox.
 
@output false
*/
component{
	// Application properties
	this.name = hash(getCurrentTemplatePath());
	this.sessionManagement = true;
	this.sessionTimeout = createTimeSpan(0,0,30,0);
	this.setClientCookies = true;
	
	// Mappings Imports
	this.mappings["/coldbox"] = "C:\Inetpub\wwwroot\cboxdev\core-root\coldbox";
	import coldbox.system.*;
	
	// ColdBox Specifics
	COLDBOX_APP_ROOT_PATH = getDirectoryFromPath(getCurrentTemplatePath());
	COLDBOX_CONFIG_FILE = "";
	COLDBOX_APP_KEY = "";

	public boolean function onApplicationStart() output=false{
		application.cbBootstrap = new Coldbox(COLDBOX_CONFIG_FILE,COLDBOX_APP_ROOT_PATH,COLDBOX_APP_KEY);
		application.cbBootstrap.loadColdbox();
		return true;
	}

	
	public boolean function onRequestStart(String targetPage){
		// Bootstrap Reinit
		if( not structKeyExists(application,"cbBootstrap") or application.cbBootStrap.isfwReinit() ){
			lock name="coldbox.bootstrap_#this.name#" type="exclusive" timeout="5" throwonTimeout=true{
				structDelete(application,"cbBootStrap");
				application.cbBootstrap = new Coldbox(COLDBOX_CONFIG_FILE,COLDBOX_APP_ROOT_PATH,COLDBOX_APP_KEY);
			}		
		}
		
		// Reload Checks
		application.cbBootStrap.reloadChecks();
		
		//Process a ColdBox request only
		if( findNoCase('index.cfm',listLast(arguments.targetPage,"/")) ){
			application.cbBootStrap.processColdBoxRequest();
		}
		
		return true;
	}
	
	public void function onSessionStart() output=false{
		application.cbBootStrap.onSessionStart();
	}
	
	public void function onSessionEnd(struct sessionScope, struct appScope) output=false{
		arguments.appScope.cbBootStrap.onSessionEnd(argumentCollection=arguments);
	}
	
}