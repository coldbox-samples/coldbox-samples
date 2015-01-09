<cfoutput>
<h1>#Event.getValue("welcomeMessage")#</h1>
This route uses a placeholder for the <strong>entryTitle</strong> RC variable.  Trying changing the text "<strong>test_blog_entry</strong>" in the URL and you'll see this 
route is still matched, but the <strong>rc.entryTitle</strong> variable will have been updated accordingly.
<br>
<br>
<h1>RC Scope dump</h1>
<cfdump var="#rc#">
</cfoutput>