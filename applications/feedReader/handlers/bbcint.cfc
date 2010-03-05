<!-----------------------------------------------------------------------
Author 	 :	Ben Garrett
Date     :	September 1, 2009
Description : 			
	This is a ColdBox event handler for the feedReader based BBC International top news listing.
	
----------------------------------------------------------------------->
<cfcomponent name="bbcint" extends="coldbox.system.EventHandler" output="false">

<!------------------------------------------- CONSTRUCTOR ------------------------------------------>

	<cffunction name="init" access="public" returntype="bbcint" output="false">
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
		<cfset Event.setView("bbcint/empty")>
	</cffunction>
	
	<!--- Search Form Submission --->
	<cffunction name="list" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = event.getCollection()>
		<!--- Obtain BBC International Top News feed --->
		<cfset rc.getBBCIntURL = '#getSetting("BBCIntURL")#?format=xml'/>
		<cfset rc.rdata = getPlugin("FeedReader").readFeed(Feedurl=rc.getBBCIntURL,itemsType="query",maxItems=5)>
		<!--- Organise data --->
		<cfset Event.setView("bbcint/results")>
	</cffunction>

<!------------------------------------------- PRIVATE EVENTS ------------------------------------------>
	
</cfcomponent>