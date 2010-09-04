/**
* Service to handle comment operations.
* @author Luis Majano
*/
component extends="coldbox.system.orm.hibernate.VirtualEntityService" singleton{
	
	/**
	* Constructor
	*/
	public CommentService function init(){
		
		super.init(entityName="Comment");
		
		return this;
	}

}