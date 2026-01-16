global class AccountProcessor {
     
    @future
    public static void countContacts(List<Id> recordIds) {
        List<Account> accounts = [Select Id, Number_of_Contacts__c, Name, (Select Id From Contacts) from Account Where Id IN :recordIds];
        
        for(Account acc: accounts){
           acc.Number_of_Contacts__c = acc.Contacts.size(); 
        }  
        
        update accounts;
    } 
}