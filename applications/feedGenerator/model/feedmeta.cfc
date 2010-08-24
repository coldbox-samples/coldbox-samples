<cfcomponent name="feedmeta" hint="A feed metadata data object">

	<cfset variables.instance = structNew()/>

	<cffunction name="init" access="public" returntype="feedmeta" output="false">
		<cfreturn this>
	</cffunction>
	
	<!-------------------------------------------
		 Please do not edit or remove the comments 
		 containing 'start' or 'end' as they are	 
		 needed by the samples.
	 ------------------------------------------->
	
	<!--- createFeedBeginner start --->
	<cffunction name="beginner" access="public" returntype="struct" output="false">
		<cfset var returnStruct = structNew()/>
		<!---
		Populate the channel with 3 RSS tags, 'title','description' and 'link'.
		Title is the name of the feed. It's how people refer to your service.
		Description is a phrase describing the feed.
		Link is a URL to the HTML site corresponding to the feed.
		--->
		<cfset returnStruct["Title"] = "ColdBox Beginner Feed"/>
		<cfset returnStruct["Description"] = "This is an example feed showing the very basics of what constitutes a web feed"/>
		<cfset returnStruct["Link"] = "http://www.example.com"/>
		<cfreturn returnStruct/>
	</cffunction>
	<!--- createFeedBeginner end --->

	<!--- createFeedError start --->
	<cffunction name="error" access="public" returntype="struct" output="false">
		<cfset var returnStruct = structNew()/>
		<cfset returnStruct["Title"] = "ColdBox Beginner Feed"/>
		<cfset returnStruct["Description"] = "This is an example feed showing the very basics of what constitutes a web feed"/>
		<!--- 1. Hidden the required Link tag --->
		<!--- <cfset returnStruct["Link"] = "http://www.example.com"/> --->
		<cfreturn returnStruct/>
	</cffunction>
	<!--- createFeedError end --->

	<!--- createFeedPlayground start --->
	<cffunction name="playground" access="public" returntype="struct" output="false">
		<cfset var returnStruct = structNew()/>
		<cfset returnStruct["Title"] = "ColdBox Beginner Feed"/>
		<cfset returnStruct["description"] = "Current headlines from the Dallas Times-Herald newspaper"/>
		<cfset returnStruct["link"] = "http://dallas.example.com"/>
		<cfset returnStruct["title"] = "Dallas Times-Herald"/>
		<cfset returnStruct["category"] = ArrayNew(1)/>
		<cfset returnStruct.category[1]["tag"] = "Media"/>
		<cfset returnStruct.category[2]["tag"] = "News/Newspapers/Regional/United_States/Texas"/>
		<cfset returnStruct.category[2]["domain"] = "dmoz"/>
		<cfset returnStruct.cloud["domain"] = "server.example.com"/>
		<cfset returnStruct.cloud["path"] = "/rpc"/>
		<cfset returnStruct.cloud["port"] = "80"/>
		<cfset returnStruct.cloud["protocol"] = "xml-rpc"/>
		<cfset returnStruct.cloud["registerProcedure"] = "cloud.notify"/>
		<cfset returnStruct["copyright"] = "Copyright 2006 Dallas Times-Herald"/>
		<cfset returnStruct.image["link"] = "http://dallas.example.com"/>
		<cfset returnStruct.image["title"] = "Dallas Times-Herald"/>
		<cfset returnStruct.image["url"] = "http://dallas.example.com/masthead.gif"/>
		<cfset returnStruct.image["description"] = "Read the Dallas Times-Herald"/>
		<cfset returnStruct.image["height"] = "32"/>
		<cfset returnStruct.image["width"] = "96"/>
		<cfset returnStruct["language"] = "epo"/>
		<cfset returnStruct["lastBuildDate"] = "Sun, 29 Jan 2006 17:17:44 GMT"/>
		<cfset returnStruct["managingEditor"] = "jlehrer@dallas.example.com (Jim Lehrer)"/>
		<cfset returnStruct["pubDate"] = "Sun, 29 Jan 2006 05:00:00 GMT"/>
		<cfset returnStruct["rating"] = '(PICS-1.1 "http://www.rsac.org/ratingsv01.html" l by "webmaster@example.com" on "2006.01.29T10:09-0800" r (n 0 s 0 v 0 l 0))'/>
		<cfset returnStruct["skipdays"] = "Saturday,Sunday"/>
		<cfset returnStruct["skiphours"] = "0,1,2,22,23"/>
		<cfset returnStruct.textinput["description"] = "Your aggregator supports the textInput element. What software are you using?"/>
		<cfset returnStruct.textinput["link"] = "http://www.cadenhead.org/textinput.php"/>
		<cfset returnStruct.textinput["name"] = "query"/>
		<cfset returnStruct.textinput["title"] = "TextInput Inquiry"/>
		<cfset returnStruct["ttl"] = "60"/>
		<cfset returnStruct["webMaster"] = "helpdesk@dallas.example.com"/>
		<cfreturn returnStruct/>
	</cffunction>
	<!--- createFeedPlayground end --->

	<!--- createFeedSimpleArt start --->
	<cffunction name="simpleart" access="public" returntype="struct" output="false">
		<cfset var returnStruct = structNew()/>
		<cfset returnStruct["Title"] = "Art Gallery Customers, Query Example"/>
		<cfset returnStruct["Description"] = "This is an example feed showing the whose item data is being feed from the CFARTGALLERY datasource"/>
		<cfset returnStruct["Link"] = "http://www.example.com"/>
		<cfset returnStruct["pubDate"] = "19-Mar-2008 8:53pm"/>
		<cfset returnStruct["lastBuildDate"] = Now()/>
		<cfreturn returnStruct/>
	</cffunction>
	<!--- createFeedSimpleArt end --->

	<!--- createFeedCompleteArt start --->
	<cffunction name="complexart" access="public" returntype="struct" output="false">
		<cfset var returnStruct = structNew()/>
		<cfset returnStruct["Title"] = "Art Gallery Customers, Query Example"/>
		<cfset returnStruct["Description"] = "This is an example feed showing the whose item data is being feed from the CFARTGALLERY datasource"/>
		<cfset returnStruct["Link"] = "http://www.example.com"/>
		<cfset returnStruct["pubDate"] = "19-Mar-2008 8:53pm"/>
		<cfset returnStruct["lastBuildDate"] = Now()/>
		<cfreturn returnStruct/>
	</cffunction>
	<!--- createFeedCompleteArt end --->
 
	<!--- createFeediTunes start --->
	<cffunction name="itunes" access="public" returntype="struct" output="false">
		<cfset var returnStruct = structNew()/>
		<cfset returnStruct["title"] = "All About Everything"/>	
		<cfset returnStruct["description"] = "All About Everything is a show about everything. Each week we dive into any subject known to man and talk about it as much as we can. Look for our Podcast in the iTunes Music Store"/>
		<cfset returnStruct["link"] = "http://www.example.com/podcasts/everything"/>
		<cfset returnStruct["language"] = "en-us"/>
		<cfset returnStruct["copyright"] = "© 2005 John Doe & Family"/>
		<cfset returnStruct["lastBuildDate"] = Now()/>
		<!--- Additional iTunes channel information --->
		<cfset returnStruct.itunes = structNew()/>
		<cfset returnStruct.itunes["block"] = "no"/>
		<cfset returnStruct.itunes["category"] = StructNew()/>
		<cfset returnStruct.itunes.category["Technology"] = "Gadgets"/>
		<cfset returnStruct.itunes.category["TV & Film"] = ""/>
		<cfset returnStruct.itunes["explicit"] = "clean"/>
		<cfset returnStruct.itunes["image"] = "http://example.com/podcasts/everything/AllAboutEverything.jpg"/>
		<cfset returnStruct.itunes["keywords"] = "fill,me,up"/>
		<cfset returnStruct.itunes["new_feed_url"] = "http://example.com/podcasts/everything"/>
		<cfset returnStruct.itunes["owner"] = structNew()/>
		<cfset returnStruct.itunes.owner["name"] = "John Doe"/>
		<cfset returnStruct.itunes.owner["email"] = "john.doe@example.com"/>
		<cfset returnStruct.itunes["subtitle"] = "A show about everything"/>
		<cfset returnStruct.itunes["summary"] = "All About Everything is a show about everything. Each week we dive into any subject known to man and talk about it as much as we can. Look for our Podcast in the iTunes Music Store"/>
		<cfreturn returnStruct/>
	</cffunction>
	<!--- createFeediTunes end --->
	
	<!--- createFeedOpenSearch start --->
	<cffunction name="opensearch" access="public" returntype="struct" output="false">
		<cfset var returnStruct = structNew()/>
		<cfset returnStruct["title"] = "Example.com Search: New York history"/>
		<cfset returnStruct["link"] = "http://example.com/New+York+history"/>
		<cfset returnStruct["pubDate"] = "2003-12-13 18:30:02"/>
		<cfset returnStruct["description"] = 'Search results for "New York history" at Example.com'/>
		<!--- Self-link Atom extension (also used by OpenSearch) --->
		<cfset returnStruct["atomselfLink"] = "http://example.com/New+York+History?pw=3&format=rss"/>
		<!--- OpenSearch information --->
		<cfset returnStruct["opensearch"] = structNew()/>
		<cfset returnStruct["opensearch"].totalresults = "4230000"/>
		<cfset returnStruct["opensearch"].startindex = "1"/>
		<cfset returnStruct["opensearch"].itemsperpage = "10"/>
		<cfset returnStruct["opensearch"].autodiscovery = "http://example.com/opensearchdescription.xml"/>
		<!--- OpenSearch Query --->
		<cfset returnStruct["opensearchQuery"] = arrayNew(1)/>
		<cfset returnStruct["opensearchQuery"][1] = structNew()/>
		<cfset returnStruct["opensearchQuery"][1]["role"] = "request"/>
		<cfset returnStruct["opensearchQuery"][1]["searchterms"] = "New York History"/>
		<cfset returnStruct["opensearchQuery"][1]["startpage"] = "1"/>
		<cfreturn returnStruct/>
	</cffunction>
	<!--- createFeedOpenSearch end --->
	
	<!--- createFeedDublinCore start --->
	<cffunction name="dublincore" access="public" returntype="struct" output="false">
		<cfset var returnStruct = structNew()/>
		<cfset returnStruct["title"] = 'DCMI Metadata Terms'/>
		<cfset returnStruct["description"] = "Example of a few of the DCMI Metadata Terms being used in an RSS feed"/>
		<cfset returnStruct["language"] = "en"/>
		<cfset returnStruct["link"] = "http://example.org/dcmi"/>
	<!--- Dublin Core terms --->
		<cfset returnStruct["dcmiterm"] = structNew()/>
		<cfset returnStruct.dcmiterm["subject"] = "contributor,coverage,creator,date,description,format,identifier,language,publisher,relation,rights,source,subject,title,type"/>
		<cfset returnStruct.dcmiterm["creator"] = "Ben Garrett"/>
		<cfset returnStruct.dcmiterm["contributor"] = "Dublin Core Metadata Initiative"/>
		<cfset returnStruct.dcmiterm["publisher"] = "ColdBox Framework"/>
		<cfreturn returnStruct/>
	</cffunction>
	<!--- createFeedDublinCore end --->
	
	<!--- createFeedSlash start --->
	<cffunction name="slash" access="public" returntype="struct" output="false">
		<cfset var returnStruct = structNew()/>
		<cfset returnStruct["title"] = 'DCMI Metadata Terms'/>
		<cfset returnStruct["title"] = 'Slashnot'/>
		<cfset returnStruct["link"] = "http://example.org/slashnot"/>
		<cfset returnStruct["description"] = "This is a mock IT news website using Slash and DublinCore extensions"/>
		<!--- Additional DCMI metadata terms --->
		<cfset returnStruct["dcmiterm"] = structNew()/>
		<cfset returnStruct.dcmiterm["language"] = "en-us"/>
		<cfset returnStruct.dcmiterm["rights"] = "Copyright 1997-2008, SauceFour, Inc.	No Rights Reserved."/>
		<cfset returnStruct.dcmiterm["publisher"] = "SauceFour, Inc."/>
		<cfset returnStruct.dcmiterm["creator"] = "Annonymous"/>
		<cfset returnStruct.dcmiterm["subject"] = "technology"/>
		<cfreturn returnStruct/>
	</cffunction>
	<!--- createFeedSlash end --->
	
	<!--- createFeedComboEx start --->
	<cffunction name="comboex" access="public" returntype="struct" output="false">
		<cfset var returnStruct = structNew()/>
		<cfset returnStruct["title"] = 'DCMI Metadata Terms'/>
		<cfset returnStruct["title"] = 'OpSound Random Blues Tracks'/>
		<cfset returnStruct["link"] = "http://www.opsound.org/genre/blues/"/>
		<cfset returnStruct["description"] = "This combinations example shows the Creative Commons, Dublin Core and the Apple iTunes extensions all being used together in a single feed."/>
		<cfset returnStruct["dcmiterm"] = structNew()/>
		<cfset returnStruct.dcmiterm["publisher"] = "opsound"/>
		<cfset returnStruct.dcmiterm["subject"] = "blues"/>
		<cfreturn returnStruct/>
	</cffunction>
	<!--- createFeedComboEx end --->
	
	<!--- createFeedInternational start --->
	<cffunction name="international" access="public" returntype="struct" output="false">
		<cfset var returnStruct = structNew()/>
		<cfset returnStruct["Title"] = "Example International Unicode Feed"/>
		<cfset returnStruct["Description"] = "This is an example feed showing the very basics of what constitutes a web feed"/>
		<cfset returnStruct["Link"] = "http://www.example.com"/>
		<cfset returnStruct["lastBuildDate"] = now()/>
		<cfreturn returnStruct/>
	</cffunction>
	<!--- createFeedInternational end --->
	
	<!--- createFeedBandwidth start --->
	<cffunction name="bandwidth" access="public" returntype="struct" output="false">
		<cfset var returnStruct = structNew()/>
		<cfset returnStruct["Title"] = "ColdBox Beginner Feed"/>
		<cfset returnStruct["Description"] = "This is an example feed showing the very basics of what constitutes a web feed"/>
		<cfset returnStruct["Link"] = "http://www.example.com"/>
		<cfreturn returnStruct/>
	</cffunction>
	<!--- createFeedBandwidth end --->
	
</cfcomponent>