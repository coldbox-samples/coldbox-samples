/*
* Main ColdBox Handler
*/
component singleton{

	property name="securityService" inject="model";

	function onAppInit(){
	}
	
	function onRequestStart(){
		
		rc.oUser = securityService.getUserSession();
		
		event.paramValue("pageTitle","Simple Blog ORM Style");
	}
	
	function home(){
		rc.welcomeMessage = "Hello, welcome to Simple Blog!";
		event.setView("main/home");
	}
}
