component {

	// DI
	property name='ContactService' inject='ContactService';
	property name='MessageBox' inject='MessageBox@cbMessageBox';

	function index() {
		list( argumentCollection=arguments );
	}

	function list() {		
		prc.qContacts = contactService.list();
		event.setView('Contacts/list');
	}	function add() {		
		event.setView('Contacts/add');
	}	function createContact() {		
		event.paramValue( 'name', '' );
		event.paramValue( 'email', '' );
		
		// Verify contact info
		if( !len( rc.name ) || NOT len( rc.email ) ) {
			MessageBox.warn( 'Please enter a value for email and/or name' );
			setNextEvent( 'contacts.add' );
		}
		
		// Create Contact
		contactService.create( rc.name, rc.email );
		
		MessageBox.info( 'Contact Created!' );
		setNextEvent( 'contacts.list' );
	}	function delete() {
		event.paramValue( 'id', '' );
		
		// Remove Contact
		contactService.remove( rc.id );
		
		MessageBox.info('Contact Removed!');
		setNextEvent( 'contacts.list' );
	}
}