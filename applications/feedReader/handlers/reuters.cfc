<!-----------------------------------------------------------------------
Author 	 :	Ben Garrett
Date     :	February 18, 2009
Description : 			
	This is a ColdBox event handler for the feedReader based Reuters top news listing.
	
----------------------------------------------------------------------->
<cfcomponent name="reuters" extends="coldbox.system.EventHandler" output="false">

<!------------------------------------------- CONSTRUCTOR ------------------------------------------>

	<cffunction name="init" access="public" returntype="reuters" output="false">
		<cfargument name="controller" type="any">
		<cfset super.init(arguments.controller)>
		<cfreturn this>
	</cffunction>

<!------------------------------------------- PUBLIC EVENTS ------------------------------------------>

	<!--- Default Action --->
	<cffunction name="index" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = event.getCollection()>
		<!--- Default values when there is no form submission --->
		
		<!--- Set the View To Display, after Logic --->
		<cfset Event.setView("reuters/empty")>
	</cffunction>
	
	<!--- Search Form Submission --->
	<cffunction name="list" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = event.getCollection()>
		<!--- Obtain Reuters Top News feed --->
		<cfset rc.getReutersURL = '#getSetting("ReutersURL")#?format=xml'/>
		<cfset rc.rdata = getPlugin("FeedReader").readFeed(Feedurl=rc.getReutersURL,itemsType="query")>
		<!--- Organise data --->
		<cfset Event.setView("reuters/results")>
	</cffunction>

<!------------------------------------------- PRIVATE EVENTS ------------------------------------------>
	
</cfcomponent>