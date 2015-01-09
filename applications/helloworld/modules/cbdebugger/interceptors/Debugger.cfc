/**
* Coldbox Debugger Interecptor
*/
component extends="coldbox.system.Interceptor"{

	// DI
	property name="debuggerService" 	inject="debuggerService@cbdebugger";

	// Configure Interceptor
	function configure() {
		variables.debuggerConfig 	= controller.getSetting( "debuggerSettings" );
		variables.debuggerPassword 	= controller.getSetting( "debugPassword" );
	}

	// Before we capture.
	function onRequestCapture(event, interceptData){
		// init tracker
		request.cbdebugger = {};
		request.fwExecTime = getTickCount();
		// get reference
		var rc = event.getCollection();

		// Debug Mode Checks
		if ( structKeyExists( rc, "debugMode" ) AND isBoolean( rc.debugMode ) ){
			if ( NOT len( variables.debuggerPassword ) ){
				debuggerService.setDebugMode( rc.debugMode );
			}
			else if ( structKeyExists( rc, "debugPassword" ) AND CompareNoCase( variables.debuggerPassword, hash( rc.debugPassword ) ) eq 0 ){
				debuggerService.setDebugMode( rc.debugMode );
			}
		}

		// verify in debug mode
		if( debuggerService.getDebugMode() ){
			// call debug commands
			debuggerCommands( arguments.event );
			// panel rendering
			var debugPanel = event.getValue( "debugPanel", "" );

			switch( debugPanel ){
				case "profiler" : {
					writeOutput( debuggerService.renderProfiler() );
					break;
				}
				case "cache" : {
					//writeOutput( debuggerService.renderCachePanel() );
					break;
				}
			}
			// turn off debugger and stop
			if( len( debugPanel ) ){
				include "/cbdebugger/includes/debugoutput.cfm";
				abort;
			}
		}
	}

	//setup all the timers
	public function preProcess(event, interceptData) {
		request.cbdebugger.processHash = debuggerService.timerStart("[preProcess to postProcess] for #arguments.event.getCurrentEvent()#");
	}

	// post processing
	public function postProcess(event, interceptData) {
		var debugHTML = "";

		// end the request timer
		debuggerService.timerEnd( request.cbdebugger.processHash );
		request.fwExecTime = getTickCount() - request.fwExecTime;
		// record the profilers
		debuggerService.recordProfiler();
		// Only render if enabled, if no renderdata, and if not ajax call
		if( debuggerService.getDebugMode() AND
		 	isDebuggerRendering() AND
		 	structIsEmpty( event.getRenderData() ) AND
		 	!event.isAjax()
		){
			// render out the debugger
			debugHTML = debuggerService.renderDebugLog();
			// render out the debugger to output
			appendToBuffer( debugHTML );
		}
	}

	public function preEvent(event, interceptData) {
		request.cbdebugger.eventhash = debuggerService.timerStart("[preEvent to postEvent] for #arguments.event.getCurrentEvent()#");
	}

	public function postEvent(event, interceptData) {
		debuggerService.timerEnd(request.cbdebugger.eventhash);
	}

	public function preLayout(event, interceptData) {
		request.cbdebugger.layoutHash = debuggerService.timerStart("[preLayout to postLayout] for #arguments.event.getCurrentEvent()#");
	}

	public function postLayout(event, interceptData) {
		debuggerService.timerEnd(request.cbdebugger.layoutHash);
	}

	public function preRender(event, interceptData) {
		request.cbdebugger.renderHash = debuggerService.timerStart("[preRender to postRender] for #arguments.event.getCurrentEvent()#");
	}

	public function postRender(event, interceptData) {
		debuggerService.timerEnd(request.cbdebugger.renderHash);
	}

	public function preViewRender(event, interceptData) {
		request.cbdebugger.renderViewHash = debuggerService.timerStart("[preViewRender to postViewRender] for #arguments.event.getCurrentEvent()#");
	}

	public function postViewRender(event, interceptData) {
		debuggerService.timerEnd( request.cbdebugger.renderViewHash );
	}

	public function beforeInstanceCreation(event,interceptData){
		if( variables.debuggerConfig.wireboxCreationProfiler ){
			request.cbdebugger[ interceptData.mapping.getName( ) ] = debuggerService.timerStart("Wirebox instance creation of #interceptData.mapping.getName()#");
		}
	}

	public function afterInstanceCreation(event, interceptData){
		// so many checks, due to chicken and the egg problems
		if( variables.debuggerConfig.wireboxCreationProfiler
			and structKeyExists( request, "cbdebugger" )
			and structKeyExists( request.cbdebugger, interceptData.mapping.getName() ) ){
			debuggerService.timerEnd( request.cbdebugger[ interceptData.mapping.getName() ]);
		}
	}

	/************************************** PRIVATE METHODS *********************************************/

	/**
	* Debugger Commands
	*/
	private function debuggerCommands( event ){
		var command = event.getTrimValue( "cbox_command","" );

		// Verify command
		if( NOT len( command ) ){ return; }

		// Commands
		switch( command ){
			// Module Commands
			case "reloadModules"  : { controller.getModuleService().reloadAll(); break;}
			case "unloadModules"  : { controller.getModuleService().unloadAll(); break;}
			case "reloadModule"   : { controller.getModuleService().reload( event.getValue( "module", "" ) ); break;}
			case "unloadModule"   : { controller.getModuleService().unload( event.getValue( "module", "" ) ); break;}
			default: return;
		}

		// relocate to correct panel
		if( event.getValue( "debugPanel", "" ) eq "" ){
			setNextEvent( URL="#listlast(cgi.script_name,"/")#", addtoken=false );
		} else {
			setNextEvent( URL="#listlast(cgi.script_name,"/")#?debugpanel=#event.getValue('debugPanel','')#", addtoken=false );
		}
	}

}