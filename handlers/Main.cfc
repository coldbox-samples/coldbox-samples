<cfcomponent output="false">

	<cffunction name="index" access="public" returntype="void" output="false">
		<cfargument name="event" type="any">
		<cfset event.setView("main/index")>
	</cffunction>

	<cffunction name="doChangeLocale" access="public" returntype="void" output="false">
		<cfargument name="event" type="any">

		<!--- Change User Locale --->
		<cfset setfwLocale(event.getValue("locale"))>

		<cfset setNextevent('main')>
	</cffunction>

</cfcomponent>