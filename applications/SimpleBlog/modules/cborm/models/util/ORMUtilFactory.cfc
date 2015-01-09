/**
********************************************************************************
Copyright Since 2005 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
www.coldbox.org | www.luismajano.com | www.ortussolutions.com
********************************************************************************
Author      :	Luis Majano & Mike McKellip
Description :

A simple factory to return the right ORM utility according to CFML engine

----------------------------------------------------------------------->
*/
import cborm.models.util.*;

component{

	public any function getORMUtil() {
		// Adobe ColdFusion
		if( getPlatform() == "ColdFusion Server" )
			return new CFORMUtil();
		// Railo >= 4.3 MultiDatasource Support
		if( getRailoVersion() >= "4.3.0.000" )
			return new RailoORMUtil();
		// Railo >= 4.3
		return new ORMUtil();
	}

	/**
	* Get platform name
	*/
	private string function getPlatform() {
		return server.coldfusion.productname;
	}

	/**
	* Get railo version
	*/
	private string function getRailoVersion() {
		return server.railo.version;
	}

}