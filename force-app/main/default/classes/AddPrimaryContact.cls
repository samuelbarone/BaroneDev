public class AddPrimaryContact implements Queueable {
    
    public Contact c;
    public String abbrev;
    
    public AddPrimaryContact(Contact cntct, String abbrev) { 
        this.c = cntct;
        this.abbrev = abbrev; 
    }
    
    public void execute(QueueableContext context) {
        
        List<Account> accountList = [Select Id, Name, (Select Id, FirstName, LastName From Contacts) From Account Where BillingState = :this.abbrev LIMIT 200];    
        List<Contact> contactList = new List<Contact>();
         
        for(Account a: accountList) { 
            Contact t = new Contact();
            t.FirstName = c.FirstName;
            t.LastName = c.LastName;
            t.AccountId = a.Id;
          //Contact cont = new Contact(FirstName = this.c.FirstName,LastName = this.c.LastName, AccountId = acc.Id); // c.clone(false,false,false,false);
          //  cont.AccountId = acc.Id;
            contactList.add(t);
        }
         
            insert contactList;
       
    } 
}