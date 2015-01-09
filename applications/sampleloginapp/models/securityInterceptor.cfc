/**
********************************************************************************
Copyright 2005-2007 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
www.coldboxframework.com | www.luismajano.com | www.ortussolutions.com
********************************************************************************

Author     :	Luis Majano
Date        :	9/28/2007
Description :
	A simple security interceptor

	extends="coldbox.system.interceptor" by default because the framework
	knows its an interceptor by convension.
*/
component {
	
	// Pre execution process
	function preProcess( requird any event, required struct interceptData ) {
		var rc = Event.getCollection();
		var loggingIn = false;
		var sessionStorage = getInstance( 'sessionStorage@cbstorages' );
		var messageBox = getInstance( 'messagebox@cbmessagebox' );

		//Are we logging In
		if ( event.getCurrentEvent() eq "General.doLogin" ) {
			loggingIn = true;
		}

		//Login Check
		if ( (not sessionStorage.exists("loggedin") or not sessionStorage.getVar("loggedin") ) 
				and not loggingIn ){
			//Override the incoming event.
			Event.overrideEvent("General.Login");
			if( messageBox.isEmptyMessage() ) {
				messageBox.warn("Interceptor Says: Please log in first");
			}
		}
	}

}