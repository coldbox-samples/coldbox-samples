<cfcomponent output="false">
	
	<cffunction name="index" access="public" returntype="void" output="false">
		<cfargument name="event" type="any">
		<cfset event.setView("home")>
	</cffunction>

	<cffunction name="doChangeLocale" access="public" returntype="void" output="false">
		<cfargument name="event" type="any">
		
		<!--- Change User Locale --->
		<cfset getPlugin("i18n").setfwLocale(event.getValue("locale"))>
		
		<cfset setNextevent('samples')>
	</cffunction>

</cfcomponent>