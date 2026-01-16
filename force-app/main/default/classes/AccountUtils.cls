public class AccountUtils {
    
 public static List<Account> accountsByState(String abbreviation) {
     
     List<Account> lst = [SELECT Id, Name FROM Account WHERE BillingState = :abbreviation];

      return lst;
 }
    
}