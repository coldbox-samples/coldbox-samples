component persistent="true" entityname="Book" table="BOOKS" output="false" {

	property name="id" column="BOOKID" fieldtype="id" generator="increment";
	property name="title";
	property name="genre";
	
	property name="author" 
			 fieldtype="many-to-one" 
			 fkcolumn="AUTHORID" 
			 cfc="Author";
	
	public Book function init() output="false" {	
		return this;
	}
	
}
