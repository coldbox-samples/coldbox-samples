<cfcomponent name="Product" extends="coldbox.system.EventHandler" output="false">

	<cffunction name="Products" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<!--- Set the View To Display, after Logic --->
		<cfset Event.setView("product/List")>
	</cffunction>

</cfcomponent>