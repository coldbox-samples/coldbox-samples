component output="false" {

	property name="restrictions"  inject="model:Restrictions";
	property name="authorService" inject="entityService:Author";
	
	// OPTIONAL HANDLER PROPERTIES
	this.prehandler_only 	= "";
	this.prehandler_except 	= "";
	this.posthandler_only 	= "";
	this.posthandler_except = "";
	// REST Allowed HTTP Methods Ex: this.allowedMethods = {delete='POST,DELETE',index='GET'}
	this.allowedMethods = {};
	
	/**
	IMPLICIT FUNCTIONS: Uncomment to use
	function preHandler(event,action){
		var rc = event.getCollection();
	}
	function postHandler(event,action){
		var rc = event.getCollection();
	}
	function onMissingAction(event,missingAction){
		var rc = event.getCollection();
	}
	function onError(event,faultAction,exception){
		var rc = event.getCollection();
	}
	*/
		
	function onRequestStart(event){
		var rc = event.getCollection();
		var prc = event.getCollection(private=true);
		
		prc.title = "ORM Example : Hibernate Criteria Queries";
		
		prc.xehHome = "general.index";
		prc.xehBasic = "general.basic";
		prc.xehAdvanced = "general.advanced";
		prc.xehPaging = "general.paging";
		prc.selectedNav = "";
		
		prc.authors = authorService.criteriaQuery(criteria=[], sortOrder="id ASC", asQuery=false);

	}	
}
