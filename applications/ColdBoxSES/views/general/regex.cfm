<cfoutput>
<h1>#Event.getValue("welcomeMessage")#</h1>

This route uses regex to match any string that ends with "day".  All the links below will match this route.
<br>
<ul>
	<li><a href="index.cfm/TGI/monday">index.cfm/TGI/monday</a></li>
	<li><a href="index.cfm/TGI/tuesday">index.cfm/TGI/tuesday</a></li>
	<li><a href="index.cfm/TGI/wednesday">index.cfm/TGI/wednesday</a></li>
	<li><a href="index.cfm/TGI/thursday">index.cfm/TGI/thursday</a></li>
	<li><a href="index.cfm/TGI/friday">index.cfm/TGI/friday</a></li>
	<li><a href="index.cfm/TGI/funday">index.cfm/TGI/funday</a></li> 
</ul>

<h1>RC Scope dump</h1>
<cfdump var="#rc#">
</cfoutput>