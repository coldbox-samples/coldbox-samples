<!-----------------------------------------------------------------------
Author 	 :	Ben Garrett
Date     :	February 13, 2009
Description : 			
	This is a ColdBox event handler for the feedReader based YouTube browser.
	
----------------------------------------------------------------------->
<cfcomponent name="youtube" extends="coldbox.system.EventHandler" output="false">

<!------------------------------------------- CONSTRUCTOR ------------------------------------------>

	<cffunction name="init" access="public" returntype="youtube" output="false">
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
		<cfset Event.setValue("search_query", Event.getValue("search_query", ''))>
		<cfset Event.setValue("max_results", Event.getValue("max_results", getSetting("YouTubeDefaultMaxResults")))>
		<cfset Event.setValue("start_index", Event.getValue("start_index", getSetting("YouTubeDefaultStartIndex")))>
		<cfset Event.setValue("total_results", Event.getValue("total_results", 0))>
		<!--- Set the View To Display, after Logic --->
		<cfset Event.setView("youtube/empty")>
	</cffunction>
	
	<!--- Search Form Submission --->
	<cffunction name="search" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = event.getCollection()>
		<!--- Set search form defaults --->
		<cfif Event.getValue("submit", "") is "Submit">
			<cfset Event.setValue("page",1)>
		</cfif>
		<cfif IsNumeric(Event.getValue("page", ""))>
			<cfset Event.setValue("start_index", Event.getValue('page'))>
		<cfelse>
			<cfset Event.setValue("start_index", Event.getValue("start_index", getSetting("YouTubeDefaultStartIndex")))>
		</cfif>
		<cfset Event.setValue("search_query", Event.getValue("search_query", ""))>
		<cfset Event.setValue("max_results", Event.getValue("max_results", getSetting("YouTubeDefaultMaxResults")))>
		<!--- Page navigation modifications --->
		<cfif Event.getValue("submit", "") is 'Next'>
			<cfset Event.setValue("start_index", (rc.start_index+Event.getValue("max_results")))>
		</cfif>
		<cfif Event.getValue("submit", "") is 'Previous'>
			<cfset Event.setValue("start_index", (rc.start_index-Event.getValue("max_results")))>
		</cfif>
		<!--- Obtain Google Data API version 2 feed --->
		<cfset rc.getYoutubeURL = '#getSetting("YouTubeURL")#?q=#rc.search_query#&start-index=#rc.start_index#&max-results=#rc.max_results#&v=2'/>
		<cfset rc.ytdata = getPlugin("FeedReader").readFeed(Feedurl=rc.getYoutubeURL)>
		<!--- Adjust variables values with feed data --->
		<cfset rc.total_pages = Ceiling(rc.ytdata.opensearch.totalresults/rc.ytdata.opensearch.itemsperpage)/>
		<cfset rc.total_results = rc.ytdata.opensearch.totalresults/>
		<cfset rc.page = Ceiling(rc.start_index / rc.max_results)/>
		<!--- Search result statistics for display --->
		<cfset rc.dspCurPage = numSep(rc.page)/>
		<cfset rc.dspTotPage = numSep(rc.total_pages)/>
		<cfset rc.dspResPage = numSep(rc.total_results)/>
		<!--- Organise data --->
		<cfset Event.setView("youtube/results")>
	</cffunction>

<!------------------------------------------- PRIVATE EVENTS ------------------------------------------>

	<cffunction name="numSuff" access="private" returntype="string" output="false">
		<cfargument name="number" type="numeric" required="yes">
		<cfreturn getPlugin(plugin="Utilities",customPlugin=true).ordinalAbbr(arguments.number)/>
	</cffunction>

	<cffunction name="numSep" access="private" returntype="string" output="false">
		<cfargument name="number" type="numeric" required="yes">
		<cfreturn getPlugin(plugin="Utilities",customPlugin=true).oneKGrouping(arguments.number)/>
	</cffunction>
	
</cfcomponent>