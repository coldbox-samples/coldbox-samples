/********************************************************************************
* Copyright Since 2005 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
* www.coldbox.org | www.luismajano.com | www.ortussolutions.com
********************************************************************************
* The JavaLoader WireBox DSL
*/
component implements="coldbox.system.ioc.dsl.IDSLBuilder" accessors="true"{

	property name="injector";
	property name="log";


	/**
	* Constructor as per interface
	*/
	public any function init( required any injector ) output="false"{
		variables.injector 	= arguments.injector;
		variables.log		= arguments.injector.getLogBox().getLogger( this );

		return this;
	}

	/**
	* Process an incoming DSL definition and produce an object with it.
	*/
	public any function process( required definition, targetObject ) output="false"{
		var DSLNamespace = listFirst( arguments.definition.dsl, ":" );
		switch( DSLNamespace ){
			case "webservice" : { return getWebserviceDSL( argumentCollection=arguments );}
		}
	}

	/**
	* Get a Webservice Dependency
	*/
	function getWebserviceDSL( required definition, targetObject ){
		var oWebservices 	= variables.injector.getInstance( "webservices@cbsoap" );
		var thisType 		= arguments.definition.dsl;
		var thisTypeLen 	= listLen( thisType, ":" );

		switch( thisTypeLen ){
			// webservice, take name from property as default.
			case 1: { return oWebservices.getWSobj( arguments.definition.name ); break; }
			// webservice:alias
			case 2: { return oWebservices.getWSobj( getToken( thisType, 2, ":" ) ); break; }
		}
	}

}