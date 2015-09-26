component {

	property name="MessageBox" inject="MessageBox@cbMessageBox";
	property name="carService" inject="carService@cars";

	public void function index(event,rc,prc){
		setNextEvent("cars/home/list");
	}

	public void function list(event,rc){
		rc.cars = carService.list(asquery=false);
		event.setView("car/index");
	}

	public void function edit(event,rc){
		if( !structKeyExists(rc,"car") ){
	        rc.car = carService.get( event.getValue('car_id','') );
		}
        event.setView("car/car");
	}

	function save(event,rc){
		// populate the model with all the properties
		rc.car = populateModel( model=carService.get(rc.car_id) );

		// validation
		var result = validateModel(rc.car);

		if( !result.hasErrors() ){
			// validation found no errors, persist the data
			carService.save(rc.car);
			MessageBox.setMessage("info","Car saved!");
			setNextEvent('home/list');
		} else {
			MessageBox.setMessage(type="error",messageArray=result.getAllErrors());
			setNextEvent(event='cars/home/edit',persist="car");
		}
	}

}