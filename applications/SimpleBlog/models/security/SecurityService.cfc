/**
* Our blog security service
*/
component singleton{

	//Dependencies
	property name="userService" 	inject="model";
	property name="sessionStorage" 	inject="sessionStorage@cbstorages";
	
	/**
	* Constructor
	*/
	public SecurityService function init(){
		return this;
	}
	
	/**
	* Update a user's last login timestamp
	*/
	void function updateUserLoginTimestamp(){
		var user = getUserSession();
		user.setLastLogin( now() );
		userService.save( user );
	}
	
	/**
	* User validator via security interceptor
	*/
	boolean function userValidator(struct rule,any messagebox, any controller){
		var isAllowed 	= false;
		var user 		= getUserSession();
		var cPermission = "";
		
		// is user found in session?
		if( len( user.getUserID() ) ){
			
			// Check right type
			if( ListFindNoCase(arguments.rule['roles'], user.getUserType()) ){
				isAllowed = true;
			}
		}
		
		return isAllowed;
	}
	
	/**
	* Get a user from session, or returns a new empty user entity
	*/
	any function getUserSession(){
		
		// Check if valid user id in session?
		if( sessionStorage.exists("validUserID") ){
			// try to get it with that ID
			var user = userService.get( sessionStorage.getVar("validUserID") );
			if( not isNull(user) ){
				return user;
			}
		}
		
		// return new user, not found or not valid
		return userService.new();
	}
	
	/**
	* Set a new user in session
	*/
	void function setUserSession(any user){
		sessionStorage.setVar("validUserID", user.getUserID() );
	} 

	/**
	* Delete user session
	*/
	void function deleteUserSession(){
		sessionStorage.clearAll();
	}

	/**
	* Verify if a user is valid
	*/
	boolean function isUserVerified(required string username, required string password){
		
		var user = userService.findWhere({username=arguments.username,password=arguments.password});
		
		//check if found and return verification
		if( not isNull(user) ){
			setUserSession( user );
			return true;
		}
		
		return false;	
	}

}
