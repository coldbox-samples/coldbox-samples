<cfoutput>
<h1>#Event.getValue("welcomeMessage")#</h1>
This route uses three placeholders for <strong>year,</strong> <strong>month</strong>, and <strong>day</strong> but the month and day are optional.<br>
<br>
These links will all match this route, but the corresponding variables will be missing from the request collection:<br>
<br>
<ul>
	<li><a href="index.cfm/archive/#year( now() )#/08/20">index.cfm/archive/#year( now() )#/08/20</a></li>
	<li><a href="index.cfm/archive/#year( now() )#/08">index.cfm/archive/#year( now() )#/08</a></li>
	<li><a href="index.cfm/archive/#year( now() )#">index.cfm/archive/#year( now() )#</a></li> 
</ul>
<h1>RC Scope dump</h1>
<cfdump var="#rc#">
</cfoutput>