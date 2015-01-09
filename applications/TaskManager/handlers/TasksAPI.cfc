/*
* A tasks handler for REST services
*/
component {

	property name="taskService" inject="entityService:Task";
	
	this.allowedMethods = {list="GET"};
	
	function preHandler(event,currentAction) {
		rc.return = {error=false,data="",messages=""};		
		log.debug("New REST call: #event.getCurrentRoute()#",rc);
	}
	
	function postHandler(event,currentAction) {
		var rc = event.getCollection();
		event.renderData(data=rc.return,type=rc.format,xmlRootName="tasks");
	}
		
	function invalid() {
		rc.return.error = true;
		rc.return.messages = "Invalid REST call";
		if( NOT reFindNoCase("^(json|xml)",event.getValue("format","")) ){ 
			rc.return.messages = "Invalid format detected or not passed: #event.getValue("format","")#";
			rc.format = "xml";			
		}
	}
	
	function onError(event,action,exception) {
		rc.return.error = true;
		rc.return.messages = "The requested resource #event.getCurrentRoute()# produced an error. #exception.message# #exception.detail#";
		postHandler(event);
	}
	
	function list() {
		
		rc.return.data = taskService.list(criteria={isCompleted=event.getValue("completed",false)},asQuery=true);
	}
	
	
}
