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
 
*/
component extends="coldbox.system.Bootstrap" output="false"{
	// Application properties
	this.name = "TaskManager" & hash(getCurrentTemplatePath());
	this.sessionManagement = true;
	this.sessionTimeout = createTimeSpan(0,0,30,0);
	this.setClientCookies = true;
	
	// ColdBox Specifics
	COLDBOX_APP_ROOT_PATH = getDirectoryFromPath(getCurrentTemplatePath());
	COLDBOX_APP_MAPPING = "";
	COLDBOX_CONFIG_FILE = "";
	COLDBOX_APP_KEY = "";
	
	root = GetDirectoryFromPath( GetBaseTemplatePath() );
	this.mappings["/models"] = root & "models";
	this.mappings["/cborm"] = root & "modules\cborm";
		
	// ORM Setup
	this.ormEnabled = true;
	this.datasource = "taskmanager";
	this.ormSettings = {
		cfclocation=expandPath("/models"),
		dbcreate = "update",
		logSQL = true,
		eventhandling = true,
		eventHandler = "cborm.models.EventHandler",
		flushAtRequestEnd = false
	};
	
	//ORMReload();
	
	public boolean function onApplicationStart() output=false{
		//Load ColdBox
		loadColdBox();
		return true;
	}

	
	public boolean function onRequestStart(String targetPage){
		// Reload Checks
		reloadChecks();
		
		//ORM Reload
		if( structKeyExists(URL,"ORMReload") ){
			ORMReload();
		}
		
		//Process a ColdBox request only
		if( findNoCase('index.cfm',listLast(arguments.targetPage,"/")) ){
			processColdBoxRequest();
		}
		
		return true;
	}
	
}