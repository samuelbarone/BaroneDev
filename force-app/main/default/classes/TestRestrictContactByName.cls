@isTest
public class TestRestrictContactByName {
    
     @isTest static void testContacts() {
         
         List<Contact> contacts = new List<Contact>();
         
         Contact sam = new Contact(LastName='Barone'); 
         Contact invalid = new Contact(LastName='INVALIDNAME');
         
         contacts.add(sam);
         contacts.add(invalid);
         insert contacts;
         
         Test.startTest();
         Database.SaveResult result = Database.insert(sam,false);
         Test.stopTest();
         
         System.assert(!result.isSuccess());
         System.assert(result.getErrors().size() > 0);
        
    }
     


}