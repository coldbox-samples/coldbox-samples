/**
* I handle security credentials for the administrator panel
*/
component{

	// Dependencies
	property name="securityService" inject="model";

	// login form
	function login(event){
		event.setView("security/login");
	}
	
	// do login
	function doLogin(event){
		var rc = event.getCollection();
		
		event.paramValue("username","");
		event.paramValue("password","");
		
		if( securityService.isUserVerified(rc.username,rc.password) ){
			securityService.updateUserLoginTimestamp();
			setNextEvent("admin.blog");
		}
		else{
			getPlugin("MessageBox").setMessage("error","Login Failed: Please try again.");
			setNextEvent("security.login");
		}
		
	}
	
	// logout
	function doLogout(event){
		securityService.deleteUserSession();
		setNextEvent("blog");
	}
}
