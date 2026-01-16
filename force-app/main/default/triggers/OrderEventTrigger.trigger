trigger OrderEventTrigger on Order_Event__e (after insert) {

     // List to hold all cases to be created.
    List<Task> tasks = new List<Task>();
      
    // Iterate through each notification.
    for (Order_Event__e event : Trigger.New) {
        if (event.Has_Shipped__c == true) {
             
            Task tk = new Task();
            tk.Priority = 'Medium';
            tk.Status = 'New';
            tk.Subject = 'Follow up on shipped order ' + event.Order_Number__c;
            tk.OwnerId = userinfo.getUserId();
            tasks.add(tk);
        }
   }
    
    // Insert all cases corresponding to events received.
    insert tasks;
}