<cfset applicationstorage = getInstance('applicationstorage@cbstorages')>
<cfsetting showDebugOutput="No">
<!--- Look for two application variables we are using to store the feed updated date and ETag --->
<cfif applicationstorage.exists('feedETag') and applicationstorage.exists('feedTimeStamp')>
	<cfset rc.feedETag = applicationstorage.getVar('feedETag')/>
	<cfset rc.feedTimeStamp = applicationstorage.getVar('feedTimeStamp')/>
</cfif>
<!--- Scan the incoming HTTP header for a Conditional Get 'If-Modified-Since' request --->
<cfif StructKeyExists(GetHttpRequestData().headers, "If-Modified-Since")>
	<!--- If Conditional Get request found, save its value to the Request Variable 'httpModSinceDate' --->
	<cfset rc.httpModSinceDate = ParseDateTime(GetHttpRequestData().headers["If-Modified-Since"])/>
  <!--- Compare the Conditional Get value with our application variables --->
	<cfif DateDiff("n", rc.feedTimeStamp, rc.httpModSinceDate) is 0 and GetHttpRequestData().headers["If-None-Match"] eq rc.feedETag>
	<!--- If the compare matches, send a header 304 code stating our feed has not changed.
		      This tells the browser or reader to use a local cache copy --->
		<cfheader statuscode="304" statustext="Not Modified"/> 
		<cfabort/>
	</cfif>
</cfif>
<!--- If the compared matches do not match we then generate and display the feed
      and include the Last-Modified and ETag headers to the page --->
<cfheader name="Last-Modified" value="#rc.feedTimeStamp#"/>
<cfheader name="ETag" value='#rc.feedETag#'/>
<cfcontent type="application/xml"><cfoutput>#trim(renderView())#</cfoutput>