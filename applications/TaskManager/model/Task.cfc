/**
* A cool task object
*/
component output="false" persistent="true"{
	
	property name="taskID" fieldType="id" generator="uuid";
	property name="subject" notnull="true" type="string";
	property name="createDate" fieldtype="timestamp";
	property name="notes" ormType="text";
	property name="isCompleted" ormType="boolean" dbdefault="0" default="false";
	
	Task function init() output=false{
		return this;
	}		
}
