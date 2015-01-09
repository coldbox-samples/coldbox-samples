<cfoutput>
<h1>#Event.getValue("welcomeMessage")#</h1>

This is the <strong>general.index</strong> event, but <strong>/home</strong> routes here as well.<br>
<br>
Since this is the default event, you may need to click the "Simple Route" tab to actually show the /home route in the URL.
<h1>RC Scope dump</h1>
<cfdump var="#rc#">
</cfoutput>