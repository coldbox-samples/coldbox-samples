/**
* A cool task object
*/
component persistent="true" {
	
	property name="taskID" fieldType="id" generator="uuid";
	property name="subject" notnull="true" type="string";
	property name="createDate" fieldtype="timestamp";
	property name="notes" ormType="text";
	property name="isCompleted" ormType="boolean" dbdefault="0" default="false";
	
	Task function init() {
		return this;
	}		
}
