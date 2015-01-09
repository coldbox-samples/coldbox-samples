<!-----------------------------------------------------------------------
********************************************************************************
Copyright Since 2005 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
www.coldbox.org | www.luismajano.com | www.ortussolutions.com
********************************************************************************

Author 	 :	Luis Majano
Date     :	September 23, 2005
Description :
	This is a webservices framework plugin.
	The refresh web service stubs code is thanks to Dave Stanten at
	Macromedia/Adobe.  dstanten@adobe.com

----------------------------------------------------------------------->
<cfcomponent hint="The Webservices Soap object"
			 output="false"
			 accessors="true"
			 singleton>

	<!--- Webservices alias container --->
	<cfproperty name="webservices" type="struct">

<!------------------------------------------- CONSTRUCTOR ------------------------------------------->

	<cffunction name="init" access="public" returntype="Webservices" output="false">
		<cfargument name="webservices" type="struct" required="true" inject="coldbox:setting:webservices">
		<cfscript>

			variables.webservices = arguments.webservices;

			return this;
		</cfscript>
	</cffunction>

<!------------------------------------------- PUBLIC ------------------------------------------->

	<cffunction name="registerWS" returntype="Webservices" access="public" hint="Register a new web service programmtically">
		<cfargument name="name" required="true" >
		<cfargument name="wsdl" required="true" >
		<cfset variables.webservices[ arguments.name ] = arguments.wsdl>
		<cfreturn this>
	</cffunction>

	<cffunction name="getWS" returntype="any" access="Public" hint="Get a web service's wsdl url from the configStruct according to which environment you are on." output="false">
		<cfargument name="name" hint="The name of the web service. If the web service is not found an exception is thrown." type="string" required="Yes">

		<cfif structKeyExists( variables.webservices , arguments.name)>
			<cfreturn variables.webservices[arguments.name]>
		</cfif>

		<cfthrow type="Webservices.WebServiceNotFoundException" message="The webservice #arguments.name# was not found in the configuration structure.">
	</cffunction>

	<cffunction name="getWSobj" access="Public"	hint="Get a reference to a webservice obj according to which environment you are on." output="false" returntype="any">
		<cfargument name="name" hint="The name of the web service. If the web service is not found an exception is thrown" type="string" required="Yes">

		<cfreturn createObject( "webservice", getWS(arguments.name) )>

	</cffunction>

	<cffunction name="refreshWS" access="Public" hint="Refresh a web service stub object" output="false" returntype="void">
		<cfargument name="webservice" hint="The name or wsdl URL of the web service to refresh" type="string" required="Yes">
		<!--- Get the Webservice from the configStruct --->
		<cfset var ws = getWS(arguments.webservice)>
		<cfset var rpcService = "">
		<cfset var factory = 0>

		<cfif ws neq "">
			<cfobject type="java" action="create" name="factory" class="coldfusion.server.ServiceFactory">
			<cfset rpcService = factory.XmlRpcService>
			<cfset rpcService.refreshWebService(ws)>
		<cfelse>
			<cfobject type="java" action="create" name="factory" class="coldfusion.server.ServiceFactory">
			<cfset rpcService = factory.XmlRpcService>
			<cfset rpcService.refreshWebService(arguments.webservice)>
		</cfif>
	</cffunction>

</cfcomponent>