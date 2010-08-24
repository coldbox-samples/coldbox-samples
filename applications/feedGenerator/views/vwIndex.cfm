<div class="framing">
<ol class="docContents">
	<li><a href="#about_feeds" rel="chapter">About Feeds</a></li>
	<li><a href="#coldbox_samples" rel="chapter">ColdBox Samples</a></li>
	<li class="docC1"><a href="#beginners_guide" rel="chapter">Beginners Guide</a></li>
	<li class="docC1"><a href="#debugger" rel="chapter">Debugger and Validator</a></li>
	<li class="docC1"><a href="#stand_alone" rel="chapter">Stand Alone Feeds</a></li>
	<li class="docC1"><a href="#dynamic_database" rel="chapter">Dynamic Database Feeds</a></li>
	<li class="docC1"><a href="#rss_extensions" rel="chapter">RSS Extensions</a></li>
	<li class="docC2"><a href="#apple_itunes" rel="chapter">Apple iTunes</a></li>
	<li class="docC2"><a href="#opensearch" rel="chapter">OpenSearch</a></li>
	<li class="docC2"><a href="#dublin_core" rel="chapter">Dublin Core Metadata</a></li>
	<li class="docC2"><a href="#slash" rel="chapter">Slash</a></li>
	<li class="docC2"><a href="#combinations" rel="chapter">Combinations</a></li>
	<li class="docC1"><a href="#related_topics" rel="chapter">Related Topics</a></li>
	<li class="docC2"><a href="#international_support" rel="chapter">International Support</a></li>
	<li class="docC2"><a href="#autodiscovery" rel="chapter">Autodiscovery</a></li>
	<li class="docC2"><a href="#conditional_get" rel="chapter">Conditional Get</a></li>
</ol>
<h2>About Feeds<a name="about_feeds">&nbsp;</a></h2>
<a href="http://en.wikipedia.org/wiki/RSS_(file_format)" title="Wikipedia RSS link">Wikipedia</a> states <blockquote cite="http://en.wikipedia.org/wiki/RSS_(file_format)">RSS is a family of Web feed formats used to publish frequently updated works-such as blog entries, news headlines, audio, and video-in a standardized format.</blockquote>
<p>Now with complete RSS support in ColdBox you will be able to regularly post updated works related to your site in an industry standardized form. While there are a variety of RSS standards, ColdBox supports the most common and widely supported syntax <a href="http://www.rssboard.org/" title="RSS Advisory Board">Really Simple Syndication 2</a>.</p>
<blockquote cite="http://en.wikipedia.org/wiki/RSS_(file_format)">An RSS document (which is called a "feed", "web feed", or "channel") includes full or summarized text, plus metadata such as publishing dates and authorship.</blockquote>
<p>An RSS feed is comprised of two parts. The <strong>channel</strong> contains information about the feed itself while the <strong>items</strong> contain the updated works you share. ColdBox receives all channel data in structure form while all item data is received in query form. The feedGenerator plug-in then reads and converts this data into RSS standard <a href="http://en.wikipedia.org/wiki/XML" title="XML link">XML</a>. This XML can then be read by any feed reader including most web browsers and is even human readable.</p>
<blockquote cite="http://en.wikipedia.org/wiki/RSS_(file_format)">Web feeds benefit publishers by letting them syndicate content automatically. They benefit readers who want to subscribe to timely updates from favored websites or to aggregate feeds from many sites into one place.</blockquote>
<p>By syndicating your content you allow other readers and websites to subscribe to your feeds. Other sites can incorporate or aggregate these feeds into their own pages. Even Internet-aware hardware in everything from mobile phones to hi-fi radios can now incorporate feeds for live updates on their visual displays.</p>

<h2>ColdBox Samples<a name="coldbox_samples">&nbsp;</a></h2>
<h3>Beginners Guide<a name="beginners_guide">&nbsp;</a></h3>
This section briefly shows you how to create a basic, manually updated web feed. This means it will not by tied to any live data such as a database.
<p>A web feed is comprised of two sections, the channel and the items. The channel contains all the information used to describe the feed including titles, descriptions, copyright information and even related websites and alternative feeds. While the items contain the updated works whether it is brief text, complete articles or file attachments.</p>
<p>Below is a step by step sequence of how we create a feed using ColdBox.</p>
<ol>
	<li class="orderedList"><a href="<cfoutput>#event.buildLink('examples.dumpFeedBeginner')#</cfoutput>">Display the Event used to create feed</a><p>We first use an Event to supply the data that is going to be used in the feed.<br />Event: <code>createFeedBeginner</code> in <code>/handlers/examples.cfc</code></p></li>
	<li class="orderedList"><a href="<cfoutput>#event.buildLink('examples.createFeedBeginner')#</cfoutput>">Generate feed</a><p>Then we run the event to create the RSS feed and save it to the ColdBox server as a XML document. Every time the feed is updated with new data, this event needs to be rerun.</p></li>
	<li class="orderedList"><a href="<cfoutput>#event.buildLink('examples.sourceFeedBeginner')#</cfoutput>">Display feed source</a><p>You can now view the generated feed as a human readable, plain text XML document.</p></li>
	<li class="orderedList"><a href="<cfoutput>#event.buildLink('examples.dumpDisplayFeedBeginner')#</cfoutput>">Display feed Event</a><p>To allow people to properly use your feed we create a new Event. It will read the RSS/XML document stored as a file on the server and copy it to the Request Collection variable <kbd>#rc.DumpXML#</kbd>.<br />Event: <code>displayFeedBeginner</code> in <code>/handlers/examples.cfc</code></p></li>
	<li class="orderedList"><a href="<cfoutput>#event.buildLink('examples.dumpLayoutXML')#</cfoutput>">Display Layout</a><p>We use a very simple Layout to serve the XML document.<br />Layout: <code>/layout/Layout.xml.cfm</code></p></li>
	<li class="orderedList"><a href="<cfoutput>#event.buildLink('examples.dumpvwPostGenerate')#</cfoutput>">Display View</a><p>This XML file that has been copied to the <kbd>#rc.DumpXML#</kbd> variable will be displayed using the vwPostGenerate View.<br />View: <code>/views/vwPostGenerate.cfm</code></p></li>
	<li class="orderedList"><a href="<cfoutput>#event.buildLink('examples.displayFeedBeginner')#</cfoutput>">Display feed</a><span class="note"> *</span><p>This Event is our public URL for the feed. It will correctly display the feed when used in any feed reader, such as Safari shown in the figure below. Internet Explorer 7, Firefox would also display something very similar.<br />Event: <code>displayFeedBeginner</code> in <code>/handlers/examples.cfc</code></p></li>
</ol>
<p>
<img src="includes/images/beginner-feed.png" alt="Beginner feed being viewed in Safari" class="imgFrame"/>
<br/><span class="imgCaption">Our beginner feed as viewed in Apple Safari 3</span>
</p>
<h3>Debugger and Validator<a name="debugger">&nbsp;</a></h3>
ColdBox has an inbuilt debugger / validator for your feeds. This scans through the data provided by your Event and lets you know of any potential problems that may arise. Feeds have strict rules that must be adhered to otherwise they become invalid and might not display correctly. In the example below we have recreated the Beginners feed, but this time we have intentionally created some errors to trip the validator.
<p>
<img src="includes/images/exception-encounted.png" alt="Feed Generator debug errors" class="imgFrame"/>
<br/><span class="imgCaption">Debug errors in ColdFusion 8</span>
</p>
<ul>
	<li><a href="<cfoutput>#event.buildLink('examples.dumpFeedError')#</cfoutput>">Display code used to create feed</a></li>
	<li><a href="<cfoutput>#event.buildLink('examples.createFeedError')#</cfoutput>">Generate feed</a> <sub>(to trigger the debugger)</sub></li>
</ul>
<h3>Stand Alone Feeds<a name="stand_alone">&nbsp;</a></h3>
Our third example is what is referred to as the RSS playground. This feed was created by the RSS Advisory Board as a demonstration of all the base RSS tags and attributes. You can find the <a href="http://www.rssboard.org/rss-playground" title="RSS Playground">Advisory Board's RSS playground web application</a> on their website.
<ul>
	<li><a href="<cfoutput>#event.buildLink('examples.dumpFeedPlayground')#</cfoutput>">Display code used to create feed</a></li>
	<li><a href="<cfoutput>#event.buildLink('examples.createFeedPlayground')#</cfoutput>">Generate feed</a></li>
	<li><a href="<cfoutput>#event.buildLink('examples.sourceFeedPlayground')#</cfoutput>">Display feed source</a></li>
	<li><a href="<cfoutput>#event.buildLink('examples.displayFeedPlayground')#</cfoutput>">Display feed</a><span class="note"> *</span></li>
</ul>
<h3>Dynamic Database Feeds<a name="dynamic_database">&nbsp;</a></h3>
All our previous feeds have been created using static data that we have manually fed to the feed generator. In this section we create feeds based on data sourced from the built-in ColdFusion example database known as <kbd>cfartgallery</kbd>. For those users who do not have this database active you will still be able to look at the code but you will not be able to generate the feed.
<p>
<img src="includes/images/cfartgallery-dsn.png" alt="ColdFusion Default DSN" class="imgFrame"/>
<br/><span class="imgCaption">ColdFusion 8 administrator displaying the built-in databases</span>
</p>
<ul>
	<li><a href="<cfoutput>#event.buildLink('examples.dumpFeedSimpleArt')#</cfoutput>">Display code used to create feed</a></li>
	<li><a href="<cfoutput>#event.buildLink('examples.createFeedSimpleArt')#</cfoutput>">Generate feed</a></li>
	<li><a href="<cfoutput>#event.buildLink('examples.sourceFeedSimpleArt')#</cfoutput>">Display feed source</a></li>
	<li><a href="<cfoutput>#event.buildLink('examples.displayFeedSimpleArt')#</cfoutput>">Display feed</a><span class="note"> *</span></li>
</ul>
Often data contained within database cells are not in an appropriate format to use in our feeds. So in this example we take the same data from the built-in <kbd>cfartgallery</kbd> and format it using HTML tags to make it more suitable for public consumption.
<ul>
	<li><a href="<cfoutput>#event.buildLink('examples.dumpFeedCompleteArt')#</cfoutput>">Display code used to create feed</a></li>
	<li><a href="<cfoutput>#event.buildLink('examples.createFeedCompleteArt')#</cfoutput>">Generate feed</a></li>
	<li><a href="<cfoutput>#event.buildLink('examples.sourceFeedCompleteArt')#</cfoutput>">Display feed source</a></li>
	<li><a href="<cfoutput>#event.buildLink('examples.displayFeedCompleteArt')#</cfoutput>">Display feed</a><span class="note"> *</span></li>
</ul>
<h3>RSS Extensions<a name="rss_extensions">&nbsp;</a></h3>
<p>Part of the popularity of RSS has been its support of extensions. These allow developers to add new tags to the base RSS specification. Part of their beauty is that you can you can mix and match different tags from different supported extensions. While many RSS extensions exist we have chosen to support only the more popular, less complex ones. It should be noted that many feed readers do not support extensions and will simply ignore the extra tags provided. For example Apple's iTunes media player will read and use all the Apple iTunes extension tags while Apple's Safari web browser will only read and use some.</p>
<h4>Apple iTunes<a name="apple_itunes">&nbsp;</a></h4>
The Apple iTunes RSS extension was created not long after Apple introduced RSS support into their iTunes Media player. As part of a marketing exercise they adopted the then popular term 'Podcasts' for these multimedia feeds. But in essence they are nothing more than standard RSS feeds with multimedia file attachments using the RSS <code>&lt;enclosure></code> tag. Apple created their RSS extension to allow Podcast broadcasters to provide specific information to the Apple iTunes player. All of Apple's extension tags are supported by ColdBox, more information on these can be found at <a href="http://www.apple.com/itunes/whatson/podcasts/specs.html" title="Apple iTunes Podcast">apple.com</a>.
<p>
<img src="includes/images/apple-itunes-podcast.png" alt="Apple iTunes displaying our example feed" class="imgFrame"/>
<br/><span class="imgCaption">Our example feed as viewed in Apple iTunes 8</span>
</p>
<ul>
	<li><a href="<cfoutput>#event.buildLink('examples.dumpFeediTunes')#</cfoutput>">Display code used to create feed</a></li>
	<li><a href="<cfoutput>#event.buildLink('examples.createFeediTunes')#</cfoutput>">Generate feed</a></li>
	<li><a href="<cfoutput>#event.buildLink('examples.sourceFeediTunes')#</cfoutput>">Display feed source</a></li>
	<li><a href="<cfoutput>#event.buildLink('examples.displayFeediTunes')#</cfoutput>">Display feed</a><span class="note"> *</span></li>
</ul>
<h4>OpenSearch<a name="opensearch">&nbsp;</a></h4>
<p>OpenSearch is a collection of formats used for the sharing of search results. It enables people to discover and share your site's search engine and syndicate those results across the web. Numerous websites have implemented OpenSearch including Wikipedia, Amazon and The Internet Movie Database.</p>
<p>ColdBox supports the creation and use of all the OpenSearch RSS tags and attributes. There is more information on OpenSearch at the offical site <a href="http://www.opensearch.org/" title="OpenSearch.org">opensearch.org</a>.</p>
<p>
<img src="includes/images/opensearch-discovery.png" alt="OpenSearch autodiscovery" class="imgFrame"/>
<br/><span class="imgCaption">OpenSearch autodiscovery in Internet Explorer 7</span>
</p>
<ul>
	<li><a href="<cfoutput>#event.buildLink('examples.dumpFeedOpenSearch')#</cfoutput>">Display code used to create feed</a></li>
	<li><a href="<cfoutput>#event.buildLink('examples.createFeedOpenSearch')#</cfoutput>">Generate feed</a></li>
	<li><a href="<cfoutput>#event.buildLink('examples.sourceFeedOpenSearch')#</cfoutput>">Display feed source</a></li>
	<li><a href="<cfoutput>#event.buildLink('examples.displayFeedOpenSearch')#</cfoutput>">Display feed</a><span class="note"> *</span></li>
</ul>
<h4>Dublin Core Metadata<a name="dublin_core">&nbsp;</a></h4>
<p><a href="http://en.wikipedia.org/wiki/Dublin_Core" title="Dublin Core on Wikipedia">Wikipedia</a> states<blockquote cite="http://en.wikipedia.org/wiki/Dublin_Core">The Dublin Core metadata element set is a standard for cross-domain information resource description. It provides a simple and standardised set of conventions for describing things online in ways that make them easier to find. Dublin Core is widely used to describe digital materials such as video, sound, image, text, and composite media like web pages.</blockquote></p>
<p>ColdBox supports the complete Dublin Core Metadata Element Set, Version 1.1. This enables you to use all the tags available in the <a href="http://dublincore.org/documents/dces/">DCMI Metadata Elements Set</a> specification.</p>
<ul>
	<li><a href="<cfoutput>#event.buildLink('examples.dumpFeedDublinCore')#</cfoutput>">Display code used to create feed</a></li>
	<li><a href="<cfoutput>#event.buildLink('examples.createFeedDublinCore')#</cfoutput>">Generate feed</a></li>
	<li><a href="<cfoutput>#event.buildLink('examples.sourceFeedDublinCore')#</cfoutput>">Display feed source</a></li>
	<li><a href="<cfoutput>#event.buildLink('examples.displayFeedDublinCore')#</cfoutput>">Display feed</a><span class="note"> *</span></li>
</ul>
<h4>Slash<a name="slash">&nbsp;</a></h4>
<p>The Slash extension was created by the popular tech website <a href="http://www.slashdot.org">Slashdot</a> and is used in the open source project <a href="http://www.slashcode.com">Slash</a>. It is a simple addition with only 4 new tags that are designed to extend the RSS <code>&lt;comments></code> tag.</p>
<ul>
	<li><a href="<cfoutput>#event.buildLink('examples.dumpFeedSlash')#</cfoutput>">Display code used to create feed</a></li>
	<li><a href="<cfoutput>#event.buildLink('examples.createFeedSlash')#</cfoutput>">Generate feed</a></li>
	<li><a href="<cfoutput>#event.buildLink('examples.sourceFeedSlash')#</cfoutput>">Display feed source</a></li>
	<li><a href="<cfoutput>#event.buildLink('examples.displayFeedSlash')#</cfoutput>">Display feed</a><span class="note"> *</span></li>
</ul>
<h4>Combinations<a name="combinations">&nbsp;</a></h4>
<p>As mentioned in the extension introduction you can mix and match different extensions as you choose. This combinations example shows the Creative Commons, Dublin Core and the Apple iTunes extensions all being used together in a single feed.</p>
<ul>
	<li><a href="<cfoutput>#event.buildLink('examples.dumpFeedComboEx')#</cfoutput>">Display code used to create feed</a></li>
	<li><a href="<cfoutput>#event.buildLink('examples.createFeedComboEx')#</cfoutput>">Generate feed</a></li>
	<li><a href="<cfoutput>#event.buildLink('examples.sourceFeedComboEx')#</cfoutput>">Display feed source</a></li>
	<li><a href="<cfoutput>#event.buildLink('examples.displayFeedComboEx')#</cfoutput>">Display feed</a><span class="note"> *</span></li>
</ul>
<h3>Related Topics<a name="related_topics">&nbsp;</a></h3>
<h4>International and Microsoft Office High Character Support<a name="international_support">&nbsp;</a></h4>
<p>The XML specification used by RSS feeds is very strict on formatting and character encoding. Unfortunately many feed generators for ColdFusion including ColdFusion's own <code>&lt;cffeed></code> tag fail to correctly encode non-standard and non-western characters to make them XML compatible. This discriminates against the many non-Western European languages that do not exclusively use Latin characters. Many users who copy and paste text from Microsoft Office documents also can find that their RSS/XML documents break due to Office's insistence in using non-standard characters for punctuation such as quotation marks.</p><p>Fortunately ColdBox is fully aware of these problems and automatically encodes all potentially offending characters to their XML friendly Unicode equivalent when needed. All you need to do is make sure all the feed related pages are saved with Unicode (UTF-8) rather than the more common Western European (ISO-8859/Windows) encoding.</p>
<cfif structKeyExists(server,'railo')><p class="note">Railo users will need to make sure the Railo Web or Server Administrator setting is modified: Settings &gt; Charset &gt; Resource charset; It should be changed from &quot;ANSI_X3.4-1968&quot; to &quot;UTF-8&quot;</p></cfif>
<p>
<img src="includes/images/dw_page_encoding.png" alt="Setting page encoding in Dreamweaver" class="imgFrame"/>
	<br/><span class="imgCaption">Setting page encoding in Adobe Dreamweaver</span>
</p>
<ul>
	<li><a href="<cfoutput>#event.buildLink('examples.dumpFeedInternational')#</cfoutput>">Display code used to create feed</a></li>
	<li><a href="<cfoutput>#event.buildLink('examples.createFeedInternational')#</cfoutput>">Generate feed</a></li>
	<li><a href="<cfoutput>#event.buildLink('examples.sourceFeedInternational')#</cfoutput>">Display feed source</a></li>
	<li><a href="<cfoutput>#event.buildLink('examples.displayFeedInternational')#</cfoutput>">Display feed</a><span class="note"> *</span></li>
</ul>
<h4>Autodiscovery<a name="autodiscovery">&nbsp;</a></h4>
<p>Autodiscovery is a technique that allows modern web browsers to automatically detect a sites RSS feeds, no matter what format it is in. This page you are reading has had Autodiscovery implemented and the code used to implement it can be found in the link below. The figure below shows this pages Autodiscovery running in today's popular browsers. More information can be found at the <a href="http://www.rssboard.org/rss-autodiscovery">RSS Autodiscovery page</a>.</p>
<p>
	<table border="0" cellspacing="0" cellpadding="4" class="imgFrame">
		<tr>
			<th scope="col">Internet Explorer 7</th>
			<th scope="col">Firefox 3</th>
			<th scope="col">Safari 3</th>
		</tr>
		<tr valign="top">
			<td><img src="includes/images/auto-ie7.png" alt="Autodiscovery in IE7"/></td>
			<td><img src="includes/images/auto-ff3.png" alt="Autodiscovery in FF3"/></td>
			<td><img src="includes/images/auto-safari3.png" alt="Autodiscovery in Safari 3"/></td>
		</tr>
	</table>
	<span class="imgCaption">RSS autodiscovery in some popular browsers</span>
</p>
<ul>
	<li><a href="<cfoutput>#event.buildLink('examples.dumpLayoutAutoDiscovery')#</cfoutput>">Display autodiscovery HTML code</a></li>
</ul>
<h4>Save Bandwidth and Server Resources Using A Conditional Get<a name="conditional_get">&nbsp;</a></h4>
<p>A well documented technique to save bandwidth while hosting RSS feeds is to use a conditional <code>HTTP Get (If-Modified-Since)</code> while serving your feeds. Often when a feed is requested the reader will include in the header, information pertaining to the last time the feed was requested. Our custom ColdBox Layout using the <code>GetHttpRequestData()</code> function obtains this and then compares the value to a time/date application variable we have stored in the server memory. This application variable is automatically updated every time the feed is regenerated. So whenever the application variable time/date is more recent then the time/date offered by the feed reader, then ColdBox returns the whole feed. Otherwise it aborts the request and tells the reader that the feed has not changed since the last time it checked.</p>
<p>For the two figures below we have on the left a first time request and then to the right we have a repeat request. The <span style="color:#FF0">yellow</span> and <span style="color:#0F0">green</span> highlighted text shows identical time values in the <code>If-Modified-Since HTTP</code> header. While the <span style="color:#0FF">sky blue</span> highlight shows a first time page render using a <code>HTTP 200 OK</code> response from the ColdFusion server. The <span style="color:#00F">darker blue</span> highlight shows the second request header with a <code>HTTP 304 Not Modified</code> response.</p>
<p>
	<img src="includes/images/if-none-match-1st.png" alt="First request, HTTP header display" class="imgFrame"/>
	<img src="includes/images/if-none-match-2nd.png" alt="Repeat request, HTTP header display" class="imgFrame"/>
	<br/><span class="imgCaption">HTTP headers show a RSS feed request and reply</span>
</p>
<ul>
	<li><a href="<cfoutput>#event.buildLink('examples.dumpFeedBandwidth')#</cfoutput>">Display code used to create feed</a></li>
	<li><a href="<cfoutput>#event.buildLink('examples.createFeedBandwidth')#</cfoutput>">Generate feed</a></li>
	<li><a href="<cfoutput>#event.buildLink('examples.dumpLayoutBandwidth')#</cfoutput>">Display Layout used to cache the feed</a></li>
	<li><a href="<cfoutput>#event.buildLink('examples.displayFeedBandwidth')#</cfoutput>">Display feed</a><span class="note"> *</span></li>
</ul>
<p class="note">* The Display feed function does not work with browsers which have no RSS support such as Google Chrome 1.x.</p>
</div>