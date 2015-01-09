component {
	property name="HelloWorld" inject="javaLoader:HelloWorld";
		
	function dspHello() {	
		//Load the hello world class
		Event.setvalue( "HelloWorldObj", HelloWorld.init() );			
	}
	

}