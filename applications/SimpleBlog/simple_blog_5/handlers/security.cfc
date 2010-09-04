/**
* My Administrator handler
*/
component{

	// Dependencies
	property name="securityService" inject="model";

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
}
