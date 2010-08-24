<cfcomponent name="Security" extends="coldbox.system.EventHandler" output="false" autowire="true">

	<cfproperty name="securityManager" inject="ioc" scope="variables">

	<cffunction name="init" access="public" returntype="any" output="false">
		<cfargument name="controller" type="any">
		<cfset super.init(arguments.controller)>
		<cfreturn this>
	</cffunction>

	<cffunction name="login" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">

		<cfset Event.setView("login/Login")>

	</cffunction>

	<cffunction name="doLogin" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">

		<!--- Process login --->
		<cfif securityManager.isUserVerified(email:Event.getValue('email',''),password:Event.getValue('password',''))>
			<!--- Which redirect? --->
			<cfswitch expression="#securityManager.getUserSession().getUserType().getName()#">
				<cfcase value="Administrator">
					<cfset setNextEvent('admin.User.Users')>
				</cfcase>
				<cfcase value="User">
					<cfset setNextEvent('user.Product.Products')>
				</cfcase>
			</cfswitch>
		<cfelse>
			<cfset getPlugin("MessageBox").setMessage("error","Invalid Logon Information. Please try again")>
			<cfset setNextEvent('Security.login')>
		</cfif>

	</cffunction>

	<cffunction name="doLogoff" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<!--- Process logoff --->
		<cfset securityManager.deleteUserSession()>
		<cfset setNextEvent('General.index')>
	</cffunction>

</cfcomponent>