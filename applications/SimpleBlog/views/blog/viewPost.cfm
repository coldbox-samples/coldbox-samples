<cfoutput>
<!--- js --->
<cfsavecontent variable="js">
<cfoutput>
<script type="text/javascript">
	function removePost(entryID){
		if( confirm("Really delete?") ){
			$("##entryID").val( entryID );
			$("##entryForm").submit();
		}
	}
	function removeComment(commentID,entryID){
		if( confirm("Really delete?") ){
			window.location='#event.buildLink(linkto="admin.blog.removeComment")#/entryID/'+entryID+'/commentID/'+commentID;
		}
	}
</script>
</cfoutput>
</cfsavecontent>
<cfhtmlhead text="#js#">

<div class="blogPost" id="singleEntry">
	
	<!--- If Admin --->
	<cfif rc.oUser.isAdmin()>
	<!--- Remove Form --->
	<form name="entryForm" id="entryForm" method="post" action="#event.buildLink('admin.blog.removePost')#">
		<input type="hidden" name="entryID" id="entryID" value="#rc.oPost.getEntryID()#"/>
	</form>
	<!--- Remove Bar --->
	<div style="float:right">
		<input type="button" value="Edit Post" onclick="window.location='#event.buildLink(linkTo='admin.blog.editor',queryString="entryID=#rc.oPost.getEntryID()#")#'" />
		<input type="button" value="Remove Post" onclick="removePost('#rc.oPost.getEntryID()#')" />
	</div>
	</cfif>
	
	<div class="title">#rc.oPost.getTitle()#</div>

	<div class="postBody">#rc.oPost.getBody()#</div>
	<div class="author">Posted By: #rc.oPost.getAuthor()#</div>
	<div class="date">#rc.oPost.getDisplayTime()#</div>


	<div class="postComments">
		<a name="postComments" id="postComments"></a>
		<h3>Comments:</h3>
		
		#getInstance("MessageBox@cbmessageBox").renderit()#
		
		<cfloop array="#rc.oPost.getComments()#" index="comment">
			<div class="comment">
				<!--- If Admin --->
				<cfif rc.oUser.isAdmin()>
					<!--- Remove Bar --->
					<div style="float:right">
						<input type="button" value="Remove Comment" onclick="removeComment('#comment.getCommentID()#','#rc.oPost.getEntryID()#')" />
					</div>
				</cfif>
				
				<!--- Comment Itself --->
				<div class="commentBody">
					<!--- Avatar --->
					<cfif len(comment.getAuthorEmail())>
					<div class="commentAvatar">#getInstance("Avatar").renderAvatar(comment.getAuthorEmail())#</div>
					</cfif>
					#comment.getComment()#
				</div>
				
				<!--- Author Info --->
				<cfif len(comment.getAuthor())>
				<div class="commentPostInfo">By: 
					<cfif len(comment.getAuthorURL())>
					<a href="#comment.getAuthorURL()#" target="_blank">#comment.getAuthor()#</a>
					<cfelse>
					#comment.getAuthor()#
					</cfif>
				</div>
				</cfif>
				<!--- Post Info --->
				<div class="commentTime">On: #comment.getDisplayTime()#</div>
			</div>
		</cfloop>
		
		<br/>
		
		<!--- Comments --->
		<form action="#event.buildLink('blog.doAddComment')#" method="POST">
			
			<!--- Comment --->
			<div><h4>Enter your comment:</h4></div>
			<textarea id="comment" name="comment" cols="52" rows="8">#flash.get("comment","")#</textarea>
			<!--- Author --->
			<div><h4>Your Name: (Optional)</h4></div>
			<p><input name="author" id="author" type="text" size="60" value="#flash.get("author","")#"/></p>
			<!--- Author Email --->
			<div><h4>Your Email: (Optional)</h4></div>
			<p><input name="authorEmail" id="authorEmail" type="text" size="60" value="#flash.get("authorEmail","")#"/></p>
			<!--- Author URL --->
			<div><h4>Your URL: (Optional)</h4></div>
			<p><input name="authorURL" id="authorURL" type="text" size="60" value="#flash.get("authorURL","")#"/></p>
			
			<!--- Submit Comment --->
			<p><input name="submit" id="commentSubmitButton" type="submit" value="Submit Comment">
			<p><input type="hidden" id="entryID" name="entryID" value="#rc.oPost.getEntryId()#">
		</form>
	</div>
</div>
</cfoutput>

