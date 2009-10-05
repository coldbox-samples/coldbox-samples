<!-----------------------------------------------------------------------
Author 	 :	Luis Majano
Date     :	September 25, 2005
Description : 			
		
Modification History:
Sep/25/2005 - Luis Majano
	-Created the template.
----------------------------------------------------------------------->
<cfcomponent name="ehGeneral" extends="coldbox.system.EventHandler" output="false">

	<!--- ************************************************************* --->
	<cffunction name="onAppStart" access="public" returntype="void" output="false">
		<cfargument name="Event" type="coldbox.system.beans.requestContext">
	</cffunction>
	<!--- ************************************************************* --->

	<!--- ************************************************************* --->
	<cffunction name="dspHello" access="public" returntype="void" output="false">
		<cfargument name="Event" type="coldbox.system.beans.requestContext">
		<cfscript>
		//Load the hello world class
		Event.setvalue("HelloWorldObj", getPlugin("JavaLoader").create("HelloWorld").init());
		getPlugin("logger").tracer("MyLoader just finished loading the HelloWorld Class object.");
		Event.setView("vwHello");
	</cfscript>
	</cffunction>
	<!--- ************************************************************* --->

</cfcomponent>