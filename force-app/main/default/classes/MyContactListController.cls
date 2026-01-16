/**
 * Created by samuelbarone on 10/1/17.
 */

public with sharing class MyContactListController {
    @AuraEnabled
    public static List<Contact> getContacts() {
        return [Select Id, Name, Email, Title, Phone From Contact];
    }
}