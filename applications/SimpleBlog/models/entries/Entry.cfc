/**
* I am an entry entity
*/
component persistent="true" table="entries"{
	
	// Properties
	property name="entryID" column="entry_id" fieldtype="id" generator="uuid" setter="false";
	property name="title";
	property name="body" column="entryBody";
	property name="time" insert="false" update="false";
	
	// Relationships
	property name="user" cfc="models.users.User" fieldtype="many-to-one" fkcolumn="FK_userID" lazy="true";
	
	property name="comments" singularName="comment" fieldtype="one-to-many" type="array"
			  cfc="models.comments.Comment" fkcolumn="entry_id" inverse="true" cascade="all-delete-orphan"; 
	
	// DEPENDENCIES via WireBOX
	property name="dateUtil" inject="model" persistent="false";

	/* ----------------------------------------- PUBLIC -----------------------------------------  */
	
	/*
	* I return the number of comments for this post
	*/
	numeric function getNumberOfComments(){
		return ArrayLen( getComments() );
	}
	
	/**
	* Shorthand Author name
	*/
	string function getAuthor(){
		return getUser().getName();
	}
	
	/**
	* Get formatted Time
	*/
	string function getDisplayTime(){
		return dateUtil.formatDateTime( getTime() );
	}
	
}