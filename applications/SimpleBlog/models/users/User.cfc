/**
* I am a User Entity
*/
component persistent="true" table="users"{
	
	// Properties
	property name="userID" column="user_id" fieldtype="id" generator="uuid" setter="false";
	property name="firstName";
	property name="lastName";
	property name="userName";
	property name="password";
	property name="lastLogin" ormtype="date";
	property name="userType";
	
	// Relationships
	property name="entries" singularName="entry" type="array" fieldtype="one-to-many" 
			  cfc="models.entries.Entry" fkcolumn="FK_userID" inverse="true" lazy="true" cascade="all-delete-orphan";
	
	// DEPENDENCIES via WireBOX
	property name="dateUtil" inject="model" persistent="false";

	/* ----------------------------------------- PUBLIC -----------------------------------------  */

	/**
	* Retrieve full name
	*/
	string function getName(){
		return getFirstName() & " " & getLastName();
	}
	
	/**
	* Shorthand retrieve admin
	*/
	boolean function isAdmin(){
		if( getUserType() eq "admin" ){ return true; }
		return false;
	}
	
	/**
	* Get formatted lastLogin
	*/
	string function getDisplayLastLogin(){
		var lastLogin = getLastLogin();
		
		if(  NOT isNull(lastLogin) ){
			return dateUtil.formatDateTime( lastLogin );
		}
		
		return "Never";
	}
}