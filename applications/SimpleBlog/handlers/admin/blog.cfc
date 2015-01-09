/**
* My Administrator handler
*/
component{

	// Dependencies
	property name="entryService" 	inject="model";
	property name="commentService" 	inject="model";
	property name="userService"		inject="model";
	property name="MessageBox"		inject="MessageBox@cbmessagebox";

	// pre handler
	function preHandler(){
		rc.xehBlogAdmin 	= "admin.blog";
		rc.xehBlogEditor 	= "admin.blog.editor";
	}
	
	// index
	function index(){
		// Get only the latest 10 posts to display in the admin dashboard.
		rc.posts 	= entryService.list(sortOrder="time desc",max=10,asQuery=false);
		rc.comments = commentService.list(sortOrder="time desc",max=10,asQuery=false);
		event.setView("admin/blog/index");
	}

	// blog editor
	function editor(){
		
		// get new or persisted post
		rc.oPost  = entryService.get( event.getValue("entryID",0) );
		// get all users for authors
		rc.qUsers = userService.list(sortOrder="lastName asc");
		
		event.setView("admin/blog/postEditor");
	}	

	// savePost
	function savePost(){
		var oPost = populateModel( entryService.get(id=rc.entryID) );
    	
		oPost.setUser( userService.get(rc.userID) );
		entryService.save( oPost );
		
		getCache("template").clearAllEvents(async=false);
    	MessageBox.setMessage("info","Entry saved!");
		setNextEvent(rc.xehBlogAdmin);
	}
	
	// remove post
	function removePost() {
		var oPost = entryService.get(rc.entryID);
    	
		if( isNull(oPost) ){
			MessageBox.setMessage("warning","Invalid entry!");
			setNextEvent(rc.xehBlogAdmin);
		}
		
		entryService.delete( oPost );
		MessageBox.setMessage("info","Entry Removed!");
		setNextEvent(rc.xehBlogAdmin);
	}
	
	// remove comment
	function removeComment(){
		var oComment = commentService.get(rc.commentID);
    	
		if( isNull(oComment) ){
			MessageBox.setMessage("warning","Invalid comment!");
			setNextEvent(rc.xehBlogAdmin);
		}
		
		commentService.delete( oComment );
		MessageBox.setMessage("info","Comment Removed!");
		
		// entry ID passed, then return back to it
		if( event.valueExists("entryID") ){
			setNextEvent('entry/#rc.entryID###postComments');
		}
		// else relocate to admin
		setNextEvent(rc.xehBlogAdmin);
	}
	
}
