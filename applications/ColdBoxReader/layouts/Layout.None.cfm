<cfsetting showdebugoutput="false">
<cfset event.showdebugpanel("false")>
<cfset WriteOutput(getPlugin("MessageBox").renderit())>
<cfset WriteOutput(renderView())>