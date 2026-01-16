trigger AccountTrigger on Account (before insert) {
     if (Trigger.isBefore && Trigger.isInsert) { 
       AccountTriggerHandler.CreateAccounts(Trigger.new);


         
     }
    
    System.debug('I am a account trigger');
}