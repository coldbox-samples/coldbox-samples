/**
* Service to handle user operations.
* @author Luis Majano
*/
component extends="coldbox.system.orm.hibernate.VirtualEntityService" singleton{
	
	/**
	* Constructor
	*/
	public UserService function init(){
		// init it
		super.init(entityName="User");
	    
		return this;
	}

}