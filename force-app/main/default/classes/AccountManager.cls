@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {
 
   /* @HttpGet
    global static List<Contact> getAccount() {
        RestRequest request = RestContext.request;
        // grab the caseId from the end of the URL
        String accountId = request.requestURI.substring(
          request.requestURI.indexOf('/')+1);
        List<Contact> result =  [SELECT Id,Name 
                        FROM Contact
                        WHERE AccountId = :accountId];
        return result;
    } */
    
   
    @HttpGet
    global static Account getAccount() {
        RestRequest req = RestContext.request;
        String accId = req.requestURI.substringBetween('Accounts/', '/contacts');
        Account acc = [SELECT Id, Name, (SELECT Id, Name FROM Contacts) 
                       FROM Account WHERE Id = :accId];
		return acc;
    } 
 
}

// Account acc = [select id ,name ,(select id ,Name from contacts) from Account ];