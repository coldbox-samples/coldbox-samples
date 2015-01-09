component {
	property name="i18n" inject="i18n@cbi18n";
	
	function index() {
		event.setView("home");
	}

	function doChangeLocale() {
		
		//  Change User Locale
		i18n.setfwLocale( event.getValue( "locale" ) );
		
		setNextevent( 'samples' );
	}

}