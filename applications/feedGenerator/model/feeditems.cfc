<cfcomponent name="feeditems" hint="A feed items data object">

		<cffunction name="init" access="public" returntype="feeditems" output="false">
  		<cfreturn this>
		</cffunction>

		<!-------------------------------------------
		Please do not edit or remove the comments 
		containing 'start' or 'end' as they are   
		needed by the samples.                    
		------------------------------------------->

		<!--- createFeedBeginner start --->
		<cffunction name="beginner" access="public" returntype="query" output="false">
			<cfset var returnQuery = ""/>
		<!--- 
		We now create our 'items' query to hold our feed items. We populate the QueryNew() function with a list of the tag names we wish to use. To create a valid item you must have either a 'title' or 'description' tag,
		the others are optional.
		Title is the title of the item.
		Description is the item synopsis.
		Link is the URL of the item, usually pointing to HTML version of this item.
		Author is the e-mail address and optional name of the author to the item.
		--->
			<cfset returnQuery = QueryNew("Title,Description,Link,Author")/>
			<!--- Set the number of items we wish to create. --->
			<cfset QueryAddRow(returnQuery,3)/>
			<!--- Create our first item. --->
			<cfset QuerySetCell(returnQuery, "Title", "Our first ColdBox feed item!", 1)/>
			<cfset QuerySetCell(returnQuery, "Description", "Congratulations you have successfully created your first ColdBox feed.", 1)/>
			<cfset QuerySetCell(returnQuery, "Link", "http://www.example.com/article/1", 1)/>
			<cfset QuerySetCell(returnQuery, "Author", "bengarrett@example.com (Ben Garrett)", 1)/>
			<!--- Item 2 & 3 won't have an author but that is okay as it is optional. --->
			<cfset QuerySetCell(returnQuery, "Title", "Optional tags", 2)/>
			<cfset QuerySetCell(returnQuery, "Description", "In this item we have choosen to leave out the author tag.", 2)/>
			<cfset QuerySetCell(returnQuery, "Link", "http://www.example.com/article/2", 2)/>
			<!--- Item 3. --->
			<cfset QuerySetCell(returnQuery, "Title", "Broken links", 3)/>
			<cfset QuerySetCell(returnQuery, "Description", "Don't click those example links. They are fake, but are design to to give you an example when implementing your own feeds.", 3)/>
			<cfset QuerySetCell(returnQuery, "Link", "http://www.example.com/article/3", 3)/>
		<cfreturn returnQuery/>
		</cffunction>
		<!--- createFeedBeginner end --->
	
		<!--- createFeedError start --->
		<cffunction name="error" access="public" returntype="query" output="false">
			<cfset var returnQuery = ""/>
			<cfset returnQuery = QueryNew("Title,Description,Link,Author")/>
			<cfset QueryAddRow(returnQuery,3)/>
			<cfset QuerySetCell(returnQuery, "Title", "Our first ColdBox feed item!", 1)/>
			<cfset QuerySetCell(returnQuery, "Description", "Congratulations you have successfully created your first ColdBox feed.", 1)/>
	 		<!--- 2. Created a malformed URL in the Link tag for item 1 --->
			<cfset QuerySetCell(returnQuery, "Link", "www.example.com/article/1", 1)/>
			<!--- 3. Created a malformed E-mail address in the Author tag for item 2 --->
			<cfset QuerySetCell(returnQuery, "Author", "bengarrett@examplecom (Ben Garrett)", 1)/>
			<cfset QuerySetCell(returnQuery, "Title", "Optional tags", 2)/>
			<cfset QuerySetCell(returnQuery, "Description", "In this item we have choosen to leave out the author tag.", 2)/>
			<cfset QuerySetCell(returnQuery, "Link", "http://www.example.com/article/2", 2)/>
			<!--- 4. Hidden both the Title and Description tags for item 3 --->
			<!--- <cfset QuerySetCell(returnQuery, "Title", "Broken links", 3)/> --->
			<!--- <cfset QuerySetCell(returnQuery, "Description", "Don't click those example links. They are fake, but are design to to give you an example when implementing your own feeds.", 3)/> --->
			<cfset QuerySetCell(returnQuery, "Link", "http://www.example.com/article/3", 3)/>
		<cfreturn returnQuery/>
		</cffunction>
		<!--- createFeedError end --->
		
		<!--- createFeedPlayground start --->
		<cffunction name="playground" access="public" returntype="query" output="false">
			<cfset var returnQuery = ""/>
			<!--- These are containers for Item 2 and 4's descriptions tags. Otherwise their strings when saved directly to a variable throw exceptions.
			They are enclosed in <CFOUTPUT> CFML tags otherwise that will not be displayed, due to this createFeedPlayground method having its output set to 'false'. --->
			<cfset var itemDescription2 = ""/>
			<cfset var itemDescription4 = ""/>
			<cfsavecontent variable="itemDescription2"><cfoutput>I'm headed for France. I wasn't gonna go this year, but then last week "Valley Girl" came out and I said to myself, Joe Bob, you gotta get out of the country for a while.</cfoutput></cfsavecontent>
			<cfsavecontent variable="itemDescription4"><cfoutput>I'm headed for France. I wasn't gonna go this year, but then last week <a href="http://www.imdb.com/title/tt0086525/">Valley Girl</a> came out and I said to myself, Joe Bob, you gotta get out of the country for a while.</cfoutput></cfsavecontent>
			<cfset returnQuery = QueryNew("author,category_tag,category_domain,comments,description,enclosure_url,enclosure_length,enclosure_type,link,guid_string,guid_permalink,pubDate,source_title,source_url,title")/>
			<cfset QueryAddRow(returnQuery,4)/>
			<!--- Item 1 --->
			<cfset QuerySetCell(returnQuery, "title", "Seventh Heaven! Ryan Hurls Another No Hitter", 1)/>
			<cfset QuerySetCell(returnQuery, "link", "http://dallas.example.com/1991/05/02/nolan.htm", 1)/>
			<cfset QuerySetCell(returnQuery, "description", "Texas Rangers pitcher Nolan Ryan hurled the seventh no-hitter of his legendary career on Arlington Appreciation Night, defeating the Toronto Blue Jays 3-0. The 44-year-old struck out 16 batters before a crowd of 33,439.", 1)/>
			<cfset QuerySetCell(returnQuery, "guid_string", "http://dallas.example.com/1991/05/02/nolan.htm", 1)/>
			<!--- Item 2 --->
			<cfset QuerySetCell(returnQuery, "author", "jbb@dallas.example.com (Joe Bob Briggs)", 2)/>
			<!--- category_tag and category_domain support multiples values with the use of lists. In the two tags below we have two category values and one domain. The '-' dash tells ColdBox to ignore the category_domain tag for the first value 'movies' but then apply it to the second value '1983/V'. --->
			<cfset QuerySetCell(returnQuery, "category_tag", "movies,1983/V", 2)/>
			<cfset QuerySetCell(returnQuery, "category_domain", "-,rec.arts.movies.reviews", 2)/>
			<cfset QuerySetCell(returnQuery, "comments", "http://dallas.example.com/feedback/1983/06/joebob.htm", 2)/>
			<cfset QuerySetCell(returnQuery, "description", itemDescription2, 2)/>
			<cfset QuerySetCell(returnQuery, "enclosure_url", "http://dallas.example.com/joebob_050689.mp3", 2)/>
			<cfset QuerySetCell(returnQuery, "enclosure_length", "24986239", 2)/>
			<cfset QuerySetCell(returnQuery, "enclosure_type", "audio/mpeg", 2)/>
			<cfset QuerySetCell(returnQuery, "guid_string", "http://dallas.example.com/1983/05/06/joebob.htm", 2)/>
			<cfset QuerySetCell(returnQuery, "link", "http://dallas.example.com/1983/05/06/joebob.htm", 2)/>
			<cfset QuerySetCell(returnQuery, "pubdate", "Fri, 06 May 1983 09:00:00 CST", 2)/>
			<cfset QuerySetCell(returnQuery, "source_title", "Los Angeles Herald-Examiner", 2)/>
			<cfset QuerySetCell(returnQuery, "source_url", "http://la.example.com/rss.xml", 2)/>
			<cfset QuerySetCell(returnQuery, "title", "Joe Bob Goes to the Drive-In", 2)/>
			<!--- Item 3 --->
			<cfset QuerySetCell(returnQuery, "description", "Texas Rangers pitcher Nolan Ryan hurled the seventh no-hitter of his legendary career on Arlington Appreciation Night, defeating the Toronto Blue Jays 3-0. The 44-year-old struck out 16 batters before a crowd of 33,439.", 3)/>
			<cfset QuerySetCell(returnQuery, "guid_string", "tag:dallas.example.com,4131:news", 3)/>
			<cfset QuerySetCell(returnQuery, "guid_permalink", "false", 3)/>
			<!--- Item 4. The description tag uses XML CDATA which is allowed by RSS in this tag and is recognized in ColdBox. --->
			<cfset QuerySetCell(returnQuery, "description", "<![CDATA[#itemDescription4#]]", 4)/>
			<cfset QuerySetCell(returnQuery, "guid_string", "1983-05-06+lifestyle+joebob+2", 4)/>
			<cfset QuerySetCell(returnQuery, "guid_permalink", "false", 4)/>
		<cfreturn returnQuery/>
		</cffunction>
		<!--- createFeedPlayground end --->
	
		<!--- createFeedSimpleArt start --->
		<cffunction name="simpleart" access="public" returntype="query" output="false">
			<cfset var returnQuery = ""/>
			<cfset var i = 1/>
			<cfset var ispermalink = arrayNew(1)/>
			<!--- Get database records --->
			<cfset returnQuery = getGalleryOrders()/>
			<!--- Update query with additional data and column containing guid_permalink information --->
			<cfloop from="1" to="#returnQuery.RecordCount#" index="i">
			<cfset ispermalink[i] = "false"/>
			</cfloop>
			<cfset QueryAddColumn(returnQuery, 'guid_permalink', ispermalink)/>
		<cfreturn returnQuery/>
		</cffunction>
		<!--- createFeedSimpleArt end --->
	
		<!--- createFeedCompleteArt start --->
		<cffunction name="complexart" access="public" returntype="query" output="false">
			<cfset var returnQuery = ""/>
			<cfset var i = 1/>
			<cfset var newData = structNew()/>
			<cfset newData.description = arrayNew(1)/>
			<cfset newData.guid_permalink = arrayNew(1)/>
			<cfset newData.guid_string = arrayNew(1)/>
			<cfset newData.title = arrayNew(1)/>
			<!--- Get database records --->
			<cfset returnQuery = getGalleryOrders()/>
			<!--- Update query with customized data and column information --->
			<cfloop from="1" to="#returnQuery.RecordCount#" index="i">
				<cfset newData.description[i] = 'Address:<br/>#returnQuery["address"][i]#, #returnQuery["city"][i]# #returnQuery["state"][i]#<p>#returnQuery["postalcode"][i]#</p><p>Order status: #returnQuery["orderstatusid"][i]#</p>Total purchase: $#returnQuery["total"][i]# inc. $#returnQuery["tax"][i]# tax'/>
			<cfset newData.guid_permalink[i] = "false"/>
				<cfset newData.guid_string[i] = 'tag:example.org,2008:1:#returnQuery["orderid"][i]#'/>
				<cfset newData.title[i] = '#returnQuery["customerfirstname"][i]# #returnQuery["customerlastname"][i]#'/>
			</cfloop>
			<cfset QueryAddColumn(returnQuery, 'description', newData.description)/>
			<cfset QueryAddColumn(returnQuery, 'guid_permalink', newData.guid_permalink)/>
			<cfset QueryAddColumn(returnQuery, 'guid_string', newData.guid_string)/>
			<cfset QueryAddColumn(returnQuery, 'title', newData.title)/>
		<cfreturn returnQuery/>
		</cffunction>
		<!--- createFeedCompleteArt end --->
	
		<!--- createFeediTunes start --->
		<cffunction name="itunes" access="public" returntype="query" output="false">
			<cfset var returnQuery = ""/>
			<cfset returnQuery = QueryNew("description,enclosure_length,enclosure_type,enclosure_url,guid_value,pubdate,title,itunes_author,itunes_block,itunes_duration,itunes_explicit,itunes_keywords,itunes_subtitle,itunes_summary")/>
			<cfset QueryAddRow(returnQuery,3)/>
			<!--- Item 1 --->
			<cfset QuerySetCell(returnQuery, "guid_value", "http://example.com/podcasts/archive/aae20050615.m4a", 1)/>
			<cfset QuerySetCell(returnQuery, "title", "Shake Shake Shake Your Spices", 1)/>				
			<cfset QuerySetCell(returnQuery, "description", "This week we talk about salt and pepper shakers, comparing and contrasting pour rates, construction materials, and overall aesthetics. Come and join the party!", 1)/>
			<cfset QuerySetCell(returnQuery, "pubdate", "15-Jun-2005 19:00:00", 1)/>
			<!--- Item 1 file attachment --->
			<cfset QuerySetCell(returnQuery, "enclosure_url", "http://example.com/podcasts/everything/AllAboutEverythingEpisode3.m4a", 1)/>
			<cfset QuerySetCell(returnQuery, "enclosure_length", "8727310", 1)/>
			<cfset QuerySetCell(returnQuery, "enclosure_type", "audio/x-m4a", 1)/>
			<!--- Item 1 additional iTunes details --->
			<cfset QuerySetCell(returnQuery, "itunes_author", "John Doe", 1)/>
			<cfset QuerySetCell(returnQuery, "itunes_block", "yes", 1)/>				
			<cfset QuerySetCell(returnQuery, "itunes_duration", "7:04", 1)/>
			<cfset QuerySetCell(returnQuery, "itunes_explicit", "no", 1)/>	
			<cfset QuerySetCell(returnQuery, "itunes_keywords", "salt, pepper, shaker, exciting", 1)/>
			<cfset QuerySetCell(returnQuery, "itunes_subtitle", "A short primer on table spices", 1)/>
			<cfset QuerySetCell(returnQuery, "itunes_summary", "This week we talk about salt and pepper shakers, comparing and contrasting pour rates, construction materials, and overall aesthetics. Come and join the party!", 1)/>
			<!--- Item 2 --->
			<cfset QuerySetCell(returnQuery, "guid_value", "http://example.com/podcasts/archive/aae20050608.mp3", 2)/>
			<cfset QuerySetCell(returnQuery, "title", "Socket Wrench Shootout", 2)/>
			<cfset QuerySetCell(returnQuery, "description", "This week we talk about metric vs. old english socket wrenches. Which one is better? Do you really need both? Get all of your answers here.", 2)/>
			<cfset QuerySetCell(returnQuery, "pubdate", "8-Jun-2005 19:00:00", 2)/>
			<!--- Item 2 file attachment --->
			<cfset QuerySetCell(returnQuery, "enclosure_url", "http://example.com/podcasts/everything/AllAboutEverythingEpisode2.mp3", 2)/>
			<cfset QuerySetCell(returnQuery, "enclosure_length", "5650889", 2)/>
			<cfset QuerySetCell(returnQuery, "enclosure_type", "audio/mpeg", 2)/>
			<!--- Item 2 additional iTunes details --->
			<cfset QuerySetCell(returnQuery, "itunes_author", "Jane Doe", 2)/>
			<cfset QuerySetCell(returnQuery, "itunes_duration", "4:34", 2)/>
			<cfset QuerySetCell(returnQuery, "itunes_explicit", "no", 2)/>	
			<cfset QuerySetCell(returnQuery, "itunes_keywords", "metric, socket, wrenches, tool", 2)/>
			<cfset QuerySetCell(returnQuery, "itunes_subtitle", "Comparing socket wrenches is fun!", 2)/>
			<cfset QuerySetCell(returnQuery, "itunes_summary", "This week we talk about metric vs. old english socket wrenches. Which one is better? Do you really need both? Get all of your answers here.", 2)/>
			<!--- Item 3 --->
			<cfset QuerySetCell(returnQuery, "guid_value", "http://example.com/podcasts/archive/aae20050601.mp3", 3)/>
			<cfset QuerySetCell(returnQuery, "title", "Red, Whine, & Blue", 3)/>
			<cfset QuerySetCell(returnQuery, "description", "This week we talk about surviving in a Red state if you are a Blue person. Or vice versa.", 3)/>
			<cfset QuerySetCell(returnQuery, "pubdate", "1-Jun-2005 19:00:00", 3)/>
			<!--- Item 3 file attachment --->
			<cfset QuerySetCell(returnQuery, "enclosure_url", "http://example.com/podcasts/everything/AllAboutEverythingEpisode1.mp3", 3)/>
			<cfset QuerySetCell(returnQuery, "enclosure_length", "4989537", 3)/>
			<cfset QuerySetCell(returnQuery, "enclosure_type", "audio/mpeg", 3)/>
			<!--- Item 3 additional iTunes details --->
			<cfset QuerySetCell(returnQuery, "itunes_author", "Various", 3)/>
			<cfset QuerySetCell(returnQuery, "itunes_duration", "3:59", 3)/>
			<cfset QuerySetCell(returnQuery, "itunes_explicit", "no", 3)/>
			<cfset QuerySetCell(returnQuery, "itunes_keywords", "politics, red, blue, state", 3)/>
			<cfset QuerySetCell(returnQuery, "itunes_subtitle", "Red + Blue != Purple", 3)/>
			<cfset QuerySetCell(returnQuery, "itunes_summary", "This week we talk about surviving in a Red state if you are a Blue person. Or vice versa.", 3)/>
		<cfreturn returnQuery/>
		</cffunction>
		<!--- createFeediTunes end --->
	
		<!--- createFeedOpenSearch start --->
		<cffunction name="opensearch" access="public" returntype="query" output="false">
			<cfset var returnQuery = ""/>
			<cfset returnQuery = QueryNew("description,link,guid_permaLink,guid_string,pubdate")/>
			<cfset QueryAddRow(returnQuery,1)/>
			<cfset QuerySetCell(returnQuery, "guid_string", "urn:uuid:1225c695-cfb8-4ebb-aaaa-80da344efa6a", 1)/>
			<cfset QuerySetCell(returnQuery, "guid_permaLink", "false", 1)/>	
			<cfset QuerySetCell(returnQuery, "description", "... Harlem.NYC - A virtual tour and information on businesses ...	with historic photos of Columbia's own New York neighborhood ... Internet Resources for the City's History. ...", 1)/>	
			<cfset QuerySetCell(returnQuery, "pubdate", "2003-12-13 18:30:02", 1)/>	
			<cfset QuerySetCell(returnQuery, "link", "http://www.columbia.edu/cu/lweb/eguids/amerihist/nyc.html", 1)/>	
		<cfreturn returnQuery/>
		</cffunction>
		<!--- createFeedOpenSearch end --->
	
		<!--- createFeedDublinCore start --->
		<cffunction name="dublincore" access="public" returntype="query" output="false">
			<cfset var returnQuery = ""/>

			<cfset returnQuery = QueryNew("category_tag,description,link,guid_string,source_title,source_url,title,dcmiterm_type,dcmiterm_contributor,dcmiterm_creator,dcmiterm_publisher,dcmiterm_rights")/>
			<cfset QueryAddRow(returnQuery,5)/>
			<!---Item 1 DCMI Term Type --->
			<cfset QuerySetCell(returnQuery, "title", "type", 1)/>
			<cfset QuerySetCell(returnQuery, "description", '<em>Definition:	The nature or genre of the resource.</em>', 1)/>
			<cfset QuerySetCell(returnQuery, "link", "http://dublincore.org/documents/dcmi-terms/##elements-type", 1)/>
			<cfset QuerySetCell(returnQuery, "guid_string", "http://example.org/dcmi/term/type/", 1)/>
			<cfset QuerySetCell(returnQuery, "category_tag", "type", 1)/>
			<cfset QuerySetCell(returnQuery, "source_title", "DCMI Metadata Terms", 1)/>
			<cfset QuerySetCell(returnQuery, "source_url", "http://dublincore.org/documents/dcmi-terms/##elements-type", 1)/>
			<cfset QuerySetCell(returnQuery, "dcmiterm_type", "text/xml", 1)/>
			<!---Item 2 DCMI Contributor Type --->
			<cfset QuerySetCell(returnQuery, "title", "contributor", 2)/>
			<cfset QuerySetCell(returnQuery, "description", '<em>Definition: An entity responsible for making contributions to the resource.</em>', 2)/>
			<cfset QuerySetCell(returnQuery, "link", "http://dublincore.org/documents/dcmi-terms/##elements-contributor", 2)/>
			<cfset QuerySetCell(returnQuery, "guid_string", "http://example.org/dcmi/term/contributor/", 2)/>
			<cfset QuerySetCell(returnQuery, "category_tag", "contributor", 2)/>
			<cfset QuerySetCell(returnQuery, "source_title", "DCMI Metadata Terms", 2)/>
			<cfset QuerySetCell(returnQuery, "source_url", "http://dublincore.org/documents/dcmi-terms/##elements-contributor", 2)/>
			<cfset QuerySetCell(returnQuery, "dcmiterm_contributor", "Luis Majano", 2)/>
			<!---Item 3 DCMI Term Creator --->
			<cfset QuerySetCell(returnQuery, "description", '<em>Definition: An entity primarily responsible for making the resource.</em>', 3)/>
			<cfset QuerySetCell(returnQuery, "link", "http://dublincore.org/documents/dcmi-terms/##elements-creator", 3)/>
			<cfset QuerySetCell(returnQuery, "guid_string", "http://example.org/dcmi/term/creator/", 3)/>
			<cfset QuerySetCell(returnQuery, "category_tag", "creator", 3)/>
			<cfset QuerySetCell(returnQuery, "source_title", "DCMI Metadata Terms", 3)/>
			<cfset QuerySetCell(returnQuery, "source_url", "http://dublincore.org/documents/dcmi-terms/##elements-creator", 3)/>
			<cfset QuerySetCell(returnQuery, "dcmiterm_creator", "Ben Garrett, Luis Majano", 3)/>
			<!---Item 4 DCMI Term Publisher --->
			<cfset QuerySetCell(returnQuery, "title", "publisher", 4)/>
			<cfset QuerySetCell(returnQuery, "description", '<em>Definition: An entity responsible for making the resource available.</em>', 4)/>
			<cfset QuerySetCell(returnQuery, "link", "http://dublincore.org/documents/dcmi-terms/##elements-publisher", 4)/>
			<cfset QuerySetCell(returnQuery, "guid_string", "http://example.org/dcmi/term/publisher/", 4)/>
			<cfset QuerySetCell(returnQuery, "category_tag", "publisher", 4)/>
			<cfset QuerySetCell(returnQuery, "source_title", "DCMI Metadata Terms", 4)/>
			<cfset QuerySetCell(returnQuery, "source_url", "http://dublincore.org/documents/dcmi-terms/##elements-publisher", 4)/>
			<cfset QuerySetCell(returnQuery, "dcmiterm_publisher", "Team ColdBox", 4)/>
			<!---Item 5 DCMI Term Rights --->
			<cfset QuerySetCell(returnQuery, "title", "rights", 5)/>
			<cfset QuerySetCell(returnQuery, "description", '<em>Definition: Information about rights held in and over the resource.</em>', 5)/>
			<cfset QuerySetCell(returnQuery, "link", "http://dublincore.org/documents/dcmi-terms/##elements-rights", 5)/>
			<cfset QuerySetCell(returnQuery, "guid_string", "http://example.org/dcmi/term/rights/", 5)/>
			<cfset QuerySetCell(returnQuery, "category_tag", "rights", 5)/>
			<cfset QuerySetCell(returnQuery, "source_title", "DCMI Metadata Terms", 5)/>
			<cfset QuerySetCell(returnQuery, "source_url", "http://dublincore.org/documents/dcmi-terms/##elements-rights", 5)/>
			<cfset QuerySetCell(returnQuery, "dcmiterm_rights", "Apache License, Version 2.0", 5)/>
		<cfreturn returnQuery/>
		</cffunction>
		<!--- createFeedDublinCore end --->
	
		<!--- createFeedSlash start --->
		<cffunction name="slash" access="public" returntype="query" output="false">
			<cfset var returnQuery = ""/>
			<cfset returnQuery = QueryNew("title,link,description,dcmiterm_creator,pubDate,category_tag,slash_department,slash_section,slash_comments,slash_hit_parade")/>
			<cfset QueryAddRow(returnQuery,3)/>
			<cfset QuerySetCell(returnQuery, "title", "Erican and Intol Offer Remote Notebook Lockdown", 1)/>
			<cfset QuerySetCell(returnQuery, "link", "http://example.org/slashnot/~3/2NBV3tfzSPE/article.pl", 1)/>
			<cfset QuerySetCell(returnQuery, "description", "Erican and Intol have announced that they are collaborating on a way to keep your laptop's contents safe when your laptop goes MIA. Using Intol's Anti-Robber Technology — PC Protection (Intol AT-p) and Erican's Mobile Broadband (HSPA) modules, lost or stolen laptops can be remotely locked down. Similar to IBeMem's recently announced Lockdown Then PC technology, the Erican-Intol technology uses SMS messages sent directly to a laptop's mobile broadband chip. Once the chip receives the lock-down message, it passes it to the Intol AT-p function, which is integrated into Intol's Rino 2 with vPro technology platform. Unlike IBeMem's anti-theft solution, the Erican module includes GPS functionality as well.", 1)/>
			<cfset QuerySetCell(returnQuery, "dcmiterm_creator", "timothy", 1)/>
			<cfset QuerySetCell(returnQuery, "pubDate", "2008-12-12 02:02:00", 1)/>
			<cfset QuerySetCell(returnQuery, "category_tag", "portables", 1)/>
			<cfset QuerySetCell(returnQuery, "slash_department", "insert-funny-humour-here", 1)/>
			<cfset QuerySetCell(returnQuery, "slash_section", "mobile", 1)/>
			<cfset QuerySetCell(returnQuery, "slash_comments", "15", 1)/>
			<cfset QuerySetCell(returnQuery, "slash_hit_parade", "15,16,12,6,2,1,0", 1)/>
			<cfset QuerySetCell(returnQuery, "title", "Performance Tests Show Early Windows VII Build Beats Panorama", 2)/>
			<cfset QuerySetCell(returnQuery, "link", "http://example.org/Slashnot/~3/4kzlGwzqW_Y/article.pl", 2)/>
			<cfset QuerySetCell(returnQuery, "description", "How does the latest build of Windows VII stack up against Windows Panorama? The answer seems to be very well if the benchmarks run by ZedNet are anything to go by. If Macrosoft keeps up the good then Windows VII should be head and shoulders better than Panorama. 'What we have here is one set of data points for one particular system, but I think that the results are very promising. The fact that Windows VII comes out on top in three out of four of these tests at this early stage is very promising indeed. The boot time and PCMark Vantage results are particularly good.", 2)/>
			<cfset QuerySetCell(returnQuery, "dcmiterm_creator", "timothy", 2)/>
			<cfset QuerySetCell(returnQuery, "pubDate", "2008-12-11 23:16:00", 2)/>
			<cfset QuerySetCell(returnQuery, "category_tag", "windows", 2)/>
			<cfset QuerySetCell(returnQuery, "slash_department", "this-line-whitty", 2)/>
			<cfset QuerySetCell(returnQuery, "slash_section", "tech", 2)/>
			<cfset QuerySetCell(returnQuery, "slash_comments", "55", 2)/>
			<cfset QuerySetCell(returnQuery, "slash_hit_parade", "55,34,30,14,6,5,1", 2)/>
			<cfset QuerySetCell(returnQuery, "title", "Oracal Adds Data-integrity Code To Penguin Kernel", 3)/>
			<cfset QuerySetCell(returnQuery, "link", "http://example.org/slashnot/~3/qfTcEdVVxrQ/article.pl", 3)/>
			<cfset QuerySetCell(returnQuery, "description", "'ZDNet is reporting that Oracal has added code to the Penguin kernel for ensuring data integrity. The code has been developed in partnership with Emulax and was recently accepted into the 2.6.27 kernel release.' According to the article, 'The code adds metadata to data at rest or in transit, to monitor whether that data has been corrupted. It helps make sure that I/O operations are valid by looking at that metadata — which acts as verification information — exchanged during data transmissions.'", 3)/>
			<cfset QuerySetCell(returnQuery, "dcmiterm_creator", "timothy", 3)/>
			<cfset QuerySetCell(returnQuery, "pubDate", "2008-12-12 13:46:00", 3)/>
			<cfset QuerySetCell(returnQuery, "category_tag", "linux", 3)/>
			<cfset QuerySetCell(returnQuery, "slash_department", "a-practical-joke", 3)/>
			<cfset QuerySetCell(returnQuery, "slash_section", "linux", 3)/>
			<cfset QuerySetCell(returnQuery, "slash_comments", "108645", 3)/>
			<cfset QuerySetCell(returnQuery, "slash_hit_parade", "108645,100664,85234,54435,12332,5362,563", 3)/>
		<cfreturn returnQuery/>
		</cffunction>
		<!--- createFeedSlash end --->
	
		<!--- createFeedComboEx start --->
		<cffunction name="comboex" access="public" returntype="query" output="false">
			<cfset var returnQuery = ""/>
			<cfset returnQuery = QueryNew("title,link,description,category_tag,dcmiterm_creator,pubDate,enclosure_url,enclosure_length,enclosure_type,commonslicense,itunes_author,itunes_duration,itunes_keywords,itunes_subtitle,itunes_summary")/>
			<cfset QueryAddRow(returnQuery,2)/>
			<cfset QuerySetCell(returnQuery, "title", "WEST NILE PAPYRUS", 1)/>
			<cfset QuerySetCell(returnQuery, "link", "http://www.dejunair.com/audio/download/mp3/West%20Nile%20Papyrus.mp3", 1)/>
			<cfset QuerySetCell(returnQuery, "description", "Instrumental track with feelings of trance and a bit of Floyd. Just a 'sit back and vegetate on it' kind of thing.", 1)/>
			<cfset QuerySetCell(returnQuery, "category_tag", "samples,guitar,rock,trance,drums,bass", 1)/>
				<!---Item 1 file attachment --->
			<cfset QuerySetCell(returnQuery, "enclosure_url", "http://www.dejunair.com/audio/download/mp3/West%20Nile%20Papyrus.mp3", 1)/>
			<cfset QuerySetCell(returnQuery, "enclosure_length", "6533467", 1)/>
			<cfset QuerySetCell(returnQuery, "enclosure_type", "audio/mpeg", 1)/>
				<!---Item 1 Dublin Core --->
			<cfset QuerySetCell(returnQuery, "dcmiterm_creator", "The Dejunair Project", 1)/>
				<!---Item 1 Creative Commons --->
			<cfset QuerySetCell(returnQuery, "commonslicense", "http://creativecommons.org/licenses/by-sa/2.5/", 1)/>
				<!---Item 1 iTunes --->
			<cfset QuerySetCell(returnQuery, "itunes_author", "The Dejunair Project", 1)/>
			<cfset QuerySetCell(returnQuery, "itunes_duration", "7:12", 1)/>
			<cfset QuerySetCell(returnQuery, "itunes_keywords", "samples,guitar,rock,trance,drums,bass", 1)/>
			<cfset QuerySetCell(returnQuery, "itunes_subtitle", "Instrumental track", 1)/>
			<cfset QuerySetCell(returnQuery, "itunes_summary", "Instrumental track with feelings of trance and a bit of Floyd. Just a 'sit back and vegetate on it' kind of thing.", 1)/>
				<!---Item 2 --->
			<cfset QuerySetCell(returnQuery, "title", "THE DEVIL IS CROSSING ME", 2)/>
			<cfset QuerySetCell(returnQuery, "link", "http://www.opsound.org/artist/thecolumbines/", 2)/>
			<cfset QuerySetCell(returnQuery, "description", "there's just plain bad and then there's somebody who doesn't need regular sympathy", 2)/>
			<cfset QuerySetCell(returnQuery, "category_tag", "blues,columbines,macking,spain,mackingspain,devil", 2)/>
				<!---Item 2 file attachment --->
			<cfset QuerySetCell(returnQuery, "enclosure_url", "http://innerworlde.com/music/the%20devil%20is%20crossing%20me.mp3", 2)/>
			<cfset QuerySetCell(returnQuery, "enclosure_length", "4643677", 2)/>
			<cfset QuerySetCell(returnQuery, "enclosure_type", "audio/mpeg", 2)/>
				<!---Item 2 Dublin Core --->
			<cfset QuerySetCell(returnQuery, "dcmiterm_creator", "The Columbines", 2)/>
				<!---Item 2 Creative Commons --->
			<cfset QuerySetCell(returnQuery, "commonslicense", "http://creativecommons.org/licenses/by-sa/2.5/", 2)/>
				<!---Item 2 iTunes --->
			<cfset QuerySetCell(returnQuery, "itunes_author", "The Columbines", 2)/>
			<cfset QuerySetCell(returnQuery, "itunes_duration", "4:56", 2)/>
			<cfset QuerySetCell(returnQuery, "itunes_keywords", "blues,columbines,macking,spain,mackingspain,devil", 2)/>
			<cfset QuerySetCell(returnQuery, "itunes_subtitle", "there's just plain bad", 2)/>
			<cfset QuerySetCell(returnQuery, "itunes_summary", "there's just plain bad and then there's somebody who doesn't need regular sympathy", 2)/>
		<cfreturn returnQuery/>
		</cffunction>
		<!--- createFeedComboEx end --->
	
		<!--- createFeedInternational start --->
		<cffunction name="international" access="public" returntype="query" output="false">
			<cfset var returnQuery = ""/>
			<cfset returnQuery = QueryNew("Title,Id,Description,PubDate,Dcmiterm_language")/>
			<cfset QueryAddRow(returnQuery,8)/>
			<cfset QuerySetCell(returnQuery, "title", "English", 1)/>
			<cfset QuerySetCell(returnQuery, "id", "urn:uuid:729eeb61-f53d-11dc-95ff-0800200c9a66", 1)/>
			<cfset QuerySetCell(returnQuery, "description", "The quick brown fox jumps over the lazy dog.", 1)/>
			<cfset QuerySetCell(returnQuery, "pubDate", "19-Mar-2008 9:32am", 1)/>
			<cfset QuerySetCell(returnQuery, "dcmiterm_language", "en", 1)/>
			<cfset QuerySetCell(returnQuery, "title", "Irish", 2)/>
			<cfset QuerySetCell(returnQuery, "id", "urn:uuid:729eeb62-f53d-11dc-95ff-0800300c9a66", 2)/>
			<cfset QuerySetCell(returnQuery, "description", "An ḃfuil do ċroí ag bualaḋ ó ḟaitíos an ġrá a ṁeall lena ṗóg éada ó ṡlí do leasa ṫú? D'ḟuascail Íosa Úrṁac na hÓiġe Beannaiṫe pór Éava agus Áḋaiṁ.", 2)/>
			<cfset QuerySetCell(returnQuery, "pubDate", "19-Mar-2008 9:49am", 2)/>
			<cfset QuerySetCell(returnQuery, "dcmiterm_language", "ga", 2)/>
			<cfset QuerySetCell(returnQuery, "title", "Greek (monotonic)", 3)/>
			<cfset QuerySetCell(returnQuery, "id", "urn:uuid:729eeb63-f53d-11dc-95ff-0800400c9a66", 3)/>
			<cfset QuerySetCell(returnQuery, "description", "ξεσκεπάζω την ψυχοφθόρα βδελυγμία", 3)/>
			<cfset QuerySetCell(returnQuery, "pubDate", "19-Mar-2008 9:49am", 3)/>
			<cfset QuerySetCell(returnQuery, "dcmiterm_language", "el-monoton", 3)/>
			<cfset QuerySetCell(returnQuery, "title", "Hebrew", 4)/>
			<cfset QuerySetCell(returnQuery, "id", "urn:uuid:729eeb64-f53d-11dc-95ff-0800500c9a66", 4)/>
			<cfset QuerySetCell(returnQuery, "description", "זה כיף סתם לשמוע איך תנצח קרפד עץ טוב בגן.", 4)/>
			<cfset QuerySetCell(returnQuery, "pubDate", "19-Mar-2008 9:49am", 4)/>
			<cfset QuerySetCell(returnQuery, "dcmiterm_language", "Hebr", 4)/>
			<cfset QuerySetCell(returnQuery, "title", "Japanese (Hiragana)", 5)/>
			<cfset QuerySetCell(returnQuery, "id", "urn:uuid:729eeb65-f53d-11dc-95ff-0800600c9a66", 5)/>
			<cfset QuerySetCell(returnQuery, "description", "いろはにほへど　ちりぬるを<br />わがよたれぞ　つねならむ<br />うゐのおくやま　けふこえて<br />あさきゆめみじ　ゑひもせず", 5)/>
			<cfset QuerySetCell(returnQuery, "pubDate", "19-Mar-2008 9:49am", 5)/>
			<cfset QuerySetCell(returnQuery, "dcmiterm_language", "Hira", 5)/>
			<cfset QuerySetCell(returnQuery, "title", "Bulgarian", 6)/>
			<cfset QuerySetCell(returnQuery, "id", "urn:uuid:729eeb66-f53d-11dc-95ff-0800700c9a66", 6)/>
			<cfset QuerySetCell(returnQuery, "description", "Жълтата дюля беше щастлива, че пухът, който цъфна, замръзна като гьон.", 6)/>
			<cfset QuerySetCell(returnQuery, "pubDate", "19-Mar-2008 9:49am", 6)/>
			<cfset QuerySetCell(returnQuery, "dcmiterm_language", "bg-Cyrl", 6)/>
			<cfset QuerySetCell(returnQuery, "title", "French", 7)/>
			<cfset QuerySetCell(returnQuery, "id", "urn:uuid:729eeb67-f53d-11dc-95ff-0800800c9a66", 7)/>
			<cfset QuerySetCell(returnQuery, "description", "Les naïfs ægithales hâtifs pondant à Noël où il gèle sont sûrs d'être déçus et de voir leurs drôles d'œufs abîmés.", 7)/>
			<cfset QuerySetCell(returnQuery, "pubDate", "19-Mar-2008 9:49am", 7)/>
			<cfset QuerySetCell(returnQuery, "dcmiterm_language", "fr", 7)/>
			<cfset QuerySetCell(returnQuery, "title", "Windows 1252", 8)/>
			<cfset QuerySetCell(returnQuery, "id", "urn:uuid:729eeb68-f53d-11dc-95ff-0800900c9a66", 8)/>
			<cfset QuerySetCell(returnQuery, "description", "€ ƒ „ … † ‡ ˆ ‰ Š ‹ Œ Ž ‘Single quotes used by Microsoft® Office™’ “Double quotes used by Microsoft® Office™” • – — ˜ ™ š › œ ž Ÿ", 8)/>
			<cfset QuerySetCell(returnQuery, "pubDate", "19-Mar-2008 10:17am", 8)/>
		<cfreturn returnQuery/>
		</cffunction>
		<!--- createFeedInternational end --->
	
		<!--- createFeedBandwidth start --->
		<cffunction name="bandwidth" access="public" returntype="query" output="false">
			<cfset var returnQuery = ""/>
			<cfset returnQuery = QueryNew("Title,Description,Link,Author")/>
			<cfset QueryAddRow(returnQuery,3)/>
			<cfset QuerySetCell(returnQuery, "Title", "Our first ColdBox feed item!", 1)/>
			<cfset QuerySetCell(returnQuery, "Description", "Congratulations you have successfully created your first ColdBox feed.", 1)/>
			<cfset QuerySetCell(returnQuery, "Link", "http://www.example.com/article/1", 1)/>
			<cfset QuerySetCell(returnQuery, "Author", "bengarrett@example.com (Ben Garrett)", 1)/>
			<cfset QuerySetCell(returnQuery, "Title", "Optional tags", 2)/>
			<cfset QuerySetCell(returnQuery, "Description", "In this item we have choosen to leave out the author tag.", 2)/>
			<cfset QuerySetCell(returnQuery, "Link", "http://www.example.com/article/2", 2)/>
			<cfset QuerySetCell(returnQuery, "Title", "Broken links", 3)/>
			<cfset QuerySetCell(returnQuery, "Description", "Don't click those example links. They are fake, but are design to to give you an example when implementing your own feeds.", 3)/>
			<cfset QuerySetCell(returnQuery, "Link", "http://www.example.com/article/3", 3)/>
			<cfreturn returnQuery/>
		</cffunction>
		<!--- createFeedBandwidth end --->

		<!-------------------------------------------------------------------------------------->

		<cffunction name="getGalleryOrders" access="private" returntype="query" output="false">
			<cfset var returnQuery = ""/>
			<cftry>
			<!--- Query the cfartgallery database and save it to a returnQuery variable --->
				<cfquery name="returnQuery" datasource="cfartgallery">
				SELECT address,city,state,postalcode,customerfirstname,customerlastname,orderdate,orderid,orderstatusid,total,tax
				FROM orders
				ORDER BY orderdate DESC
				</cfquery>
				<!--- If the database query fails we create an empty query --->
				<cfcatch type="Database">
					<cfset returnQuery = QueryNew("orderid","VarChar")/>
				</cfcatch>
			</cftry>
		<cfreturn returnQuery/>
		</cffunction>

</cfcomponent>