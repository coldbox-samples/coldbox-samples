<cfoutput>
<cfform action="#event.buildLink('admin.blog.savePost')#" method="POST"	name="newPostForm">
	<input type="hidden" name="entryID" id="entryID" value="#rc.oPost.getEntryID()#" />
	<h1>Post Editor</h1>
	
	<p>Title:<br/>
	<cfinput name="title" type="text" required="true" validateat="onSubmit" 
			 maxlength="100" size="50" message="Please enter a title for your post." 
			 value="#rc.oPost.getTitle()#"/>
	
	<p>
		<cftextarea name="body" required="true" validateat="onSubmit" id="postField" 
				 	message="You didn't write anything in your post!" richtext="yes" width="800" 
					height="300">#rc.oPost.getBody()#</cftextarea>
	
	<p>Author:<br/>
	<select name="userID" id="userID">
		<cfloop query="rc.qUsers">
			<option value="#rc.qUsers.userID#" 
				<cfif rc.oPost.hasUser() and rc.oPost.getUser().getUserID() eq rc.qUsers.userID>selected="selected"</cfif>
			>#rc.qUsers.firstName# #rc.qUsers.lastName#</option>
		</cfloop>
	</select>

	<p>
		<a href="#event.buildLink(rc.xehBlogAdmin)#">Cancel</a> or
		<input type="submit" value="Post It!">
	</p>
</cfform>
</cfoutput>