component{

	// DI
	property name="ContactService" inject="model";

/************************************** HTTP REST SECURITY *********************************************/
	this.allowedMethods = {
		hello = "GET,HEAD",
		list = "GET"
	};

/************************************** REST HELPERS *********************************************/

	function preHandler(event,rc,prc,action){
		// default REST response to JSON
		event.paramValue("format", "json");

		// Verify supporter formats, else advice
		if( NOT reFindnocase("^(xml|json)$", rc.format) ){
			rc.invalidFormat = rc.format;
			rc.format = "json";
			event.overrideEvent("rest.contacts.invalidFormat");
		}

		// create response data packet
		prc.response = {
			error = false,
			messages = "",
			data = ""
		};
	}

	function postHandler(event,rc,prc,action){
		event.renderData(data=prc.response, type=rc.format);
	}

	function onError(event,rc,prc,faultAction,exception){
		// execute another action if invalid HTTP method security
		if( exception.type eq "Controller.405"){
			return invalidHTTP(event,rc,prc,exception);
		}
		// Normal Exception Handling
		prc.response.error = true;
		prc.response.messages = "#exception.message# #exception.detail#";
		event.setHTTPHeader(statusCode="500", statusText="Something went bad with your request, please see the messages.")
			.renderData(data=prc.response, type=rc.format);
	}

	function invalidHTTP(event,rc,prc,exception){
		// create response data packet
		prc.response = {
			error = true,
			messages = exception.message & " " & exception.detail
		};
		event.setHTTPHeader(statusCode="405", statusText="#exception.message#")
			.renderData(data=prc.response, type="json");
	}

	function invalidFormat(event,rc,prc,action){
		prc.response.error = true;
		prc.response.messages = "The format you sent: #rc.invalidFormat# is an invalid format. Valid formats are JSON and XML";
		event.setHTTPHeader(statusCode="400", statusText="Invalid response format");
	}

/************************************** RESOURCES *********************************************/

	function hello(event,rc,prc){
		prc.response.data = "Hello from RESTland";
	}

	function list(event,rc,prc){
		prc.response.data = contactService.list();
	}

	function bad(event,rc,prc){
		prc.response.data = contactServicesss.list();
	}
}