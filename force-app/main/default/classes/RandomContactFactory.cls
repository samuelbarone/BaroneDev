public class RandomContactFactory {
    
     public static List<Contact> generateRandomContacts(Integer numContacts, String lastName) {
        List<Contact> cntcts = new List<Contact>();
        
        for(Integer i=0;i<numContacts;i++) {
            Contact c = new Contact(FirstName='Contact' + i,LastName = lastName);
            cntcts.add(c);
        }
        insert cntcts;
         
        return cntcts;
    }

}