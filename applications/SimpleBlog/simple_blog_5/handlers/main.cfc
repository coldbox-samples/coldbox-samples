/*
* Main ColdBox Handler
*/
component singleton{

	property name="securityService" inject="model";

	function onAppInit(event){
	}
	
	function onRequestStart(event){
		var rc = event.getCollection();
		
		rc.oUser = securityService.getUserSession();
		
		event.paramValue("pageTitle","Simple Blog ORM Style");
	}
	
	function home(event){
		var rc = event.getCollection();
		rc.welcomeMessage = "Hello, welcome to Simple Blog!";
		event.setView("main/home");
	}
}
