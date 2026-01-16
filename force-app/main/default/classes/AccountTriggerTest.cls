@isTest
public class AccountTriggerTest {
    
    @isTest static void TestCreateAccounts() {
    
    List<Account> accts = new List<Account>();
        
        for(Integer i=0; i < 200; i++) {
            Account acct = new Account(Name='Test Account ' + i);
            acct.ShippingState = 'CA';
            accts.add(acct);
        }  
        
        Test.startTest();
        insert accts;
        Test.stopTest();
        
        List<Account> verifyBillingStateOfCA = [SELECT Id FROM Account Where BillingState = 'CA'];                              
        System.assertEquals(200, verifyBillingStateOfCA.size()); 
        
    }

}