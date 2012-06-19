<cfcomponent output="false" hint="Manage contacts">

	<!--- Inject Dependencies --->
	<cfproperty name="ContactService" inject="model">

<!------------------------------------------- PUBLIC EVENTS ------------------------------------------>
	
	<cffunction name="index" output="false" hint="index">
		<cfargument name="event">
		<cfset list(arguments.event)>
	</cffunction>

	<cffunction name="list" output="false" hint="list">
		<cfargument name="event">
		<cfset var rc = event.getCollection()>
		
		<cfset rc.qContacts = contactService.list()>
		
		<cfset event.setView("Contacts/list")>
	</cffunction>	<cffunction name="add" output="false" hint="add">
		<cfargument name="event">
		<cfset var rc = event.getCollection()>
		
		<cfset event.setView("Contacts/add")>
	</cffunction>	<cffunction name="createContact" output="false" hint="createContact">
		<cfargument name="event">
		<cfset var rc = event.getCollection()>
		
		<cfset event.paramValue("name","")>
		<cfset event.paramValue("email","")>
		
		<!--- Verify contact info --->
		<cfif NOT len(rc.name) OR NOT len(rc.email)>
			<cfset getPlugin("MessageBox").warn("Please enter a value for email and/or name")>
			<cfset setNextEvent("contacts.add")>
		</cfif>
		
		<!--- Create Contact --->
		<cfset contactService.create(rc.name,rc.email)>
		
		<cfset getPlugin("MessageBox").info("Contact Created!")>
		<cfset setNextEvent("contacts.list")>
	</cffunction>	<cffunction name="delete" output="false" hint="delete">
		<cfargument name="event">
		<cfset var rc = event.getCollection()>
		
		<cfset event.paramValue("id","")>
		
		<!--- Remove Contact --->
		<cfset contactService.remove( rc.id )>
		
		<cfset getPlugin("MessageBox").info("Contact Removed!")>
		<cfset setNextEvent("contacts.list")>
	</cffunction>
<!------------------------------------------- PRIVATE EVENTS ------------------------------------------>

</cfcomponent>