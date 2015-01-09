component {
	
	// This appender is part of a module, so we need to register it after the modules have been loaded.
	function afterConfigurationLoad() {
		var logBox = controller.getLogBox();
		logBox.registerAppender( 'tracer', 'cbdebugger.includes.appenders.ColdBoxTracerAppender' );
		var appenders = logBox.getAppendersMap( 'tracer' );
		
		// Register the appender with the root loggger, and turn the logger on.
		var root = logBox.getRootLogger();
		root.addAppender( appenders['tracer'] );
		root.setLevelMax( 4 );
		root.setLevelMin( 0 );
	}
	
}