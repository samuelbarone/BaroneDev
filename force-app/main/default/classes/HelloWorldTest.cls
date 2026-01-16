@isTest
private class HelloWorldTest {

	@isTest static void updateLead() {
		Lead myLead = new Lead();
		myLead.FirstName = 'Samuel';
		myLead.LastName = 'Barone';
		myLead.Company = 'Airbus';
		insert myLead;

		myLead.Company = 'American Addiction Centers';
		update myLead;
	}

}