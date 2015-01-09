/**
********************************************************************************
Copyright 2005-2007 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
www.coldbox.org | www.luismajano.com | www.ortussolutions.com
********************************************************************************

Author     :	Luis Majano
Date        :	10/16/2007
Description :
	This is the bootstrapper Application.cfc for ColdBox Applications.
	It uses inheritance on the CFC, so if you do not want inheritance
	then use the Application_noinheritance.cfc instead.
	
	
*/
component extends="coldbox.system.Bootstrap" {
	this.name = hash(getCurrentTemplatePath()); 
	this.sessionManagement = true;
	this.sessionTimeout = createTimeSpan(0,0,30,0);
	this.setClientCookies = true;
	
	this.mappings[ 'cbdebugger' ] = expandPath( 'modules/cbdebugger' );
		
}