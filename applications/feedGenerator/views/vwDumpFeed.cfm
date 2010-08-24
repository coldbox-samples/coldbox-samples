<div class="framing">
	<h2>This is the XML dump for the '<cfoutput>#rc.COMname#</cfoutput>' feed example</h2>
	<cfif not len(rc.DumpXML)>XML file could not be found on server
	<cfelse><cfoutput><pre>#rc.DumpXML#</pre></cfoutput></cfif>
</div>