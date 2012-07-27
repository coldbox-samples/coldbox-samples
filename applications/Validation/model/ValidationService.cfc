/**
* I am a new Model Object
*/
component singleton{

	validationService function init(){
		return this;
	}

	struct function getUserForm(){
		return {
			username = {required=true, size="5..10"},
			password = {required=true, size="5..10"}
		};
	}

}
