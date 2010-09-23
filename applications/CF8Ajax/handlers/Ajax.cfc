<!-----------------------------------------------------------------------
********************************************************************************
Copyright 2005-2007 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
www.coldboxframework.com | www.luismajano.com | www.ortussolutions.com
********************************************************************************

Author     :	Sana Ullah, Curt Gratz
Date        :	Sept 23 2010
Description :
	This proxy is an inherited coldbox remote proxy used for enabling
	coldbox as a model framework.
----------------------------------------------------------------------->
<cfcomponent name="Ajax" extends="coldbox.system.EventHandler" output="false">
	
	<!--- This init format is mandatory if you are writing init code else is optional, include the super.init(arguments.controller). ---> 
	<cffunction name="init" access="public" returntype="any" output="false">
		<cfargument name="controller" type="any">
		<cfset super.init(arguments.controller)>
		<!--- Any constructor code here --->
		<cfreturn this>
	</cffunction>

	<cffunction name="dspHome" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<!--- Do Your Logic Here to prepare a view --->
		<cfset Event.setValue("welcomeMessage","Welcome to ColdBox!")>	
		<!--- Set the View To Display, after Logic --->
		<cfset Event.setView("ajax/AjaxHome")>
	</cffunction>
	
	<!--- CFGRID example --->
	<cffunction name="dspGrid" access="public" returntype="any" output="false">
		<cfargument name="Event" type="any">
		<!--- Do Your Logic Here to prepare a view --->
		<cfset Event.setValue("welcomeMessage","Welcome to ColdBox and CF8 CFGRID!")>
		<!--- Set the View To Display, after Logic --->
		<cfset Event.setView("ajax/CFGrid")>
	</cffunction>
	
	<!--- CFINPUT Auto Suggest example --->
	<cffunction name="dspCFInput" access="public" returntype="any" output="false">
		<cfargument name="Event" type="any">
		<!--- Do Your Logic Here to prepare a view --->
		<cfset Event.setValue("welcomeMessage","Welcome to ColdBox and CF8 CFINPUT Aut-Suggest!")>
		<!--- Set the View To Display, after Logic --->
		<cfset Event.setView("ajax/CFinputAutoSuggest")>
	</cffunction>
	
	<!--- cfselect with bind --->
	<cffunction name="dspSelectBind" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<!--- Set the View To Display, after Logic --->
		<cfset Event.setView("ajax/SelectBind")>
	</cffunction>
	
	<!--- cflayout with tabs --->
	<cffunction name="dspTabLayout" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<!--- Set the View To Display, after Logic --->
		<cfset Event.setView("ajax/TabLayout")>
	</cffunction>
	
	<!--- tab1 content --->
	<cffunction name="dspTab1" access="public" returntype="string" output="false">
		<cfargument name="Event" type="any">
		<!--- Set the View To Display, after Logic --->
		<!--- no debuggin panel --->
		<cfset Event.showdebugpanel(false)  />
		<!--- just set view name without any layout --->
		<cfset Event.setView(name = 'ajax/Tab1',noLayout = true) />
		<!--- render directly to browser --->
		<cfreturn renderView('ajax/Tab1') /> 
	</cffunction>
	
	<!--- tab2 content --->
	<cffunction name="dspTab2" access="public" returntype="any" output="false">
		<cfargument name="Event" type="any">
		<!--- no debuggin panel --->
		<cfset Event.showdebugpanel(false)  />
		<!--- set view without any layout --->
		<cfset Event.setView(name = 'ajax/Tab2',noLayout = true) />
		<!--- send back to proxy --->
		<cfreturn renderView('ajax/Tab2') />
	</cffunction>
	
	<!--- display ajax example (html data) --->
	<cffunction name="dspHtmlEvent" access="public" returntype="any" output="false">
		<cfargument name="Event" type="any">
		<cfset Event.setView("ajax/HtmlWithEvent")>
	</cffunction>
	<!--- send back html data --->
	<cffunction name="doHtmlEvent" access="public" returntype="any" output="false">
		<cfargument name="Event" type="any">
		<!--- no debuggin panel --->
		<cfset Event.showdebugpanel(false)  />
		<!--- set view without any layout --->
		<cfset Event.setView(name = 'ajax/Tab2',noLayout = true) />
		<!--- send back to proxy --->
		<cfreturn renderView('ajax/Tab2') />
	</cffunction>
	
	<!--- CFAJAXPROXY feature... using client side javascript  --->
	<cffunction name="dspAjaxProxy" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		
		<!--- Do Your Logic Here to prepare a view --->
		<cfset Event.setValue("welcomeMessage","Welcome to ColdBox and CF8 Ajax Proxy feature!")>	
		<!--- Set the View To Display, after Logic --->
		<cfset Event.setView("ajax/CFAjaxProxy")>
	</cffunction>
	
		<!--- login form --->
	<cffunction name="dspLogin" access="public" returntype="void" output="false">
		<cfargument name="Event" type="any">
		<!--- Set the View To Display, after Logic --->
		<cfset Event.setView("ajax/LoginForm")>
	</cffunction>
	
</cfcomponent>
