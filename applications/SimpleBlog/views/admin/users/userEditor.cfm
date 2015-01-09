<cfoutput>
<cfform action="#event.buildLink('admin.users.save')#" method="POST"	name="newPostForm">
	<input type="hidden" name="userID" id="userID" value="#rc.user.getUserID()#" />
	<h1>User Editor</h1>
	
	<p>User Type:<br/>
	<select name="userType" id="userType" style="width:365px">
		<option value="admin" <cfif rc.user.getUserType() eq "admin">selected="selected"</cfif>>Administrator</option>
		<option value="user"  <cfif rc.user.getUserType() eq "user">selected="selected"</cfif>>User</option>
	</select>
	</p>
	
	<p>First Name:<br/>
	<cfinput name="firstName" type="text" required="true"  
			 maxlength="100" size="50" message="Please enter a first name." 
			 value="#rc.user.getFirstName()#"/>
	</p>
	
	<p>Last Name:<br/>
	<cfinput name="lastname" type="text" required="true"  
			 maxlength="100" size="50" message="Please enter a last name." 
			 value="#rc.user.getLastName()#"/>
	</p>
	
	<p>Username:<br/>
	<cfinput name="username" type="text" required="true"  
			 maxlength="100" size="50" message="Please enter a username." 
			 value="#rc.user.getUsername()#"/>
	</p>
	
	<p>Password<br/>
	<cfinput name="password" type="text" required="true"  
			 maxlength="100" size="50" message="Please enter a password." 
			 value="#rc.user.getPassword()#"/>
	</p>
	
	<p>Last Login: #rc.user.getDisplayLastLogin()#
	</p>
	
	<p>
		<a href="#event.buildLink(rc.xehUsers)#">Cancel</a> or
		<input type="submit" value="Save">
	</p>
</cfform>
</cfoutput>