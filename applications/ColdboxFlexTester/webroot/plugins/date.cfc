<cfcomponent name="date" output="false" extends="coldbox.system.Plugin">

	<cffunction name="init" access="public" returntype="any" output="false">
		<cfargument name="controller" type="any">
		<cfset super.init(arguments.controller) />
		<cfreturn this>
	</cffunction>
	
	<cffunction name="getToday" access="public" returntype="string"  output="false">
		<cfreturn dateFormat(now(),"MM/DD/YYYY")>
	</cffunction>

</cfcomponent>