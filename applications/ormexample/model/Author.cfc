component persistent="true" entityname="Author" table="AUTHORS" output="false" {

	property name="id" column="AUTHORID" fieldtype="id" generator="increment";
	property name="firstName";
	property name="lastName";
	property name="bio";
	property name="isSpotlight";
	
	property name="books" 
			 singularname="book" 
			 type="array" 
			 fieldtype="one-to-many" 
			 cfc="Book" 
			 inverse="false" 
			 fkcolumn="AUTHORID";
	
	public Author function init() output="false" {	
		return this;
	}
	
}
