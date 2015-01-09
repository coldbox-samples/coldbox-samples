component {

	// Module Properties
	this.title 				= "ColdBox Storages";
	this.author 			= "Luis Majano";
	this.webURL 			= "http://www.ortussolutions.com";
	this.description 		= "Provides a collection of facade storages for ColdFusion";
	this.version			= "1.0.0+00030";
	// If true, looks for views in the parent first, if not found, then in the module. Else vice-versa
	this.viewParentLookup 	= true;
	// If true, looks for layouts in the parent first, if not found, then in module. Else vice-versa
	this.layoutParentLookup = true;
	// Module Entry Point
	this.entryPoint			= "cbstorages";
	// Module Entry Point
	this.cfmapping			= "cbstorages";

	function configure(){
		var settings = controller.getConfigSettings();
		// parse parent settings
		parseParentSettings();
	}

	/**
	* Fired when the module is registered and activated.
	*/
	function onLoad(){

	}

	/**
	* Fired when the module is unregistered and unloaded
	*/
	function onUnload(){

	}

	/**
	* parse parent settings
	*/
	private function parseParentSettings(){
		var oConfig 		= controller.getSetting( "ColdBoxConfig" );
		var configStruct 	= controller.getConfigSettings();
		var storagesDSL 	= oConfig.getPropertyMixin( "storages", "variables", structnew() );

		//defaults
		configStruct.storages = {
			// If using the cluster storage, this is the cluster key app name to use
			clusterStorage = {
				clusterAppName = "MyApp"
			},
			// Cookie Storage settings
			cookieStorage = {
				useEncryption 	= false,
				encryptionSeed 	= "CBStorages",
				encryptionAlgorithm = "CFMX_COMPAT",
				encryptionEncoding = "HEX"
			}
		};

		// incorporate settings
		structAppend( configStruct.storages, storagesDSL, true );

	}

}