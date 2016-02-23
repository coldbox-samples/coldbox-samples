component extends="cborm.models.VirtualEntityService" {
	
	public CarService function init(){
		super.init(entityName="Car");
		return this;
	}

	public array function loadById(String ids){
		var cars = [];
		
		for(var i=1; i<=listLen(arguments.ids); i++ ){
			arrayAppend(cars,entityLoadByPK("Car",listGetAt(ids,i)));
		}
		
		return cars;
	}		

}