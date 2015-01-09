/**
*********************************************************************************
* Copyright Since 2005 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
* www.coldbox.org | www.luismajano.com | www.ortussolutions.com
********************************************************************************
*/
component {

	// Module Properties
	this.title 				= "ColdBox Debugger";
	this.author 			= "Curt Gratz";
	this.webURL 			= "http://www.coldbox.org";
	this.description 		= "The ColdBox Debugger Module";
	this.version			= "1.0.0+00028";
	// If true, looks for views in the parent first, if not found, then in the module. Else vice-versa
	this.viewParentLookup 	= true;
	// If true, looks for layouts in the parent first, if not found, then in module. Else vice-versa
	this.layoutParentLookup = true;
	// Module Entry Point
	this.entryPoint			= "cbdebugger";
	// CF Mapping
	this.cfMapping			= "cbdebugger";
	// Model Namespace
	this.modelNamespace		= "cbdebugger";
	// Auto Map Models Directory
	this.autoMapModels		= true;

	function configure(){
		// Mixin our own methods on handlers, interceptors and views via the ColdBox UDF Library File setting
		arrayAppend( controller.getSetting( "ApplicationHelper" ), "#moduleMapping#/models/Mixins.cfm" );

		// Custom Declared Interceptors
		interceptors = [
			{ class="#moduleMapping#.interceptors.Debugger", name="debugger@cbdebugger" }
		];

		//default debugmode to false
		if( controller.getSetting( name='debugMode', defaultValue='' ) eq '' ){
			parentSettings.debugMode = false;
		}

		//default the password to something so we are secure by default
		if( controller.getSetting( name='debugPassword', defaultValue='cb:null' ) eq "cb:null" ){
			parentSettings.debugPassword = hash( getCurrentTemplatePath() );
		} else if ( len( controller.getSetting( name="debugPassword" ) ) ) {
			// hash the password into memory
			parentSettings.debugPassword = hash( controller.getSetting( name="debugPassword" ) );
		}

		//default debugging settings
		parentSettings.debuggerSettings = {
			enableDumpVar = true,
			persistentRequestProfiler = true,
			maxPersistentRequestProfilers = 10,
			maxRCPanelQueryRows = 50,
			showTracerPanel = true,
			expandedTracerPanel = true,
			showInfoPanel = true,
			expandedInfoPanel = true,
			showCachePanel = true,
			expandedCachePanel = false,
			showRCPanel = true,
			expandedRCPanel = false,
			showModulesPanel = true,
			expandedModulesPanel = false,
			showRCSnapshots = false,
			wireboxCreationProfiler=false
		};
		structAppend(parentSettings.debuggerSettings, controller.getConfigSettings().coldboxConfig.getPropertyMixin("debugger","variables",structnew()), true);

	}

	function onLoad(){
		// set debug mode?
		wirebox.getInstance( "debuggerService@cbDebugger" )
			.setDebugMode( controller.getSetting( "debugMode" ) );
	}
}