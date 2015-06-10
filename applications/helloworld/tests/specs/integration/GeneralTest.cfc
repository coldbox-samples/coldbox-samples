/*******************************************************************************
*	Integration Test as BDD (CF10+ or Railo 4.1 Plus)
*
*	Extends the integration class: coldbox.system.testing.BaseTestCase
*
*	so you can test your ColdBox application headlessly. The 'appMapping' points by default to
*	the '/root' mapping created in the test folder Application.cfc.  Please note that this
*	Application.cfc must mimic the real one in your root, including ORM settings if needed.
*
*	The 'execute()' method is used to execute a ColdBox event, with the following arguments
*	* event : the name of the event
*	* private : if the event is private or not
*	* prePostExempt : if the event needs to be exempt of pre post interceptors
*	* eventArguments : The struct of args to pass to the event
*	* renderResults : Render back the results of the event
*******************************************************************************/
component extends="coldbox.system.testing.BaseTestCase" appMapping="/root"{

	/*********************************** LIFE CYCLE Methods ***********************************/

	function beforeAll(){
		super.beforeAll();

		url.debugmode = false;
	}

	function afterAll(){
		super.afterAll();
	}

	/*********************************** BDD SUITES ***********************************/

	function run(){

		describe( "General Suite", function(){

			beforeEach(function( currentSpec ){
				// Setup as a new ColdBox request for this suite, VERY IMPORTANT. ELSE EVERYTHING LOOKS LIKE THE SAME REQUEST.
				setup();
			});

			it( "hello", function(){
				var defaultFirstName = controller.getSetting("Codename", true) & controller.getSetting("Version", true);
				var event = execute( event="General.hello", renderResults=true );

				expect( event.getValue("firstname") ).toBe( defaultFirstName );
				expect( event.getCurrentView() ).toBe("general/hello");
			});

			it( "doHello", function(){
				var event = '';

				expect(function() {
					event = execute( event="General.doHello", renderResults=true );
				}).toThrow();

				getRequestContext().setValue( name="firstname", value="" );
				event = execute( event="General.doHello", renderResults=true );
				expect( event.getValue("firstname") ).toBe("Not Found");

				getRequestContext().setValue( name="firstname", value="Fake Name" );
				event = execute( event="General.doHello", renderResults=true );
				expect( event.getValue("firstname") ).toBe("Fake Name");

				expect( event.getCurrentView() ).toBe("general/helloRich");
			});

			it( "doStartOver", function(){
				var event = execute( event="General.doStartOver" );

				expect( event.getValue( "setNextEvent_event" ) ).toBe( "General.hello" );
			});

			it( "popup", function(){
				var event = execute( event="General.popup" );

				expect( event.getCurrentView() ).toBe("general/popup");
				expect( event.getCurrentLayout() ).toBeEmpty();
			});

		});

	}

}
