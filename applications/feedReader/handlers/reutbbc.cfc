<!-----------------------------------------------------------------------
Author 	 :	Ben Garrett
Date     :	September 1, 2009
Description : 			
	This is a ColdBox event handler for the feedReader combined Reuters and BBC International top news listing.
	
----------------------------------------------------------------------->
<cfcomponent name="reutbbc" extends="coldbox.system.EventHandler" output="false">

<!------------------------------------------- CONSTRUCTOR ------------------------------------------>

	<cffunction name="init" access="public" returntype="reutbbc" output="false">
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
		<cfset Event.setView("reutbbc/empty")>
	</cffunction>
	
	<!--- Search Form Submission --->
	<cffunction name="list" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = event.getCollection()>
		<!--- Obtain Combined Top News feed --->
		<cfset rc.getReutersURL = '#getSetting("ReutersURL")#?format=xml'/>
		<cfset rc.getBBCIntURL = getSetting("BBCIntURL") />
		<cfset rc.getAPURL = '#getSetting("APURL")#?SITE=ALANN&SECTION=HOME' />
		<cfset rc.rdata = getPlugin("FeedReader").readFeed(Feedurl="#rc.getReutersURL#,#rc.getBBCIntURL#,#rc.getAPURL#",itemsType="query",maxItems="15")>
		<!--- Organise data --->
		<cfset Event.setView("reutbbc/results")>
	</cffunction>

<!------------------------------------------- PRIVATE EVENTS ------------------------------------------>
	
</cfcomponent>