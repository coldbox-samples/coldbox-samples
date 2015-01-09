<cfoutput>
<div id="fisheye" class="fisheye"> 	
	<div class="fisheyeContainer">
		<a href="#event.buildLink(getSetting('defaultEvent'))#" class="fisheyeItem"><img src="includes/images/Home.png" width="80"><span>Home</span></a>
		<a href="#event.buildLink('blog')#" class="fisheyeItem"><img src="includes/images/Edit.png" width="80"><span>Blog</span></a>
		<a href="#event.buildLink('admin.blog')#" class="fisheyeItem"><img src="includes/images/Control-Panel.png" width="80"><span>Admin</span></a>
		<!--- if logged in, show only --->
		<cfif rc.oUser.isAdmin()>
		<a href="#event.buildLink('admin.users')#" class="fisheyeItem"><img src="includes/images/user.png" width="80"><span>Users</span></a>
		<a href="#event.buildLink('security.doLogout')#" class="fisheyeItem"><img src="includes/images/logout.png" width="80"><span>Logout</span></a>
		</cfif>
	</div>
</div>
</cfoutput>
