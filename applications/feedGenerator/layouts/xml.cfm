<!--- 
Our XML layout is generally kept as simple as possible.
 
Firstly we use the <cfcontent> tag and 'type' attribute to
force ColdFusion to use the RSS & XML application MIME type.
This tells the browser or web application requesting the feed
that this is an RSS XML document and it should be viewed by
an RSS compatible XML reader.
 
We then render the view and make sure that there is NO
whitespace at the start off the XML document. Otherwise it is
invalid and cannot be read by most XML or feed readers.
This is why the <cfoutput> tag and renderView() function are
kept to on the same single line with no whitespace between them.
--->
<cfsetting showDebugOutput="No">
<cfcontent reset="true" type="application/rss+xml"><cfoutput>#trim(renderView())#</cfoutput>