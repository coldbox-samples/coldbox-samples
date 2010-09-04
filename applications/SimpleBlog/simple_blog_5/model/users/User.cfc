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
			  cfc="model.entries.Entry" fkcolumn="FK_userID" inverse="true" lazy="true" cascade="all-delete-orphan";
	
	/* ----------------------------------------- PUBLIC -----------------------------------------  */

	string function getName(){
		return getFirstName() & " " & getLastName();
	}
	
	boolean function isAdmin(){
		if( getUserType() eq "admin" ){ return true; }
		return false;
	}
}