/**
* My Administrator handler
*/
component{

	// Dependencies
	property name="userService"		inject="model";

	// pre handler
	function preHandler(event,action){
		var rc = event.getCollection();
		rc.xehUsers 		= "admin.users";
		rc.xehUserEditor 	= "admin.users.editor";
	}
	
	// index
	function index(event){
		var rc = event.getCollection();
		rc.users = userService.list(sortOrder="lastName desc",asQuery=false);
		event.setView("admin/users/index");
	}

	// user editor
	function editor(event){
		var rc = event.getCollection();
		
		// get new or persisted post
		rc.user  = userService.get( event.getValue("userID",0) );
		
		event.setView("admin/users/userEditor");
	}	

	// save user
	function save(event){
		var rc = event.getCollection();
		var oUser = populateModel( userService.get(id=rc.userID) );
    	
		userService.save( oUser );
		
		getPlugin("MessageBox").setMessage("info","User saved!");
		setNextEvent(rc.xehUsers);
	}
	
	// remove user
	function remove(event){
		var rc 		= event.getCollection();
		var oUser 	= userService.get(rc.userID);
    	
		if( isNull(oUser) ){
			getPlugin("MessageBox").setMessage("warning","Invalid user detected!");
			setNextEvent(rc.xehUsers);
		}
		
		userService.delete( oUser );
		getPlugin("MessageBox").setMessage("info","User Removed!");
		setNextEvent(rc.xehUsers);
	}
}
