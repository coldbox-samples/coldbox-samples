/*
* A tasks handler for REST services
*/
component extends="coldbox.system.EventHandler" output="false"{

	property name="taskService" inject;
	
	this.allowedMethods = {list="GET"};
	
	void function preHandler(event,currentAction) output="false"{
		var rc = event.getCollection();
		rc.return = {error=false,data="",messages=""};		
		log.debug("New REST call: #event.getCurrentRoute()#",rc);
	}
	
	void function postHandler(event,currentAction) output="false"{
		var rc = event.getCollection();
		event.renderData(data=rc.return,type=rc.format,xmlRootName="tasks");
	}
		
	void function invalid(event) output="false"{
		var rc = event.getCollection();
		rc.return.error = true;
		rc.return.messages = "Invalid REST call";
		if( NOT reFindNoCase("^(json|xml)",event.getValue("format","")) ){ 
			rc.return.messages = "Invalid format detected or not passed: #event.getValue("format","")#";
			rc.format = "xml";			
		}
	}
	
	void function onError(event,action,exception) output="false"{
		var rc = event.getCollection();
		rc.return.error = true;
		rc.return.messages = "The requested resource #event.getCurrentRoute()# produced an error. #exception.message# #exception.detail#";
		postHandler(event);
	}
	
	void function list(event) output="false"{
		var rc = event.getCollection();
		rc.return.data = taskService.findAll(event.getValue("completed","false"),true);
	}
	
	
}
