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
			window.location='#event.buildLink(linkto="admin.removeComment")#/entryID/'+entryID+'/commentID/'+commentID;
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
	<form name="entryForm" id="entryForm" method="post" action="#event.buildLink('admin.removePost')#">
		<input type="hidden" name="entryID" id="entryID" value="#rc.oPost.getEntryID()#"/>
	</form>
	<!--- Remove Bar --->
	<div style="float:right">
		<input type="button" value="Edit Post" onclick="window.location='#event.buildLink(linkTo='admin.editPost',queryString="entryID=#rc.oPost.getEntryID()#")#'" />
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
		
		#getPlugin("messageBox").renderit()#
		
		<cfloop array="#rc.oPost.getComments()#" index="comment">
			<div class="comment">
				<!--- If Admin --->
				<cfif rc.oUser.isAdmin()>
					<!--- Remove Bar --->
					<div style="float:right">
						<input type="button" value="Remove Comment" onclick="removeComment('#comment.getCommentID()#','#rc.oPost.getEntryID()#')" />
					</div>
				</cfif>
				<div class="commentBody">#comment.getComment()#</div>
				<div class="commentTime">#comment.getDisplayTime()#</div>
			</div>
		</cfloop>
		
		
		<div><h3>Enter your comment:</h3></div>
		<form action="#event.buildLink('blog.doAddComment')#" method="POST">
			<textarea id="comment" name="comment" cols="40" rows="8"></textarea>
			<p><input name="submit" id="commentSubmitButton" type="submit" value="Submit Comment">
			<p><input type="hidden" id="entryID" name="entryID" value="#rc.oPost.getEntryId()#">
		</form>
	</div>
</div>
</cfoutput>

