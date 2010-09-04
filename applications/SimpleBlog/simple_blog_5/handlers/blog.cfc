/*
* My main blog handler
*/
component{
	
	// Dependencies
	property name="entryService"	inject="model";
	property name="commentService"	inject="model";
	property name="RSSService"		inject="model";
	
	function index(event){
		entries(event);
	}
	
	/**
	* Display blog entries
	*/
	function entries(event){
		var rc = event.getCollection();
		rc.posts = entryService.getLatestEntries();
	    event.setView("blog/entries");
	}

	/**
	* View the post
	*/
	function viewPost(event){
		var rc = event.getCollection();
		event.paramValue("id","");
		
    	// Get the entry
    	rc.oPost = entryService.get(rc.id);
		
		// Verify it just in case
		if( isNull(rc.oPost) ){
			getPlugin("MessageBox").error("The post id #rc.id# does not exist in our system.");
			setNextEvent("blog");
		}
		
    	// Set view to render
    	event.setView('blog/viewPost');
	}
	
	/**
	* Add a new comment
	*/
	function doAddComment(event){
		var rc			= event.getCollection();
		var oComment 	= commentService.new();
		
		if( NOT len(event.getTrimValue("comment")) ){
			getPlugin("MessageBox").warn("Comments needs text");
			setNextEvent(event="entry/#rc.entryID###postComments");
		}
		
		oComment.setComment( rc.comment );
		oComment.setPost( entryService.get(rc.entryID) );
		
		commentService.save( oComment );
		
		getPlugin("MessageBox").info("Comment Added!");
		setNextEvent(event="entry/#rc.entryID###postComments");
	}
	
	/**
	* Display the entries RSS feed
	*/
	function rss(event){
		var rc 		= event.getCollection();
		var feed 	= RSSService.getRSS(feedType=rc.feedType);
		event.renderData(type="plain",data=feed,contentType="text/xml");
	}
	
}
