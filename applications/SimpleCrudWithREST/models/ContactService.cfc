<cfcomponent output='false' singleton>

	<!--- Dependencies --->
	<cfproperty name="dsn" inject="coldbox:datasource:mydsn">

	<!--- init --->
    <cffunction name="init" output="false" access="public" returntype="any" hint="Constructor">
    	<cfreturn this>
    </cffunction>

	<!--- list --->
    <cffunction name="list" output="false" access="public" returntype="query" hint="Return the contacts">
    	<cfset var q = "">
		
		<cfquery name="q" datasource="#dsn.name#">
		SELECT * 
		    FROM contacts
		ORDER BY name asc
		</cfquery>
    	
		<cfreturn q>
    	
    </cffunction>

	<!--- create --->
    <cffunction name="create" output="false" access="public" returntype="void" hint="">
    	<cfargument name="name"  type="string" required="true" />
		<cfargument name="email" type="string" required="true" />
    	
		<cfset var q = "">
		
		<cfquery name="q" datasource="#dsn.name#">
		INSERT INTO contacts(name,email)
		     VALUES (<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.name#">,
			 		 <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.email#">)
		</cfquery>
		
    </cffunction>
	
	<!--- remove --->
    <cffunction name="remove" output="false" access="public" returntype="any" hint="">
    	<cfargument name="id" type="any" required="true"/>
    	
    	<cfset var q = "">
		
		<cfquery name="q" datasource="#dsn.name#">
		DELETE 
		  FROM contacts
		 WHERE id = <cfqueryparam cfsqltype="cf_sql_numeric" value="#arguments.id#">
		</cfquery>
		
    </cffunction>

</cfcomponent>
