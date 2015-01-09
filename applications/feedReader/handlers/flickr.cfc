component {
	property name="feedReader" inject="FeedReader@cbfeeds";

	// Default Action
	function index() {
		// Default values when there is no form submission
    	event.paramValue( "tag_list", '' );
		// Set the View To Display, after Logic
		event.setView( "flickr/empty" );
	}
	
	// Search Form Submission
	function tags() {
		event.paramValue( "search_query", '' );
		event.paramValue( "tag_list", '' );
		event.paramValue( "tag_mode", getSetting( "FlickrTags" ) );
		
		// Obtain Google Data API version 2 feed
		rc.getFlickrURL = '#getSetting("FlickrURL")#?tags=#rc.tag_list#&tagmode=#rc.tag_mode#&format=atom';
		rc.flickrdata = feedReader.readFeed( Feedurl=rc.getFlickrURL );
		// Organise data
		event.setView( "flickr/results" );
	}
	
}