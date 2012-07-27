component persistent="true" {

	property name="id" column="product_id" fieldtype="id" generator="native";
	property name="name";
	property name="description" ormtype="text";
	property name="categories" fieldtype="many-to-many" cfc="validationSample.model.category.Category" linktable="product_categories"
		 fkcolumn="product_id" inversejoincolumn="category_id" lazy="true" cascade="all" singularname="category";

	// object constraints
	this.constraints = {
		name = {required=true},
		description={required=true},
		categories={size="1"}
	};

	public Product function init(){
		setCategories([]);
		return this;
	}

	public string function getCategoryList(){
		var cats = "";

		for(var x=1; x<=arrayLen(getCategories()); ++x){
			cats = listAppend(cats,getCategories()[x].getName());
		}

		return cats;
	}

}