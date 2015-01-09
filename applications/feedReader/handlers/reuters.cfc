component {
	property name="feedReader" inject="FeedReader@cbfeeds";

	// Default Action
	function index() {
		
		// Set the View To Display, after Logic
		event.setView( "reuters/empty" );
	}
	
	// Search Form Submission
	function list() {
		// Obtain Reuters Top News feed
		rc.getReutersURL = '#getSetting( "ReutersURL" )#?format=xml';
		rc.rdata = feedReader.readFeed( Feedurl=rc.getReutersURL,itemsType="query" );
		// Organise data
		event.setView("reuters/results");
	}
	
}