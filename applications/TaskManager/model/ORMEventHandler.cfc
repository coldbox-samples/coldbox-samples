component extends="coldbox.system.orm.hibernate.EventHandler"{

	public void function postLoad(any Entity){
		getLogger(this).info("post load an entity: #getMetaData(entity).name#");
	}
	
	public void function postUpdate(any Entity){
		getLogger(this).info("post load an entity: #getMetaData(entity).name#");
	}
}