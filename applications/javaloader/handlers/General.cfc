<!-----------------------------------------------------------------------
Author 	 :	Luis Majano
Date     :	September 25, 2005
Description :

Modification History:
Sep/25/2005 - Luis Majano
	-Created the template.
----------------------------------------------------------------------->
<cfcomponent name="General" extends="coldbox.system.EventHandler" output="false">

	<!--- ************************************************************* --->
	<cffunction name="onAppStart" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
	</cffunction>
	<!--- ************************************************************* --->

	<!--- ************************************************************* --->
	<cffunction name="dspHello" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfscript>
		//Load the hello world class
		Event.setvalue("HelloWorldObj", getPlugin("JavaLoader").create("HelloWorld").init());
		getPlugin("Logger").tracer("MyLoader just finished loading the HelloWorld Class object.");
		Event.setView("Hello");
	</cfscript>
	</cffunction>
	<!--- ************************************************************* --->

</cfcomponent>