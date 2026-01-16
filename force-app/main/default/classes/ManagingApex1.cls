/**
 * Created by samuelbarone on 10/2/17.
 */

public with sharing class ManagingApex1 {

public static void HandleAccountUpdate(List<Account> newList,Map<ID,Account> oldMap) {
    List<Account> changedAccounts = new List<Account>();

    for(Account act : changedAccounts) {
        if(act.OwnerId != oldMap.get(act.Id).OwnerId) {
            changedAccounts.add(act);
        }
    }

    if(changedAccounts.size() == 0) return;

    Map<ID, Account> accountsMap = new Map<ID,Account>(newList);

    List<Contact> contacts = [Select ID, OwnerId, AccountID From Contact Where AccountID In :oldMap.keySet()];

    for(Contact ct: contacts) {
        ct.OwnerId = accountsMap.get(ct.AccountId).OwnerId;

    }
}

}