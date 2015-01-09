/*
* A tasks handler
*/
component {

	property name="taskService" inject="entityService:Task";
	property name="FeedGenerator" inject="FeedGenerator@cbfeeds";
	

	function index() {
		var isComplete = false;

		event.paramValue("status","active");
		if( rc.status eq "completed"){ isComplete = true; }

		rc.tasks = taskService.findAllWhere({isCompleted=isComplete});

		event.setView("Tasks/index");
	}	function remove() {
		taskService.deleteByID(event.getValue("taskID",""));

		flash.put("message","Task removed sucessfully!");

		setNextEvent('tasks');
	}	function editor() {
		if( event.valueExists("taskID") ){
			rc.task = taskService.get(rc.taskID);
		}
		else{
			rc.task = taskService.new();
		}

		event.setView("Tasks/editor");
	}	function save() {
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
	}	function changeStatus() {
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

	function feed()  cache="true" cacheTimeout="10"{
		var isComplete = false;
		event.paramValue("status","active");
		if( rc.status eq "completed"){ isComplete = true; }

		rc.tasks = taskService.list({isCompleted=isComplete});

		rc.feed = {description="My awesome tasks feed, showing all #rc.status# tasks",
				   link="#event.buildLink('tasks')#",
				   title="Tasks Feed",
				   items=rc.tasks,
				   pubdate=now()};

		rc.map = {description="notes",title="subject",pubdate="createDate"};
		rc.feedXML = FeedGenerator.createFeed(rc.feed,rc.map);

		event.renderData(data=rc.feedXML,contentType="text/xml");
	}
}
