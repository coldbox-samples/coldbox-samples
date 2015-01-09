/**
* I am a Comment Entity
*/
component persistent="true" table="comments"{
	
	// PROPERTIES
	property name="commentID" column="comment_id" fieldtype="id" generator="uuid" setter="false";
	property name="comment";
	property name="time" insert="false" update="false";
	property name="author";
	property name="authorEmail";
	property name="authorURL";
	
	// Relationships
	property name="Post" cfc="models.entries.Entry" fieldtype="many-to-one" fkcolumn="entry_id";
	
	// DEPENDENCIES via WireBOX
	property name="dateUtil" inject="model" persistent="false";

	/* ----------------------------------------- PUBLIC -----------------------------------------  */
	
	/**
	* Get formatted Time
	*/
	string function getDisplayTime(){
		return dateUtil.formatDateTime( getTime() );
	}
}