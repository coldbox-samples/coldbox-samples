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
	function removeComment(commentID){
		if( confirm("Really delete?") ){
			$("##commentID").val( commentID );
			$("##commentForm").submit();
		}
	}
</script>
</cfoutput>
</cfsavecontent>
<cfhtmlhead text="#js#">

<h1>Welcome to SimpleBlog Admin</h1>
<p>What would you like to do?
<ul>
	<li><a href="#event.buildLink('admin/newPost')#">New Post</a></li>
	<li><a href="#event.buildLink('admin/doLogOut')#">Log off</a></li>
</ul>

#getPlugin("MessageBox").renderit()#

<h2>Latest 10 Entries</h2>
<input type="button" onclick="window.location='#event.buildLink('admin.newPost')#'" value="New Post" />
<form name="entryForm" id="entryForm" method="post" action="#event.buildLink('admin.removePost')#">
<input type="hidden" name="entryID" id="entryID" value="" />

<!--- Render latest posts --->
<table name="entries" id="entries" class="tablelisting" width="98%">
	<thead>
		<tr>
			<th>title</th>
			<th width="200" class="center">post info</th>
			<th width="125" class="center">CMDS</th>
		</tr>
	</thead>
	
	<tbody>
		<cfloop array="#rc.posts#" index="post">
		<tr>
			<td><a href="#event.buildLink('admin.editPost')#/entryID/#post.getEntryID()#" title="Edit Post">#post.getTitle()#</a></td>
			<td>
				#post.getAuthor()#<br/>
				#post.getDisplayTime()#
			</td>
			<td class="center">
				<input type="button" onclick="window.location='#event.buildLink('entry/#post.getEntryID()#')#'" value="View" />
				<input type="button" onclick="removePost('#post.getEntryID()#')" value="Delete" />
			</td>
		</tr>
		</cfloop>
	</tbody>
</table>
</form>

<h2>Latest 10 Comments</h2>
<form name="commentForm" id="commentForm" method="post" action="#event.buildLink('admin.removeComment')#">
<input type="hidden" name="commentID" id="commentID" value="" />

<!--- Render latest posts --->
<table name="comments" id="comments" class="tablelisting" width="98%">
	<thead>
		<tr>
			<th>comment</th>
			<th width="200" class="center">post info</th>
			<th width="75" class="center">CMDS</th>
		</tr>
	</thead>
	
	<tbody>
		<cfloop array="#rc.comments#" index="comment">
		<tr>
			<td>#comment.getComment()#</td>
			<td>
				#comment.getDisplayTime()#
			</td>
			<td class="center">
				<input type="button" onclick="removeComment('#comment.getCommentID()#')" value="Delete" />
			</td>
		</tr>
		</cfloop>
	</tbody>

</table>
</form>
</cfoutput>