<cfcomponent name="User" extends="coldbox.system.EventHandler" output="false">

	<cffunction name="users" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = Event.getCollection() />
		<cfset rc.users = getPlugin("IOC").getBean("UserManager").getUsers() />

		<cfset rc.xehView = 'admin.User.user'>
		<cfset rc.xehEdit = 'admin.User.editUser'>
		<cfset rc.xehDelete = 'admin.User.delUser'>

		<cfset Event.setView("user/list")>
	</cffunction>

	<cffunction name="editUser" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = Event.getCollection() />
		<!--- No user object in Event Collection? (Will exist after validation) --->
		<cfif not isDefined("rc.user")>
			<cfset rc.user = getPlugin("IOC").getBean("UserManager").getUser( Event.getValue("userId","") ) />
		</cfif>
		<cfset rc.userTypes = getPlugin("IOC").getBean("UserManager").getUserTypes()>
		<!--- EXIT EVENT HANDLERS: --->
		<cfset rc.xehSave = "admin.User.doSaveUser">
		<cfset rc.xehBack = "admin.User.Users">

		<cfset Event.setView("user/edit")>
	</cffunction>

	<cffunction name="user" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = Event.getCollection() />
		<!--- No user object passed? --->
		<cfif not isDefined("rc.user")>
			<cfset rc.user = getPlugin("IOC").getBean("UserManager").getUser( Event.getValue("userId","") ) />
		</cfif>
		<!--- EXIT EVENT HANDLERS: --->
		<cfset rc.xehEdit = "admin.User.editUser">
		<cfset rc.xehBack = "admin.User.Users">
		<cfset Event.setView("user/view")>
	</cffunction>

	<cffunction name="doSaveUser" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">

		<cfset var isValidationError  = 0>
		<cfset var userType = getPlugin("IOC").getBean("UserManager").getUserType( Event.getValue("userTypeId") )>
		<cfset var newPassword = Event.getValue("newPassword")>
		<cfset var confirmPassword = Event.getValue("confirmPassword")>
		<cfset var rc = Event.getCollection() />
		<cfset rc.user = getPlugin("IOC").getBean("UserManager").getUser( Event.getValue("userId","") ) />

		<!--- PopulateBean --->
		<cfset getPlugin("BeanFactory").populateBean(rc.user)>
		<cfset rc.user.setUserType(userType)>

		<!--- Password? --->
		<cfif newPassword neq "" and newPassword eq confirmPassword>
			<cfset rc.user.setPassword(newPassword)>
		<cfelseif newPassword neq "" and newPassword neq confirmPassword>
			<cfset getPlugin("MessageBox").setMessage("error", "Validation error: Passwords are not equal")>
			<cfset isValidationError  = 1>
		</cfif>

		<!--- Validation Error? --->
		<cfif isValidationError>
			<cfset editUser(Event)>
		<cfelse>
			<cfset getPlugin("IOC").getBean("UserManager").saveUser(rc.user)>
			<cfset setNextEvent("admin.User.Users")>
		</cfif>

	</cffunction>

	<cffunction name="delUser" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">

		<cfset var rc = Event.getCollection() />
		<cfset rc.user = getPlugin("IOC").getBean("UserManager").getUser( Event.getValue("userId","") ) />
		<cfset rc.xehDelete = "admin.User.doDelUser">
		<cfset rc.xehBack = "admin.User.Users">
		<cfset Event.setView("user/view")>
	</cffunction>

	<cffunction name="doDelUser" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">

		<cfset var rc = Event.getCollection() />
		<cfset rc.user = getPlugin("IOC").getBean("UserManager").getUser( Event.getValue("userId","") ) />
		<cfset getPlugin("IOC").getBean("UserManager").deleteUser( rc.user ) />

		<cfset setNextEvent("admin.User.Users")>
	</cffunction>

	<cffunction name="readByProperty" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">

		<cfset var rc = Event.getCollection() />
		<cfset rc.user = getPlugin("IOC").getBean("UserManager").getUserByUserName( Event.getValue("userName","") ) />
		<cfset runEvent(Event)>

	</cffunction>

</cfcomponent>