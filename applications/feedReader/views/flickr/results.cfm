<cfoutput>
<div class="pageStats">
Page 1 of 1 - There were a total of #arrayLen( rc.flickrdata.items )# results
</div>
<div class="feedImg">
<a href="#rc.flickrdata.websiteurl#"><img src="#rc.flickrdata.image.icon#" alt="#rc.flickrdata.title# logo" class="logo" /></a>
<h2>#rc.flickrdata.title# results</h2>
<div class="keywords divider">Flickr Feed URL: <a href="#rc.getFlickrURL#">#rc.getFlickrURL#</a><br />
Last Search Result Revision: #getInstance("i18n@cbi18n").datetimeLocaleFormat( rc.flickrdata.dateupdated, 'long' )#
</div>
</cfoutput>
<cfloop from="1" to="#ArrayLen(rc.flickrdata.items)#" index="rc.i">
<cfoutput>
	<h3><a href="#rc.flickrdata.items[rc.i].url#">#rc.flickrdata.items[rc.i].title#</a></h3>
	<div>#rc.flickrdata.items[rc.i].body#</div>
	<div>Download: 
	<cfloop from="1" to="#ArrayLen(rc.flickrdata.items[rc.i].attachment)#" index="rc.ai">
		<cfif rc.flickrdata.items[rc.i].attachment[rc.ai].mimetype contains 'image/' and rc.flickrdata.items[rc.i].attachment[rc.ai].type is 'enclosure'>
		<a href="#rc.flickrdata.items[rc.i].attachment[rc.ai].url#"> Photo #rc.ai# </a>
		</cfif>
	</cfloop>
	</div>
	<div class="itemstat">Id: #rc.flickrdata.items[rc.i].id# - Author: #rc.flickrdata.items[rc.i].author#</div>
	<div class="keywords divider">Keywords: 
	<cfloop from="1" to="#ListLen(rc.flickrdata.items[rc.i].keywords)#" index="rc.ai">
		<a href="#Event.buildLink('flickr.tags')#&tag_list=#ListGetAt(rc.flickrdata.items[rc.i].keywords,rc.ai)#">#ListGetAt(rc.flickrdata.items[rc.i].keywords,rc.ai)#</a> 
	</cfloop>
	</div>
</cfoutput>
</cfloop>
</div>