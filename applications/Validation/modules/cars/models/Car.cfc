component persistent="true" {

	property name="id" column="car_id" fieldtype="id" generator="native";

	property name="brand";
	property name="model";

	// object constraints
	this.constraints = {
		// with custom message
		brand = {required=true, requiredMessage="The brand name is required dude!"},
		model= {required=true, type="numeric", range="1..5"}
	};
}