<!-----------------------------------------------------------------------
Author 		:	Ben Garrett
Date		:	February 18, 2009
Description	: 			
	This is a ColdBox event handler for the feedReader based Flickr browser.
	
----------------------------------------------------------------------->
<cfcomponent name="flickr" extends="coldbox.system.EventHandler" output="false">

<!------------------------------------------- CONSTRUCTOR ------------------------------------------>

	<cffunction name="init" access="public" returntype="flickr" output="false">
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
    <cfset Event.setValue("tag_list", Event.getValue("tag_list", ''))>
		<!--- Set the View To Display, after Logic --->
		<cfset Event.setView("flickr/empty")>
	</cffunction>
	
	<!--- Search Form Submission --->
	<cffunction name="tags" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = event.getCollection()>
		
		<cfset Event.setValue("search_query", Event.getValue("search_query", ''))>
		<cfset Event.setValue("tag_list", Event.getValue("tag_list", ''))>
		<cfset Event.setValue("tag_mode", Event.getValue("tag_mode", getSetting("FlickrTags")))>
		
		<!--- Obtain Google Data API version 2 feed --->
		<cfset rc.getFlickrURL = '#getSetting("FlickrURL")#?tags=#rc.tag_list#&tagmode=#rc.tag_mode#&format=atom'/>
		<cfset rc.flickrdata = getPlugin("FeedReader").readFeed(Feedurl=rc.getFlickrURL)>
		<!--- Organise data --->
		<cfset Event.setView("flickr/results")>
	</cffunction>

<!------------------------------------------- PRIVATE EVENTS ------------------------------------------>
	
</cfcomponent>