<!-----------------------------------------------------------------------
Author 	 :	Ben Garrett
Date     :	December 17, 2008
Description :
This is a ColdBox event handler for our RSS examples.

----------------------------------------------------------------------->
<cfcomponent name="examples" extends="coldbox.system.EventHandler" output="false" autowire="true">

	<!--- Dependencies --->
	<cfproperty name="feeditems" inject="model" scope="instance">
	<cfproperty name="feedmeta" inject="model" scope="instance">
	<cfproperty name="fileUtils" inject="FileUtils@cbcommons">
	<cfproperty name="feedGenerator" inject="feedGenerator@cbfeeds">
	<cfproperty name="applicationstorage" inject="applicationstorage@cbstorages">


	<!--- This init is mandatory, including the super.init(). --->
	<cffunction name="init" access="public" returntype="examples" output="false">
		<cfargument name="controller" type="any"/>
		<cfset super.init(arguments.controller)/>
		<!--- Any constructor code here --->
		<cfreturn this>
	</cffunction>

	<cffunction name="index" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = Event.getCollection()/>
		<!--- Set the View To Display, after Logic --->
		<cfset Event.setView("vwIndex")/>
	</cffunction>

<!------------------------------------------------ EXAMPLE FEEDS ------------------------------------------------>

	<!-------------------------------------------
	   Please do not edit or remove the comments
	   containing 'start' or 'end' as they are
	   needed by the samples.
	 ------------------------------------------->

  <!--- createFeedBeginner start --->
	<cffunction name="createFeedBeginner" access="public" returntype="void" output="false" hint="">
		<cfargument name="Event" type="any"/>
		<!--- Create a ColdBox Request Collection --->
		<cfset var rc = Event.getCollection()/>
		<!--- Path and name to save file --->
		<cfset rc.pathtofile = "#getSetting("ApplicationPath")#includes/xml/RSS_Sample_Beginner.xml"/>
		<!--- Obtain feed metadata --->
		<cfset rc.feed = instance.feedmeta.beginner()/>
		<!--- Obtain feed items --->
		<cfset rc.feed.items = instance.feeditems.beginner()/>
		<!--- The feed data is now ready to compile. Using the ColdBox feedGenerator plug-in we convert this data into a XML file.
		The file will be located in the ColdBox\samples\applications\feedGenerator\includes\xml\ directory.
		If successful the variable rc.compileFeed will have the Boolean value true.
		The createFeed method supports a number of arguments, though we are only going to use a couple.
		FeedStruct is the name of the structure containing your feed data.
		outputFile is the name and path of the XML file the plug-in will create, any existing file will automatically be overwritten.
		 --->
		<cfset rc.compileFeed = feedGenerator.createFeed(FeedStruct=rc.feed,OutputFile=rc.pathtofile)/>
		<!--- Display the feed using the vwPostGenerate view located at /views/vwPostGenerate.cfm --->
		<cfset Event.setView("vwPostGenerate")/>
	</cffunction>
  <!--- createFeedBeginner end --->

  <!--- createFeedError start --->
	<cffunction name="createFeedError" access="public" returntype="void" output="false" hint="">
		<cfargument name="Event" type="any"/>
		<cfset var rc = Event.getCollection()/>
		<cfset rc.pathtofile = "#getSetting("ApplicationPath")#includes/xml/RSS_Sample_FeedError.xml"/>
		<cfset rc.feed = instance.feedmeta.error()/>
		<cfset rc.feed.items = instance.feeditems.error()/>
		<cfset rc.compileFeed = feedGenerator.createFeed(FeedStruct=rc.feed,OutputFile=rc.pathtofile)/>
		<!--- Display the feed --->
		<cfset Event.setView("vwPostGenerate")/>
	</cffunction>
  <!--- createFeedError end --->

  <!--- createFeedPlayground start --->
	<cffunction name="createFeedPlayground" access="public" returntype="void" output="false" hint="">
		<cfargument name="Event" type="any"/>
		<cfset var rc = Event.getCollection()/>
		<cfset rc.pathtofile = "#getSetting("ApplicationPath")#includes/xml/RSS_Sample_Playground.xml"/>
		<cfset rc.feed = instance.feedmeta.playground()/>
		<cfset rc.feed.items = instance.feeditems.playground()/>
		<cfset rc.compileFeed = feedGenerator.createFeed(FeedStruct=rc.feed,OutputFile=rc.pathtofile)/>
		<!--- Display the feed --->
		<cfset Event.setView("vwPostGenerate")/>
	</cffunction>
  <!--- createFeedPlayground end --->

  <!--- createFeedSimpleArt start --->
	<cffunction name="createFeedSimpleArt" access="public" returntype="void" output="false" hint="">
		<cfargument name="Event" type="any"/>
		<cfset var rc = Event.getCollection()/>
		<cfset rc.pathtofile = "#getSetting("ApplicationPath")#includes/xml/RSS_Sample_SimpleArt.xml"/>
			<!--- Get meta and item data --->
		<cfset rc.feed = instance.feedmeta.simpleart()/>
		<cfset rc.feed.items = instance.feeditems.simpleart()/>
			<!--- Map item data to feed elements --->
		<cfset rc.map = structNew()/>
			<!--- columns containing the customer's last name, home state and address; the order id and order date --->
		<cfset rc.map.title = "customerlastname"/>
		<cfset rc.map.category_tag = "state"/>
		<cfset rc.map.description = "address"/>
		<cfset rc.map.guid_string = "orderid"/>
		<cfset rc.map.pubDate = "orderdate"/>
		<!--- Check query record count to make sure the database retrieval was okay --->
		<cfif rc.feed.items.RecordCount gte 1>
			<cfset rc.compileFeed = feedGenerator.createFeed(FeedStruct=rc.feed,ColumnMap=rc.map,OutputFile=rc.pathtofile)/>
		<cfelse>
			<cfset rc.compileFeed = false/>
		</cfif>
		<!--- Display the feed --->
	<cfset Event.setView("vwPostGenerate")/>
	</cffunction>
  <!--- createFeedSimpleArt end --->

  <!--- createFeedCompleteArt start --->
	<cffunction name="createFeedCompleteArt" access="public" returntype="void" output="false" hint="">
		<cfargument name="Event" type="any"/>
		<cfset var rc = Event.getCollection()/>
		<cfset rc.pathtofile = "#getSetting("ApplicationPath")#includes/xml/RSS_Sample_CompleteArt.xml"/>
			<!--- Get meta and item data --->
		<cfset rc.feed = instance.feedmeta.complexart()/>
		<cfset rc.feed.items = instance.feeditems.complexart()/>
			<!--- Map item data to feed elements --->
		<cfset rc.map = structNew()/>
		<cfset rc.map.pubDate = "orderdate"/>
		<!--- Check query record count to make sure the database retrieval was okay --->
		<cfif rc.feed.items.RecordCount gte 1>
			<cfset rc.compileFeed = feedGenerator.createFeed(FeedStruct=rc.feed,ColumnMap=rc.map,OutputFile=rc.pathtofile)/>
		<cfelse>
			<cfset rc.compileFeed = false/>
		</cfif>
		<!--- Display the feed --->
		<cfset Event.setView("vwPostGenerate")/>
	</cffunction>
  <!--- createFeedCompleteArt end --->

  <!--- createFeediTunes start --->
	<cffunction name="createFeediTunes" access="public" returntype="void" output="false" hint="">
		<cfargument name="Event" type="any"/>
		<cfset var rc = Event.getCollection()/>
		<cfset rc.pathtofile = "#getSetting("ApplicationPath")#includes/xml/RSS_Sample_iTunes.xml"/>
		<cfset rc.feed = instance.feedmeta.itunes()/>
		<cfset rc.feed.items = instance.feeditems.itunes()/>
		<cfset rc.compileFeed = feedGenerator.createFeed(FeedStruct=rc.feed,OutputFile=rc.pathtofile)/>
		<!--- Display the feed --->
		<cfset Event.setView("vwPostGenerate")/>
	</cffunction>
  <!--- createFeediTunes end --->

  <!--- createFeedOpenSearch start --->
	<cffunction name="createFeedOpenSearch" access="public" returntype="void" output="false" hint="">
		<cfargument name="Event" type="any"/>
		<cfset var rc = Event.getCollection()/>
		<cfset rc.pathtofile = "#getSetting("ApplicationPath")#includes/xml/RSS_Sample_OpenSearch.xml"/>
		<cfset rc.feed = instance.feedmeta.opensearch()/>
		<cfset rc.feed.items = instance.feeditems.opensearch()/>
		<cfset rc.compileFeed = feedGenerator.createFeed(FeedStruct=rc.feed,OutputFile=rc.pathtofile)/>
		<!--- Display the feed --->
		<cfset Event.setView("vwPostGenerate")/>
	</cffunction>
  <!--- createFeedOpenSearch end --->

  <!--- createFeedDublinCore start --->
	<cffunction name="createFeedDublinCore" access="public" returntype="void" output="false" hint="">
		<cfargument name="Event" type="any"/>
		<cfset var rc = Event.getCollection()/>
		<cfset rc.pathtofile = "#getSetting("ApplicationPath")#includes/xml/RSS_Sample_DublinCore.xml"/>
		<cfset rc.feed = instance.feedmeta.dublincore()/>
		<cfset rc.feed.items = instance.feeditems.dublincore()/>
		<cfset rc.compileFeed = feedGenerator.createFeed(FeedStruct=rc.feed,OutputFile=rc.pathtofile)/>
		<!--- Display the feed --->
		<cfset Event.setView("vwPostGenerate")/>
	</cffunction>
  <!--- createFeedDublinCore end --->

  <!--- createFeedSlash start --->
	<cffunction name="createFeedSlash" access="public" returntype="void" output="false" hint="">
		<cfargument name="Event" type="any"/>
		<cfset var rc = Event.getCollection()/>
		<cfset rc.pathtofile = "#getSetting("ApplicationPath")#includes/xml/RSS_Sample_Slash.xml"/>
		<cfset rc.feed = instance.feedmeta.slash()/>
		<cfset rc.feed.items = instance.feeditems.slash()/>
		<cfset rc.compileFeed = feedGenerator.createFeed(FeedStruct=rc.feed,OutputFile=rc.pathtofile)/>
		<!--- Display the feed --->
		<cfset Event.setView("vwPostGenerate")/>
	</cffunction>
  <!--- createFeedSlash end --->

  <!--- createFeedComboEx start --->
	<cffunction name="createFeedComboEx" access="public" returntype="void" output="false" hint="">
		<cfargument name="Event" type="any"/>
		<cfset var rc = Event.getCollection()/>
		<cfset rc.pathtofile = "#getSetting("ApplicationPath")#includes/xml/RSS_Sample_ComboEx.xml"/>
		<cfset rc.feed = instance.feedmeta.comboex()/>
		<cfset rc.feed.items = instance.feeditems.comboex()/>
		<cfset rc.compileFeed = feedGenerator.createFeed(FeedStruct=rc.feed,OutputFile=rc.pathtofile)/>
		<!--- Display the feed --->
		<cfset Event.setView("vwPostGenerate")/>
	</cffunction>
  <!--- createFeedComboEx end --->

  <!--- createFeedInternational start --->
	<cffunction name="createFeedInternational" access="public" returntype="void" output="false" hint="">
		<cfargument name="Event" type="any"/>
		<cfset var rc = Event.getCollection()/>
		<cfset rc.pathtofile = "#getSetting("ApplicationPath")#includes/xml/RSS_Sample_International.xml"/>
		<cfset rc.feed = instance.feedmeta.international()/>
		<cfset rc.feed.items = instance.feeditems.international()/>
		<cfset rc.compileFeed = feedGenerator.createFeed(FeedStruct=rc.feed,OutputFile=rc.pathtofile)/>
		<!--- Display the feed --->
		<cfset Event.setView("vwPostGenerate")/>
	</cffunction>
  <!--- createFeedInternational end --->

  <!--- createFeedBandwidth start --->
	<cffunction name="createFeedBandwidth" access="public" returntype="void" output="false" hint="">
		<cfargument name="Event" type="any"/>
		<cfset var rc = Event.getCollection()/>
		<cfset var temp = ""/>
		<cfset rc.pathtofile = "#getSetting("ApplicationPath")#includes/xml/RSS_Sample_Bandwidth.xml"/>
		<cfset rc.feedTimeStamp = now()/>
		<cfset rc.feed = instance.feedmeta.bandwidth()/>
		<cfset rc.feed.items = instance.feeditems.bandwidth()/>
		<!--- Create application variables containing this current date/time value. Create a variable containing a ETag value which can really be any value as long as it is unique to this feed --->
		<cfif ListFindNoCase(StructKeyList(GetFunctionList()), 'GetHttpRequestData')>
			<cfset temp = applicationstorage.setVar('feedTimeStamp',GetHttpTimeString(ParseDateTime(rc.feedTimeStamp)))/>
			<cfset temp = applicationstorage.setVar('feedETag','"coldbox/example"')/>
		</cfif>
		<cfset rc.feed["lastBuildDate"] = rc.feedTimeStamp/>
		<cfset rc.compileFeed = feedGenerator.createFeed(FeedStruct=rc.feed,OutputFile=rc.pathtofile)/>
		<!--- Display the feed --->
		<cfset Event.setView("vwPostGenerate")/>
	</cffunction>
  <!--- createFeedBandwidth end --->

  <!--------------------------------------------- DUMP EVENTS --------------------------------------------->

	<cffunction name="dumpFeedBeginner" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = Event.getCollection()/>
		<cfset rc.COMname = "Beginner"/>
		<cfset rc.DumpCOM = dumpCode(rc.COMname)/>
		<cfset Event.setView("vwDumpCOM")/>
	</cffunction>

	<cffunction name="dumpDisplayFeedBeginner" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = Event.getCollection()/>
		<cfset rc.COMname = "DisplayBeginner"/>
		<cfset rc.DumpCOM = dumpCode(rc.COMname)/>
		<cfset Event.setView("vwDumpCOM")/>
	</cffunction>

	<cffunction name="dumpFeedError" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = Event.getCollection()/>
		<cfset rc.COMname = "Error"/>
		<cfset rc.DumpCOM = dumpCode(rc.COMname)/>
		<cfset Event.setView("vwDumpCOM")/>
	</cffunction>

	<cffunction name="dumpFeedPlayground" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = Event.getCollection()/>
		<cfset rc.COMname = "Playground"/>
		<cfset rc.DumpCOM = dumpCode(rc.COMname)/>
		<cfset Event.setView("vwDumpCOM")/>
	</cffunction>

	<cffunction name="dumpFeedSimpleArt" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = Event.getCollection()/>
		<cfset rc.COMname = "SimpleArt"/>
		<cfset rc.DumpCOM = dumpCode(rc.COMname)/>
		<cfset Event.setView("vwDumpCOM")/>
	</cffunction>

	<cffunction name="dumpFeedCompleteArt" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = Event.getCollection()/>
		<cfset rc.COMname = "CompleteArt"/>
		<cfset rc.DumpCOM = dumpCode(rc.COMname)/>
		<cfset Event.setView("vwDumpCOM")/>
	</cffunction>

	<cffunction name="dumpFeediTunes" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = Event.getCollection()/>
		<cfset rc.COMname = "iTunes"/>
		<cfset rc.DumpCOM = dumpCode(rc.COMname)/>
		<cfset Event.setView("vwDumpCOM")/>
	</cffunction>

	<cffunction name="dumpFeedOpenSearch" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = Event.getCollection()/>
		<cfset rc.COMname = "OpenSearch"/>
		<cfset rc.DumpCOM = dumpCode(rc.COMname)/>
		<cfset Event.setView("vwDumpCOM")/>
	</cffunction>

	<cffunction name="dumpFeedDublinCore" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = Event.getCollection()/>
		<cfset rc.COMname = "DublinCore"/>
		<cfset rc.DumpCOM = dumpCode(rc.COMname)/>
		<cfset Event.setView("vwDumpCOM")/>
	</cffunction>

	<cffunction name="dumpFeedSlash" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = Event.getCollection()/>
		<cfset rc.COMname = "Slash"/>
		<cfset rc.DumpCOM = dumpCode(rc.COMname)/>
		<cfset Event.setView("vwDumpCOM")/>
	</cffunction>

	<cffunction name="dumpFeedComboEx" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = Event.getCollection()/>
		<cfset rc.COMname = "ComboEx"/>
		<cfset rc.DumpCOM = dumpCode(rc.COMname)/>
		<cfset Event.setView("vwDumpCOM")/>
	</cffunction>

	<cffunction name="dumpFeedInternational" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = Event.getCollection()/>
		<cfset rc.COMname = "International"/>
		<cfset rc.DumpCOM = dumpCode(rc.COMname)/>
		<cfset Event.setView("vwDumpCOM")/>
	</cffunction>

	<cffunction name="dumpFeedBandwidth" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = Event.getCollection()/>
		<cfset rc.COMname = "Bandwidth"/>
		<cfset rc.DumpCOM = dumpCode(rc.COMname)/>
		<cfset Event.setView("vwDumpCOM")/>
	</cffunction>

  <!--------------------------------------------- DUMP LAYOUTS & VIEWS -------------------------------------------->

	<cffunction name="dumpLayoutAutoDiscovery" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = Event.getCollection()/>
		<cfset rc.LOName = "AutoDiscovery"/>
		<cfset rc.DumpLO = dumpLayout('layouts\Main')/>
		<cfset Event.setView("vwDumpLO")/>
	</cffunction>

	<cffunction name="dumpLayoutBandwidth" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = Event.getCollection()/>
		<cfset rc.LOName = "Bandwidth"/>
		<cfset rc.DumpLO = dumpLayout('layouts\xml.etag')/>
		<cfset Event.setView("vwDumpLO")/>
	</cffunction>

	<cffunction name="dumpLayoutXML" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = Event.getCollection()/>
		<cfset rc.LOName = "XML"/>
		<cfset rc.DumpLO = dumpLayout('layouts\xml')/>
		<cfset Event.setView("vwDumpLO")/>
	</cffunction>

	<cffunction name="dumpvwPostGenerate" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = Event.getCollection()/>
		<cfset rc.LOName = "vwPostGenerate"/>
		<cfset rc.DumpLO = dumpLayout('views\vwPostGenerate')/>
		<cfset Event.setView("vwDumpLO")/>
	</cffunction>

  <!-------------------------------------------------- DUMP FEEDS ------------------------------------------------->

	<cffunction name="sourceFeedBeginner" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = Event.getCollection()/>
		<cfset rc.COMname = "Beginner"/>
		<cfset rc.DumpXML = dumpXML(rc.COMname)/>
		<cfset Event.setView("vwDumpFeed")/>
	</cffunction>

	<cffunction name="sourceFeedPlayground" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = Event.getCollection()/>
		<cfset rc.COMname = "Playground"/>
		<cfset rc.DumpXML = dumpXML(rc.COMname)/>
		<cfset Event.setView("vwDumpFeed")/>
	</cffunction>

	<cffunction name="sourceFeedSimpleArt" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = Event.getCollection()/>
		<cfset rc.COMname = "SimpleArt"/>
		<cfset rc.DumpXML = dumpXML(rc.COMname)/>
		<cfset Event.setView("vwDumpFeed")/>
	</cffunction>

	<cffunction name="sourceFeedCompleteArt" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = Event.getCollection()/>
		<cfset rc.COMname = "CompleteArt"/>
		<cfset rc.DumpXML = dumpXML(rc.COMname)/>
		<cfset Event.setView("vwDumpFeed")/>
	</cffunction>

	<cffunction name="sourceFeediTunes" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = Event.getCollection()/>
		<cfset rc.COMname = "iTunes"/>
		<cfset rc.DumpXML = dumpXML(rc.COMname)/>
		<cfset Event.setView("vwDumpFeed")/>
	</cffunction>

	<cffunction name="sourceFeedOpenSearch" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = Event.getCollection()/>
		<cfset rc.COMname = "OpenSearch"/>
		<cfset rc.DumpXML = dumpXML(rc.COMname)/>
		<cfset Event.setView("vwDumpFeed")/>
	</cffunction>

	<cffunction name="sourceFeedDublinCore" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = Event.getCollection()/>
		<cfset rc.COMname = "DublinCore"/>
		<cfset rc.DumpXML = dumpXML(rc.COMname)/>
		<cfset Event.setView("vwDumpFeed")/>
	</cffunction>

	<cffunction name="sourceFeedSlash" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = Event.getCollection()/>
		<cfset rc.COMname = "Slash"/>
		<cfset rc.DumpXML = dumpXML(rc.COMname)/>
		<cfset Event.setView("vwDumpFeed")/>
	</cffunction>

	<cffunction name="sourceFeedComboEx" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = Event.getCollection()/>
		<cfset rc.COMname = "ComboEx"/>
		<cfset rc.DumpXML = dumpXML(rc.COMname)/>
		<cfset Event.setView("vwDumpFeed")/>
	</cffunction>

	<cffunction name="sourceFeedInternational" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = Event.getCollection()/>
		<cfset rc.COMname = "International"/>
		<cfset rc.DumpXML = dumpXML(rc.COMname)/>
		<cfset Event.setView("vwDumpFeed")/>
	</cffunction>

  <!------------------------------------------------ DISPLAY FEEDS ------------------------------------------------>

  <!--- createFeedDisplayBeginner start --->
	<cffunction name="displayFeedBeginner" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = Event.getCollection()/>
		<!--- Read the RSS XML document and save it to the Request Collection variable DumpXML --->
		<cfset rc.DumpXML = fileUtils.readFile('#getSetting("ApplicationPath")#includes\xml\RSS_Sample_Beginner.xml')/>
		<!--- Render the View vwDisplayFeed --->
		<cfif not len(rc.DumpXML)>
			<cfset runEvent(event='examples.viewMissingFeed',private=true)/>
		<cfelse>
			<cfset runEvent(event='examples.viewDisplayFeed',private=true)/>
		</cfif>
	</cffunction>
  <!--- createFeedDisplayBeginner end --->

	<cffunction name="displayFeedPlayground" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = Event.getCollection()/>
		<cfset rc.COMname = "Playground"/>
		<cfset rc.DumpXML = readXMLfile(rc.COMname)/>
		<cfif not len(rc.DumpXML)>
			<cfset runEvent(event='examples.viewMissingFeed',private=true)/>
		<cfelse>
			<cfset runEvent(event='examples.viewDisplayFeed',private=true)/>
		</cfif>
	</cffunction>

	<cffunction name="displayFeedSimpleArt" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = Event.getCollection()/>
		<cfset rc.COMname = "SimpleArt"/>
		<cfset rc.DumpXML = readXMLfile(rc.COMname)/>
		<cfif not len(rc.DumpXML)>
			<cfset runEvent(event='examples.viewMissingFeed',private=true)/>
		<cfelse>
			<cfset runEvent(event='examples.viewDisplayFeed',private=true)/>
		</cfif>
	</cffunction>

	<cffunction name="displayFeedCompleteArt" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = Event.getCollection()/>
		<cfset rc.COMname = "CompleteArt"/>
		<cfset rc.DumpXML = readXMLfile(rc.COMname)/>
		<cfif not len(rc.DumpXML)>
			<cfset runEvent(event='examples.viewMissingFeed',private=true)/>
		<cfelse>
			<cfset runEvent(event='examples.viewDisplayFeed',private=true)/>
		</cfif>
	</cffunction>

	<cffunction name="displayFeediTunes" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = Event.getCollection()/>
		<cfset rc.COMname = "iTunes"/>
		<cfset rc.DumpXML = readXMLfile(rc.COMname)/>
		<cfif not len(rc.DumpXML)>
			<cfset runEvent(event='examples.viewMissingFeed',private=true)/>
		<cfelse>
			<cfset runEvent(event='examples.viewDisplayFeed',private=true)/>
		</cfif>
	</cffunction>

	<cffunction name="displayFeedOpenSearch" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = Event.getCollection()/>
		<cfset rc.COMname = "OpenSearch"/>
		<cfset rc.DumpXML = readXMLfile(rc.COMname)/>
		<cfif not len(rc.DumpXML)>
			<cfset runEvent(event='examples.viewMissingFeed',private=true)/>
		<cfelse>
			<cfset runEvent(event='examples.viewDisplayFeed',private=true)/>
		</cfif>
	</cffunction>

	<cffunction name="displayFeedDublinCore" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = Event.getCollection()/>
		<cfset rc.COMname = "DublinCore"/>
		<cfset rc.DumpXML = readXMLfile(rc.COMname)/>
		<cfif not len(rc.DumpXML)>
			<cfset runEvent(event='examples.viewMissingFeed',private=true)/>
		<cfelse>
			<cfset runEvent(event='examples.viewDisplayFeed',private=true)/>
		</cfif>
	</cffunction>

	<cffunction name="displayFeedSlash" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = Event.getCollection()/>
		<cfset rc.COMname = "Slash"/>
		<cfset rc.DumpXML = readXMLfile(rc.COMname)/>
		<cfif not len(rc.DumpXML)>
			<cfset runEvent(event='examples.viewMissingFeed',private=true)/>
		<cfelse>
			<cfset runEvent(event='examples.viewDisplayFeed',private=true)/>
		</cfif>
	</cffunction>

	<cffunction name="displayFeedComboEx" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = Event.getCollection()/>
		<cfset rc.COMname = "ComboEx"/>
		<cfset rc.DumpXML = readXMLfile(rc.COMname)/>
		<cfif not len(rc.DumpXML)>
			<cfset runEvent(event='examples.viewMissingFeed',private=true)/>
		<cfelse>
			<cfset runEvent(event='examples.viewDisplayFeed',private=true)/>
		</cfif>
	</cffunction>

	<cffunction name="displayFeedInternational" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = Event.getCollection()/>
		<cfset rc.COMname = "International"/>
		<cfset rc.DumpXML = readXMLfile(rc.COMname)/>
		<cfif not len(rc.DumpXML)>
			<cfset runEvent(event='examples.viewMissingFeed',private=true)/>
		<cfelse>
			<cfset runEvent(event='examples.viewDisplayFeed',private=true)/>
		</cfif>
	</cffunction>

	<cffunction name="displayFeedBandwidth" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = Event.getCollection()/>
		<cfset rc.COMname = "Bandwidth"/>
		<cfset rc.DumpXML = readXMLfile(rc.COMname)/>
		<cfif not len(rc.DumpXML)>
			<cfset runEvent(event='examples.viewMissingFeed',private=true)/>
		<cfelse>
			<cfset runEvent(event='examples.viewDisplayFeed',private=true)/>
		</cfif>
	</cffunction>

	<!------------------------------------------- PRIVATE REUSABLE EVENTS ------------------------------------------->

	<cffunction name="dumpCode" access="private" returntype="string" output="false">
  	<cfscript>
			var rc = controller.getRequestService().getContext().getCollection();
			var returnCode = "";
			var handler = fileUtils.readFile('#getSetting("ApplicationPath")#handlers\examples.cfc');
			var modelitem = fileUtils.readFile('#getSetting("ApplicationPath")#models\feeditems.cfc');
			var modelmeta = fileUtils.readFile('#getSetting("ApplicationPath")#models\feedmeta.cfc');
			handler = processCode(handler);
			handler = ReplaceNoCase(handler, '&lt;!--- createFeed#rc.COMname# start --->', '&lt;!--- createFeed#rc.COMname# Event --->', 'all');
			modelitem = processCode(modelitem);
			modelitem = ReplaceNoCase(modelitem, '&lt;!--- createFeed#rc.COMname# start --->', '&lt;!--- #LCase(rc.COMname)# feeditems Model --->', 'all');
			modelmeta = processCode(modelmeta);
			modelmeta = ReplaceNoCase(modelmeta, '&lt;!--- createFeed#rc.COMname# start --->', '&lt;!--- #LCase(rc.COMname)# feedmeta Model --->', 'all');
			returnCode = handler & chr(13) & modelmeta & chr(13) & modelitem;
			return returnCode;
		</cfscript>
  </cffunction>

	<cffunction name="processCode" access="private" returntype="string" output="false">
		<cfargument name="code" type="string" required="true"/>
		<cfscript>
			var rc = controller.getRequestService().getContext().getCollection();
			var readF = arguments.code;
			var sStart = 0;
			var sEnd = 0;
			readF = replace(readF,chr(9)," ","all"); // remove whitespace TABs from text
			sStart = find('<!--- createFeed#rc.COMname# start --->',readF); // search for start of the feed method
			sEnd = find('<!--- createFeed#rc.COMname# end --->',readF); // search for end of the feed method
			if(sStart is 0) return ''; // make sure the search returned a result otherwise return a blank string
			readF = mid(readF,sStart,(sEnd-sStart)); // extract the feed method from the handler
			//readF = ReplaceNoCase(readF, '<!--- createFeed#rc.COMname# start --->', '', 'all');
			// replace characters to make CFML code visable in HTML
			readF = replaceNoCase(readF,'<','&lt;','all');
			readF = reReplaceNoCase(readF,'(/\*(.|[\r\n])*?\*/)','<span class="scrcomments">\1</span>','all');
			readF = reReplaceNoCase(readF,'(\&lt;!--(.|[\r\n])*?--\>)','<span class="cfcomments">\1</span>','all');
			readF = reReplaceNoCase(readF,'(\&lt;)(/?)(cf(.)*?)(>)','<span class="bracket">\1\2</span><span class="cftag">\3</span><span class="bracket">\5</span>','all');
			return readF;
		</cfscript>
	</cffunction>

	<cffunction name="dumpLayout" access="private" returntype="string" output="false">
		<cfargument name="layout" type="string" required="true"/>
		<cfscript>
			var rc = controller.getRequestService().getContext().getCollection();
			var readF = "";
			// read the file containing the feed handlers and copy the content to a variable as text
			readF = fileUtils.readFile('#getSetting("ApplicationPath")##arguments.layout#.cfm');
			readF = replace(readF,chr(9)," ","all"); // remove whitespace TABs from text
			// replace characters to make CFML code visable in HTML
			readF = replaceNoCase(readF,'<','&lt;','all');
			readF = reReplaceNoCase(readF,'(/\*(.|[\r\n])*?\*/)','<span class="scrcomments">\1</span>','all');
			readF = reReplaceNoCase(readF,'(\&lt;!--(.|[\r\n])*?--\>)','<span class="cfcomments">\1</span>','all');
			readF = reReplaceNoCase(readF,'(\&lt;)(/?)(cf(.)*?)(>)','<span class="bracket">\1\2</span><span class="cftag">\3</span><span class="bracket">\5</span>','all');
			return readF;
		</cfscript>
	</cffunction>

	<cffunction name="dumpXML" access="private" returntype="string" output="false">
		<cfset var rc = controller.getRequestService().getContext().getCollection()/>
		<cfset var xmlT = readXMLfile(rc.COMname)/>
		<cfset xmlT = replaceNoCase(xmlT,'<','&lt;','all')/>
		<cfreturn xmlT/>
	</cffunction>

	<cffunction name="readXMLfile" access="private" returntype="string" output="false">
		<cfset var rc = controller.getRequestService().getContext().getCollection()/>
		<cfset var readF = ""/>
		<cftry>
			<cfset readF = fileUtils.readFile('#getSetting("ApplicationPath")#includes\xml\RSS_Sample_#rc.COMname#.xml')/>
		<cfcatch type="application">
			<cfset readF = ""/>
		</cfcatch>
		</cftry>
		<cfreturn readF />
	</cffunction>

	<cffunction name="viewDisplayFeed" access="private" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = Event.getCollection()/>
		<!--- Display the feed --->
		<cfset Event.setView("vwDisplayFeed")/>
	</cffunction>

	<cffunction name="viewMissingFeed" access="private" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = Event.getCollection()/>
		<!--- Display the feed --->
		<cfset Event.setView("vwMissingFeed")/>
	</cffunction>

</cfcomponent>