<cfoutput>
	
	<div style="float:right">
		<img src="includes/images/rss.png" border="0" alt="RSS" /> 
		<a href="#event.buildLink('rss')#">Full</a> | 
		<a href="#event.buildLink('rss')#/simple">Simple</a>
	</div>
	<h1>Blog</h1>
	
	#getInstance("MessageBox@cbmessageBox").renderit()#
	
	<cfloop array="#rc.posts#" index="post">
		<div class="blogPost">
			
			<!--- If Admin --->
			<cfif rc.oUser.isAdmin()>
			<div style="float:right">
				<input type="button" value="Edit Post" onclick="window.location='#event.buildLink(linkTo='admin.blog.editor',queryString="entryID=#post.getEntryID()#")#'" />
			</div>
			</cfif>
			
			<div class="title">
				<a href="#event.buildLink('entry/' & post.getEntryID())#">#post.getTitle()#</a>
			</div>
			<div class="postBody">#post.getBody()#</div> 
			<div class="author">Posted By: #post.getAuthor()#</div>
			<div class="date">Posted At: #post.getDisplayTime()#</div>
			<div class="commentLink">
				Comments Found (#post.getNumberOfComments()#) 
				<a href="#event.buildLink('entry/' & post.getEntryID())#">Leave a Comment</a>
			</div>
		</div>
	</cfloop>
</cfoutput>

