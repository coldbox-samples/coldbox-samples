component  {

	property name="authorService" inject="entityService:Author";
		
	function onRequestStart(){
		
		prc.title = "ORM Example : Hibernate Criteria Queries";
		
		prc.xehHome = "general.index";
		prc.xehBasic = "general.basic";
		prc.xehAdvanced = "general.advanced";
		prc.selectedNav = "";
		
		prc.authors = authorService.list( sortOrder="id ASC", asQuery=false);

	}	
}
