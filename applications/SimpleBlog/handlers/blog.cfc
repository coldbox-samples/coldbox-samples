/*
* My main blog handler
*/
component{
	
	// Dependencies
	property name="entryService"	inject="model";
	property name="commentService"	inject="model";
	property name="RSSService"		inject="model";
	property name="MessageBox"		inject="MessageBox@cbmessagebox";
	
	function index(){
		runEvent( 'blog.entries' );
	}
	
	/**
	* Display blog entries
	*/
	function entries(){
		rc.posts = entryService.getLatestEntries();
	    event.setView("blog/entries");
	}

	/**
	* View the post
	*/
	function viewPost(){
		event.paramValue("id","");
		
    	// Get the entry
    	rc.oPost = entryService.get(rc.id);
		
		// Verify it just in case
		if( isNull(rc.oPost) ){
			MessageBox.error("The post id #rc.id# does not exist in our system.");
			setNextEvent("blog");
		}
		
    	// Set view to render
    	event.setView('blog/viewPost');
	}
	
	/**
	* Add a new comment
	*/
	function doAddComment(){
		var oComment 	= commentService.new();
		
		if( NOT len(event.getTrimValue("comment")) ){
			
			// flash variables, so user does not retype
			var data = {
				author = rc.author,
				authorEmail = rc.authorEmail,
				authorURL = rc.authorURL,
				comment = rc.comment
			};
			flash.putAll(data);
			
			MessageBox.warn("Please enter all required fields");
			setNextEvent(event="entry/#rc.entryID###postComments");
		}
		
		// po pulate comment
		populateModel( oComment );
		oComment.setPost( entryService.get(rc.entryID) );
		
		// save comment
		commentService.save( oComment );
		
		MessageBox.info("Comment Added!");
		setNextEvent(event="entry/#rc.entryID###postComments");
	}
	
	/**
	* Display the entries RSS feed
	*/
	function rss(){
		var feed 	= RSSService.getRSS(feedType=rc.feedType);
		event.renderData(type="plain",data=feed,contentType="text/xml");
	}
	
}
