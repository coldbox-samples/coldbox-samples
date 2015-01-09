<cfoutput>
<!--- js --->
<cfsavecontent variable="js">
<cfoutput>
<script type="text/javascript">
	function removeUser(userID){
		if( confirm("Really delete?") ){
			$("##userID").val( userID );
			$("##userForm").submit();
		}
	}
</script>
</cfoutput>
</cfsavecontent>
<cfhtmlhead text="#js#">

<h1>User Management</h1>
<p>What would you like to do?
<ul>
	<li><a href="#event.buildLink(rc.xehUserEditor)#">Create User</a></li>
</ul>
#getInstance("MessageBox@cbmessageBox").renderit()#

<form name="userForm" id="userForm" method="post" action="#event.buildLink('admin.users.remove')#">
<input type="hidden" name="userID" id="userID" value="" />

<!--- users --->
<table name="users" id="users" class="tablelisting" width="98%">
	<thead>
		<tr>
			<th>Name</th>
			<th>Username</th>
			<th>Last Login</th>
			<th>User Type</th>
			<th width="125" class="center">Actions</th>
		</tr>
	</thead>
	
	<tbody>
		<cfloop array="#rc.users#" index="user">
		<tr>
			<td><a href="#event.buildLink(rc.xehUserEditor)#/userID/#user.getUserID()#" title="Edit User">#user.getName()#</a></td>
			<td>#user.getUsername()#</td>
			<td>#user.getDisplayLastLogin()#</td>
			<td>#user.getUserType()#</td>
			<td class="center">
				<input type="button" onclick="removeUser('#user.getUserID()#')" value="Delete"
					   <cfif rc.oUser.getUserID() eq user.getUserID()>disabled="disabled" title="Cannot delete yourself!"</cfif> />
			</td>
		</tr>
		</cfloop>
	</tbody>
</table>
</form>
</cfoutput>