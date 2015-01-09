component {

	// Module Properties
	this.title 				= "ColdBox SOAP";
	this.author 			= "Luis Majano";
	this.webURL 			= "http://www.ortussolutions.com";
	this.description 		= "A nice module to help you interact with SOAP web services";
	this.version			= "1.0.0+00027";
	// If true, looks for views in the parent first, if not found, then in the module. Else vice-versa
	this.viewParentLookup 	= true;
	// If true, looks for layouts in the parent first, if not found, then in module. Else vice-versa
	this.layoutParentLookup = true;
	// Module Entry Point
	this.entryPoint			= "cbsoap";
	// CF mapping
	this.cfmapping			= "cbsoap";

	function configure(){
		// Register Custom DSL, don't map it because it is too late, mapping DSLs are only good by the parent app
		controller.getWireBox().registerDSL( namespace="webservice", path="#moduleMapping#.models.WebservicesDSL" );
	}

	/**
	* Fired when the module is registered and activated.
	*/
	function onLoad(){
		// parse parent settings
		parseParentSettings();
	}

	/**
	* Fired when the module is unregistered and unloaded
	*/
	function onUnload(){

	}

	/**
	* Prepare settings and returns true if using i18n else false.
	*/
	private function parseParentSettings(){
		var oConfig 		= controller.getSetting( "ColdBoxConfig" );
		var configStruct 	= controller.getConfigSettings();
		var webservices		= oConfig.getPropertyMixin( "webservices", "variables", structnew() );

		// default
		configStruct.webservices = {};

		// Incorporate settings
		structAppend( configStruct.webservices, webservices, true );
	}

}