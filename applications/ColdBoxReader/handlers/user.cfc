<cfcomponent name="user" extends="coldbox.system.EventHandler" output="false" autowire="true">

	<!--- Dependency Injections --->
	<cfproperty name="userService" inject="ioc" scope="instance" />

	<cffunction name="dspAccountActions" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = Event.getCollection()>
		<cfset var obj = "">
		<cfset var qry = "">

		<!--- EXIT HANDLERS: --->
		<cfset rc.xehLogout = "user.doLogout">
		<cfset rc.xehLogin = "user.dspLogin">
		<cfset rc.xehSignup = "user.dspSignUp">
		<cfset rc.xehHome = "general.dspReader">
		<cfset rc.xehAddFeed = "feed.dspAddFeed">
		<cfset rc.xehMyFeeds = "feed.dspMyFeeds">

	</cffunction>

	<cffunction name="dspLogin" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = Event.getCollection()>
		<!--- EXIT HANDLERS: ---->
		<cfset rc.xehLogin = "user.doLogin">

	</cffunction>

	<cffunction name="dspSignUp" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset var rc = Event.getCollection()>
		<!--- EXIT HANDLERS: --->
		<cfset rc.xehCreate = "user.doCreateAccount">

	</cffunction>

	<cffunction name="doCreateAccount" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfscript>
			var rc = Event.getCollection();

			var password2 = Event.getValue("password2","");
			var userService = getUserService();
			var userBean = userService.createUserBean();

			//Populate Bean From Request Collection.
			getPlugin("BeanFactory").populateBean(userBean);

			/* Validate vars */
			if ( userBean.getUserName() eq "" or userBean.getPassword() eq "" or userBean.getemail() eq ""){
				getPlugin("MessageBox").setMessage("warning", "Please enter all the account information in order to create an account.");
				setNextEvent("user.dspSignUp");
			}
			if ( compare(UserBean.getpassword(),password2) neq 0 ){
				getPlugin("MessageBox").setMessage("warning", "The passwords do not match.");
				setNextEvent("user.dspSignup");
			}

			try {
				/* Create new User */
				userService.saveUser(userBean,true);
				//set session object
				getPlugin("SessionStorage").setVar("oUserBean",userBean);
				//relocate
				setNextEvent("general.dspReader");
			}
			catch (any e) {
				getPlugin("MessageBox").setMessage("error", e.message & "<br>" & e.detail);
				dspSignUp(event);
			}
		</cfscript>
	</cffunction>

	<cffunction name="doLogin" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfscript>
			var userService = getUserService();
			var userBean = userService.createUserBean();
			var rc = Event.getCollection();

			/* Populate bean */
			getPlugin("BeanFactory").populateBean(userBean);

			/* Send For Authorization */
			userService.checkLogin(userBean);

			/* Validate Authorization */
			if (userBean.getVerified()){
				/* persist it */
				getPlugin("SessionStorage").setVar("oUserBean",userBean);
				/* Messagebox */
				getPlugin("MessageBox").setMessage("info","Welcome back to the ColdBox Reader #userBean.getusername()#!");
				setNextEvent("general.dspReader");
			}
			else{
				getPlugin("MessageBox").setMessage("error", e.message);
				setNextEvent('user.dspLogin');
			}
		</cfscript>
	</cffunction>

	<cffunction name="doLogout" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfset getPlugin("SessionStorage").deleteVar("oUserBean")>
		<cfset setNextEvent("general.dspReader")>
	</cffunction>

	<cffunction name="doNewPassword" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfscript>
			var username = Event.getValue("username","");
			var newPassword = "";
			var userService = getUserService();
			var userBean = userService.createUserBean();

			if ( username eq "" ){
				getPlugin("MessageBox").setMessage("warning", "Please enter a username to retrieve a new password.");
			}
			else{
				try {
					//Set the username
					userBean.setUsername(username);
					//Try to get Info
					userService.getUserByUsername(userBean);
					//Verify user
					if ( userBean.getUserID() neq "" ){
						/* Generate and send new pass */
						userService.generateNewPassword(userBean);
						/* mbox */
						getPlugin("MessageBox").setMessage("info", "A new password has been generated and sent to your email on file. Please log in and change your password.");
					}
					else{
						getPlugin("MessageBox").setMessage("error", "The username you entered does not exist.");
					}
				} catch (any e) {
					getPlugin("MessageBox").setMessage("error", e.message & "<br>" & e.detail);
				}
			}
			/* relocate to login */
			setNextEvent("user.dspLogin");
			return;
		</cfscript>
	</cffunction>

	<cffunction name="doUpdateProfile" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<cfscript>
			var password = Event.getValue("password","");
			var confirmpassword = Event.getValue("confirmpassword","");
			var email = Event.getValue("email","");
			var userService = getUserService();
			var userBean = userService.createUserBean();

			getPlugin("BeanFactory").populateBean(userBean);

			if ( email eq "" ){
				getPlugin("MessageBox").setMessage("warning", "Please enter an email address to update.");
			}

			if ( compare(password,confirmpassword) neq 0 ){
				getPlugin("MessageBox").setMessage("warning", "The passwords do not match. Please try again.");
			}
			try {

				userBean.setUserID(rc.oUserBean.getUserID());
				userService.saveUser(userBean);
				getPlugin("SessionStorage").setVar("oUserBean",userBean);

				getPlugin("MessageBox").setMessage("info", "Your profile has been updated successfully.");

			} catch (any e) {
				getPlugin("MessageBox").setMessage("error", e.message & "<br>" & e.detail);
			}

			/* Relocate to info */
			setNextEvent("general.dspInfo");
		</cfscript>
	</cffunction>

<!------------------------------------------ DEPENDENCIES -------------------------------------->

	<!--- Get User Service --->
	<cffunction name="getuserService" access="private" output="false" returntype="any" hint="Get userService">
		<cfreturn instance.userService/>
	</cffunction>

</cfcomponent>