/**
* My Administrator handler
*/
component{

	// Dependencies
	property name="securityService" inject="model";
	property name="entryService" 	inject="model";
	property name="commentService" 	inject="model";
	property name="userService"		inject="model";

	// login form
	function login(event){
		event.setView("admin/login");
	}
	
	// do login
	function doLogin(event){
		var rc = event.getCollection();
		
		event.paramValue("username","");
		event.paramValue("password","");
		
		if( securityService.isUserVerified(rc.username,rc.password) ){
			setNextEvent("admin");
		}
		else{
			getPlugin("MessageBox").setMessage("error","Login Failed: Please try again.");
			setNextEvent("admin.login");
		}
		
	}
	
	// logout
	function doLogout(event){
		securityService.deleteUserSession();
		setNextEvent("blog");
	}
	
	// index
	function index(event){
		var rc = event.getCollection();
		// Get only the latest 10 posts to display in the admin dashboard.
		rc.posts 	= entryService.list(sortOrder="time desc",max=10,asQuery=false);
		rc.comments = commentService.list(sortOrder="time desc",max=10,asQuery=false);
		event.setView("admin/index");
	}

	//new post
	function newPost(event){
		var rc = event.getCollection();
		
		rc.oPost  = entryService.new();
		rc.qUsers = userService.list(sortOrder="lastName asc");
		
		event.setView("admin/postEditor");
	}	
	//edit post
	function editPost(event){
		var rc = event.getCollection();
		
		rc.oPost  = entryService.get(rc.entryID);
		rc.qUsers = userService.list(sortOrder="lastName asc");
		
		event.setView("admin/postEditor");
	}
	
	// savePost
	function savePost(event){
		var rc = event.getCollection();
		var oPost = populateModel( entryService.get(id=rc.entryID) );
    	
		oPost.setUser( userService.get(rc.userID) );
		entryService.save( oPost );
		
		getColdboxOCM("template").clearAllEvents(async=false);
    	getPlugin("MessageBox").setMessage("info","Entry saved!");
		setNextEvent("admin");
	}
	
	// remove post
	function removePost(event){
		var rc = event.getCollection();
		var oPost = entryService.get(rc.entryID);
    	
		if( isNull(oPost) ){
			getPlugin("MessageBox").setMessage("warning","Invalid entry!");
			setNextEvent('admin');
		}
		
		entryService.delete( oPost );
		getPlugin("MessageBox").setMessage("info","Entry Removed!");
		setNextEvent('admin');
	}
	
	// remove comment
	function removeComment(event){
		var rc = event.getCollection();
		var oComment = commentService.get(rc.commentID);
    	
		if( isNull(oComment) ){
			getPlugin("MessageBox").setMessage("warning","Invalid comment!");
			setNextEvent('admin');
		}
		
		commentService.delete( oComment );
		getPlugin("MessageBox").setMessage("info","Comment Removed!");
		
		// entry ID passed, then return back to it
		if( event.valueExists("entryID") ){
			setNextEvent('entry/#rc.entryID###postComments');
		}
		// else relocate to admin
		setNextEvent("admin");
	}
	
}
