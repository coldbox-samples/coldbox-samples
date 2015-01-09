<div class="feedImg">
<cfoutput>
<a href="#rc.rdata.image.link#"><img src="#rc.rdata.image.url#" alt="#rc.rdata.title# logo" class="logo" /></a>
<h2>#rc.rdata.title#</h2>
<blockquote>#rc.rdata.description#</blockquote>
<div class="itemstat">#rc.rdata.rights.copyright#</div>
<p class="keywords divider">Reuters Feed URL: <a href="#rc.getReutersURL#">#rc.getReutersURL#</a><br />
Last News Revision: #getInstance("i18n@cbi18n").datetimeLocaleFormat(rc.rdata.datebuilt,'long')#
</cfoutput>
</p>
<cfoutput query="rc.rdata.items">
	<h3 style="margin-bottom:0px;padding-bottom:0px;"><a href="#rc.rdata.items.url#">#rc.rdata.items.title#</a></h3>
	<h5 style="margin-top:0px;padding-top:0px;">#getInstance("i18n@cbi18n").datetimeLocaleFormat(rc.rdata.items.dateUpdated,'long')#</h5>
	<blockquote class="divider" style="margin:0px;padding:0px;">#rc.rdata.items.body#</blockquote>
</cfoutput>