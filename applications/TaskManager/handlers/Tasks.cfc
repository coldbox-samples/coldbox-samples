/*
* A tasks handler
*/
component extends="coldbox.system.EventHandler" output="false"{

	property name="taskService" inject="entityService:Task";

	void function index(event) output=false{
		var rc = event.getCollection();
		var isComplete = false;

		event.paramValue("status","active");
		if( rc.status eq "completed"){ isComplete = true; }

		rc.tasks = taskService.findAllWhere({isCompleted=isComplete});

		event.setView("Tasks/index");
	}	void function remove(event) output=false{
		var rc = event.getCollection();

		taskService.deleteByID(event.getValue("taskID",""));

		flash.put("message","Task removed sucessfully!");

		setNextEvent('tasks');
	}	void function editor(event) output=false{
		var rc = event.getCollection();

		if( event.valueExists("taskID") ){
			rc.task = taskService.get(rc.taskID);
		}
		else{
			rc.task = taskService.new();
		}

		event.setView("Tasks/editor");
	}	void function save(event) output=false{
		var rc = event.getCollection();

		if( len(event.getTrimValue("taskID")) ){
			rc.task = taskService.get(rc.taskID);
		}
		else{
			rc.task = taskService.new();
		}
		populateModel(rc.task);
		taskService.save(rc.task);

		flash.put("message","Task saved sucessfully!");

		setNextEvent('tasks');
	}	void function changeStatus(event) output=false{
		var rc = event.getCollection();

		try{
			rc.task = taskService.get(event.getValue("taskID",""));
			rc.task.setIsCompleted(rc.completed);
			taskService.save(rc.task);
			rc.data = {error=false,message="Status Changed!"};
		}
		catch(Any e){
			rc.data = {error=true,message=e.message & e.detail};
		}
		event.renderData(data=rc.data,type="json");
	}

	void function feed(event) output=false cache="true" cacheTimeout="10"{
		var isComplete = false;
		var rc = event.getCollection();

		event.paramValue("status","active");
		if( rc.status eq "completed"){ isComplete = true; }

		rc.tasks = taskService.list({isCompleted=isComplete});

		rc.feed = {description="My awesome tasks feed, showing all #rc.status# tasks",
				   link="#event.buildLink('tasks')#",
				   title="Tasks Feed",
				   items=rc.tasks,
				   pubdate=now()};

		rc.map = {description="notes",title="subject",pubdate="createDate"};
		rc.feedXML = getPlugin("FeedGenerator").createFeed(rc.feed,rc.map);

		event.renderData(data=rc.feedXML,contentType="text/xml");
	}
}
