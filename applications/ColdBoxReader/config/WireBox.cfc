<!-----------------------------------------------------------------------
********************************************************************************
Copyright Since 2005 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
www.coldbox.org | www.luismajano.com | www.ortussolutions.com
********************************************************************************
Author 	 :	Luis Majano
Description :
	Your WireBox Configuration Binder
----------------------------------------------------------------------->
<cfcomponent output="false" hint="The default WireBox Injector configuration object" extends="coldbox.system.ioc.config.Binder">
<cfscript>
	
	/**
	* Configure WireBox, that's it!
	*/
	function configure(){
		
		// The WireBox configuration structure DSL
		wireBox = {
			// Scope registration, automatically register a wirebox injector instance on any CF scope
			// By default it registeres itself on application scope
			scopeRegistration = {
				enabled = true,
				scope   = "application", // server, cluster, session, application
				key		= "wireBox"
			},

			// DSL Namespace registrations
			customDSL = {
				// namespace = "mapping name"
			},
			
			// Custom Storage Scopes
			customScopes = {
				// annotationName = "mapping name"
			},
			
			// Package scan locations
			scanLocations = [],
			
			// Stop Recursions
			stopRecursions = [],
			
			// Parent Injector to assign to the configured injector, this must be an object reference
			parentInjector = "",
			
			// Register all event listeners here, they are created in the specified order
			listeners = [
				// { class="", name="", properties={} }
			]			
		};
		
		// Map Bindings below
		map("ColdboxFactory").to("coldbox.system.ioc.ColdboxFactory")
			.asSingleton()
			.noAutowire();
		map("datasourceBean").toFactoryMethod(factory="ColdBoxFactory",method="getDatasource")
			.methodArg(name="alias",value="coldboxreader")
			.asSingleton();
		map("feedReader").toFactoryMethod(factory="ColdBoxFactory",method="getPlugin")
			.methodArg(name="plugin",value="feedReader")
			.asSingleton();
		map("feedDAO").to("coldbox.samples.applications.ColdBoxReader.components.dao.feed")
			.initArg(name="dsnBean",ref="datasourceBean");
		map("feedService").to("coldbox.samples.applications.ColdBoxReader.components.services.feedService")
			.initArg(name="feedDAO",ref="feedDAO")
			.initArg(name="ModelBasePath",value=getProperty('ModelBasePath'))
			.initArg(name="feedReader",ref="feedReader")
			.asSingleton();
		map("tagDAO").to("coldbox.samples.applications.ColdBoxReader.components.dao.tags")
			.initArg(name="dsnBean",ref="datasourceBean");
		map("tagService").to("coldbox.samples.applications.ColdBoxReader.components.services.tagService")
			.initArg(name="tagDAO",ref="tagDAO")
			.initArg(name="ModelBasePath",value=getProperty('ModelBasePath'))
			.asSingleton();
		map("usersDAO").to("coldbox.samples.applications.ColdBoxReader.components.dao.users")
			.initArg(name="dsnBean",ref="datasourceBean");
		map("userBean").to("coldbox.samples.applications.ColdBoxReader.components.beans.userBean");
		map("userService").to("coldbox.samples.applications.ColdBoxReader.components.services.userService")
			.initArg(name="usersDAO",ref="usersDAO")
			.initArg(name="ModelBasePath",value=getProperty('ModelBasePath'))
			.initArg(name="OwnerEmail",value=getProperty('OwnerEmail'))
			.asSingleton();
	}	
</cfscript>
</cfcomponent>