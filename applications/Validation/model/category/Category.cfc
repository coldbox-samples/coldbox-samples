component persistent="true" {

	
	property name="id" column="category_id" fieldtype="id" generator="native";
	
	property name="name";
	property name="sort" ormtype="int";
	
	property name="products" fieldtype="many-to-many" cfc="validationSample.model.product.Product" linktable="product_categories" 
			 fkcolumn="category_id" inversejoincolumn="product_id" lazy="true" cascade="all" singularname="product" inverse="true";

	// object constraints
	this.constraints = {
		name = {required=true}, sort={required=true,type="numeric"}
	};
}