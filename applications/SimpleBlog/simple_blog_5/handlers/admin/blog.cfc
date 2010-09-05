/**
* My Administrator handler
*/
component{

	// Dependencies
	property name="entryService" 	inject="model";
	property name="commentService" 	inject="model";
	property name="userService"		inject="model";

	// pre handler
	function preHandler(event,action){
		var rc = event.getCollection();
		rc.xehBlogAdmin 	= "admin.blog";
		rc.xehBlogEditor 	= "admin.blog.editor";
	}
	
	// index
	function index(event){
		var rc = event.getCollection();
		// Get only the latest 10 posts to display in the admin dashboard.
		rc.posts 	= entryService.list(sortOrder="time desc",max=10,asQuery=false);
		rc.comments = commentService.list(sortOrder="time desc",max=10,asQuery=false);
		event.setView("admin/blog/index");
	}

	// blog editor
	function editor(event){
		var rc = event.getCollection();
		
		// get new or persisted post
		rc.oPost  = entryService.get( event.getValue("entryID",0) );
		// get all users for authors
		rc.qUsers = userService.list(sortOrder="lastName asc");
		
		event.setView("admin/blog/postEditor");
	}	

	// savePost
	function savePost(event){
		var rc = event.getCollection();
		var oPost = populateModel( entryService.get(id=rc.entryID) );
    	
		oPost.setUser( userService.get(rc.userID) );
		entryService.save( oPost );
		
		getColdboxOCM("template").clearAllEvents(async=false);
    	getPlugin("MessageBox").setMessage("info","Entry saved!");
		setNextEvent(rc.xehBlogAdmin);
	}
	
	// remove post
	function removePost(event){
		var rc = event.getCollection();
		var oPost = entryService.get(rc.entryID);
    	
		if( isNull(oPost) ){
			getPlugin("MessageBox").setMessage("warning","Invalid entry!");
			setNextEvent(rc.xehBlogAdmin);
		}
		
		entryService.delete( oPost );
		getPlugin("MessageBox").setMessage("info","Entry Removed!");
		setNextEvent(rc.xehBlogAdmin);
	}
	
	// remove comment
	function removeComment(event){
		var rc = event.getCollection();
		var oComment = commentService.get(rc.commentID);
    	
		if( isNull(oComment) ){
			getPlugin("MessageBox").setMessage("warning","Invalid comment!");
			setNextEvent(rc.xehBlogAdmin);
		}
		
		commentService.delete( oComment );
		getPlugin("MessageBox").setMessage("info","Comment Removed!");
		
		// entry ID passed, then return back to it
		if( event.valueExists("entryID") ){
			setNextEvent('entry/#rc.entryID###postComments');
		}
		// else relocate to admin
		setNextEvent(rc.xehBlogAdmin);
	}
	
}
