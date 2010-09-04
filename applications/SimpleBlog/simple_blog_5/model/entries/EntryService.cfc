/**
* Service to handle comment operations.
* @author Luis Majano
*/
component extends="coldbox.system.orm.hibernate.VirtualEntityService" singleton{
	
	/**
	* Constructor
	*/
	public EntryService function init(){
		// init it
		super.init(entityName="Entry");
		
		return this;
	}
	
	/**
	* Get the latest entries
	*/
	public any function getLatestEntries(boolean asQuery=false){
		return list(sortOrder="time desc",asQuery=arguments.asQuery);
	}

}