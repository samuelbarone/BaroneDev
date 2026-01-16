/**
 * Created by samuelbarone on 10/1/17.
 */


@isTest
public class ManagingApex1Test {

    private static final Integer accountCount = 2;
    private static final Integer contactsPerAccountCount = 3;

    @testSetup
    public static void init() {
        CreateTestAccounts(accountCount, contactsPerAccountCount);
    }

    public static void CreateTestAccounts(Integer accounts,Integer contactsPerAccount) {

        List<Account> accountList = new List<Account>();

        Database.DMLOptions options = new Database.DMLOptions();

        options.DuplicateRuleHeader.allowSave = true;

        for(Integer a = 0; a < accounts; a++) {
            accountList.add(new Account(Name = 'Dons Company' + String.valueOf(a)));
        }

        Database.insert(accountList,options);


        List<Contact> contacts = new List<Contact>();

        for(Account act : accountList){

            for(Integer c = 0; c < contactsPerAccount; c++) {
                contacts.add(new Contact(FirstName='Don' + String.valueOf(c), LastName='Smith' + String.valueOf(c), AccountId = act.Id));
            }
        }

        Database.insert(contacts, options);

        System.debug(accountList);

    }

    @isTest
    public static void TestBasicOperation() {

        List<Account> accounts = [SELECT ID,OwnerId FROM Account];

        User user = getTestUser();

        System.runAs(user){

            for(Account acc : accounts) {
                acc.OwnerId = user.id;
            }

            Test.startTest();
            update accounts;
            Test.stopTest();

            List<Contact> updatedContacts = [SELECT Id, OwnerId FROM Contact];

            for(Contact c : updatedContacts) {
                System.assertEquals(user.Id,c.OwnerId,'Account and Contact owner does not match');
            }
        }

    }

    public static User getTestUser() {
        User tuser = new User( Alias = 'pbp1',
                firstname = 'Don',
                lastName = 'Smith',
                email = 'playbyplay@pluralsight.com',
                Username = 'playbyplay@pluralsight.com',
                EmailEncodingKey = 'UTF-8',
                TimeZoneSidKey = 'America/Los_Angeles',
                LocaleSidKey = 'en_US',
                LanguageLocaleKey = 'en_US',
                Id = userInfo.getUserId(),
                ProfileId = userInfo.getProfileId()
        );

        return tuser;
    }

}