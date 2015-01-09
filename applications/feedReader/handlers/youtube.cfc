component {
	property name="feedReader" inject="FeedReader@cbfeeds";
	property name="Utilities" inject="Utilities";

	// Default Action
	function index() {
		// Default values when there is no form submission
		event.paramValue( "search_query", '' );
		event.paramValue( "max_results", getSetting( "YouTubeDefaultMaxResults" ) );
		event.paramValue( "start_index", getSetting( "YouTubeDefaultStartIndex" ) );
		event.paramValue( "total_results", 0 );
		
		// Set the View To Display, after Logic
		event.setView( "youtube/empty" );
	}
	
	// Search Form Submission
	function search() {
		// Set search form defaults
		if( event.getValue( "submit", "" ) == "Submit" ) {
			event.setValue( "page",1 );
		}
		if( IsNumeric( Event.getValue( "page", "" ) ) ) {
			event.setValue( "start_index", event.getValue('page') );
		} else {
			event.setValue( "start_index", event.getValue( "start_index", getSetting( "YouTubeDefaultStartIndex" ) ) );
		}
		event.setValue( "search_query", event.getValue( "search_query", "" ) );
		event.setValue( "max_results", event.getValue( "max_results", getSetting( "YouTubeDefaultMaxResults" ) ) );
		// Page navigation modifications
		if( Event.getValue( "submit", "" ) == 'Next' ) {
			event.setValue( "start_index", ( rc.start_index + event.getValue( "max_results" ) ) );
		}
		if( event.getValue( "submit", "" ) == 'Previous' ) {
			event.setValue( "start_index", ( rc.start_index - event.getValue( "max_results" ) ) );
		}
		// Obtain Google Data API version 2 feed
		rc.getYoutubeURL = '#getSetting( "YouTubeURL" )#?q=#rc.search_query#&start-index=#rc.start_index#&max-results=#rc.max_results#&v=2';
		rc.ytdata = feedReader.readFeed( Feedurl=rc.getYoutubeURL );
		// Adjust variables values with feed data
		rc.total_pages = Ceiling( rc.ytdata.opensearch.totalresults/rc.ytdata.opensearch.itemsperpage );
		rc.total_results = rc.ytdata.opensearch.totalresults;
		rc.page = Ceiling(rc.start_index / rc.max_results);
		// Search result statistics for display
		rc.dspCurPage = numSep(rc.page);
		rc.dspTotPage = numSep(rc.total_pages);
		rc.dspResPage = numSep(rc.total_results);
		//  Organise data
		Event.setView("youtube/results");
	}

	private function numSuff( required numeric number ) {
		return Utilities.ordinalAbbr( arguments.number );
	}

	private function numSep( required numeric number ) {
		return Utilities.oneKGrouping( arguments.number );
	}
	
}