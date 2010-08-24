<div class="framing">
	<h2>
	<cfif left(rc.LOName,2) is 'vw'>This is the view '<cfoutput>#rc.LOName#</cfoutput>' used to display the feed
	<cfelseif rc.LOName is 'Bandwidth'>This is the layout used to cache and display the '<cfoutput>#rc.LOName#</cfoutput>' feed example using HTTP headers
	<cfelse>This is the layout used to display the '<cfoutput>#rc.LOName#</cfoutput>' feed</cfif>
	</h2>
	<cfoutput><pre>#rc.dumpLO#</pre></cfoutput>
</div>
