/**
* My Administrator handler
*/
component{

	// Dependencies
	property name="userService"		inject="model";
	property name="MessageBox"		inject="MessageBox@cbmessagebox";

	// pre handler
	function preHandler(){
		rc.xehUsers 		= "admin.users";
		rc.xehUserEditor 	= "admin.users.editor";
	}
	
	// index
	function index(){
		rc.users = userService.list(sortOrder="lastName desc",asQuery=false);
		event.setView("admin/users/index");
	}

	// user editor
	function editor(){
		
		// get new or persisted post
		rc.user  = userService.get( event.getValue("userID",0) );
		
		event.setView("admin/users/userEditor");
	}	

	// save user
	function save(){
		var oUser = populateModel( userService.get(id=rc.userID) );
    	
		userService.save( oUser );
		
		MessageBox.setMessage("info","User saved!");
		setNextEvent(rc.xehUsers);
	}
	
	// remove user
	function remove(){
		var oUser 	= userService.get(rc.userID);
    	
		if( isNull(oUser) ){
			MessageBox.setMessage("warning","Invalid user detected!");
			setNextEvent(rc.xehUsers);
		}
		
		userService.delete( oUser );
		MessageBox.setMessage("info","User Removed!");
		setNextEvent(rc.xehUsers);
	}
}
