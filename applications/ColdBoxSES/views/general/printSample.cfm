<cfoutput>
<h1>#Event.getValue("welcomeMessage")#</h1>
<h5>You are running #getSetting("codename",1)# #getSetting("version",1)# (#getsetting("suffix",1)#)</h5>

When you click on the link below the URL will match a different route that adds the "printIt" variable to the request collection 
automatically.  Check config/routes.cfm to see this configuration. 
<hr>
<h5>
	<cfif len( rc.printit ) >
		<a href="index.cfm/printSample">Return to normal layout</a>
	<cfelse>
		<a href="index.cfm/printSample/print">Print This Page</a>
	</cfif>
</h5>
<h1>RC Scope dump</h1>
<cfdump var="#rc#">
</cfoutput>