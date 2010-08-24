/**
* A service layer that handles al task operations
*/
component output="false" singleton{
	
	TaskService function init() output=false{
		return this;
	}
	
	Task function getTask(taskID="") output=false{
		if( len(arguments.taskID) ){
			var task = entityLoad("Task",arguments.taskID,true);
			if(NOT isNull(task) ){
				return task;
			}
		}		
		return entityNew("Task");
	}
	
	void function save(Task task) output=false{
		transaction {
			entitySave(arguments.task);
		}
	}
	
	void function remove(taskID) output=false{
		transaction{
			// get task
			var task = getTask(taskID);
			if( NOT isNull(task.getTaskID()) ){
				entityDelete(task);
			}
		}
	}
	
	any function findAll(isCompleted=false,boolean asQuery=false) output=false{
		var results = entityLoad("Task",{isCompleted=arguments.isCompleted});
		
		if( arguments.asQuery ){ return entityToQuery(results); }
		
		return results;
	}
}
