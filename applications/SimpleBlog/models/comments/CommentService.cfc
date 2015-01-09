/**
* Service to handle comment operations.
* @author Luis Majano
*/
component extends="cborm.models.VirtualEntityService" singleton{
	
	/**
	* Constructor
	*/
	public CommentService function init(){
		
		super.init(entityName="Comment");
		
		return this;
	}

}