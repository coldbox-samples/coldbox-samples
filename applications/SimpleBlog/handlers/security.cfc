/**
* I handle security credentials for the administrator panel
*/
component{

	// Dependencies
	property name="securityService" inject="model";
	property name="MessageBox"		inject="MessageBox@cbmessagebox";

	// login form
	function login(){
		event.setView("security/login");
	}
	
	// do login
	function doLogin(){
		
		event.paramValue("username","");
		event.paramValue("password","");
		
		if( securityService.isUserVerified(rc.username,rc.password) ){
			securityService.updateUserLoginTimestamp();
			setNextEvent("admin.blog");
		}
		else{
			MessageBox.setMessage("error","Login Failed: Please try again.");
			setNextEvent("security.login");
		}
		
	}
	
	// logout
	function doLogout(){
		securityService.deleteUserSession();
		setNextEvent("blog");
	}
}
