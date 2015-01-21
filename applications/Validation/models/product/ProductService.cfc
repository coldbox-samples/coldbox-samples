component extends="cborm.models.VirtualEntityService" {
	
	public ProductService function init(){
		super.init(entityName="Product");
		return this;
	}	

}