public class ContactAndLeadSearch {
 public static List<List< SObject>> searchContactsAndLeads(String qry) {
     List<List<sObject>> searchList = [FIND :qry IN ALL FIELDS RETURNING Lead(FirstName,LastName),Contact(FirstName,LastName)];
     
     return searchList;
 }
}