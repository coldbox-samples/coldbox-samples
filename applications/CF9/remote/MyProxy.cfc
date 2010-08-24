/**
********************************************************************************
Copyright 2005-2007 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
www.coldboxframework.com | www.luismajano.com | www.ortussolutions.com
********************************************************************************

Author     :	Luis Majano
Date        :	10/16/2007
Description :
	This proxy is an inherited coldbox remote proxy used for enabling
	coldbox as a model framework. You will usually create concrete methods
	on this proxy object.  Please do not use the method below, it is
	just set for demonstration purposes.

@output false
*/
component MyProxy extends="coldbox.system.remote.ColdboxProxy"{

	/**
	* @hint My First Remote Call method.
	* @output false
	*/
	remote any function yourRemoteCall(){
		var results = "";
		
		// The event to execute either set internally or from caller.
		arguments.event = "";
		
		//process a coldbox request
		results = super.process(argumentCollection=arguments);
		
		return results;
	}

}