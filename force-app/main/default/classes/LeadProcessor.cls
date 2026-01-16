global class LeadProcessor implements Database.Batchable<SObject> {
  
    global Database.QueryLocator start(Database.BatchableContext bc) {
          return Database.getQueryLocator('SELECT ID, LeadSource FROM Lead'); 
    }
 
    global void execute(Database.BatchableContext bc, List<Lead> scope){
        
        List<Lead> leads = new List<Lead>();
 
        for (Lead l : scope) {
 
            l.LeadSource = 'Dreamforce';
            leads.add(l); 
        }
         
        update leads; 
    }   
  
    global void finish(Database.BatchableContext bc){
 
        // System.debug(recordsProcessed + ' records processed. Shazam!');
 
         AsyncApexJob job = [SELECT Id, Status, NumberOfErrors,  JobItemsProcessed,  TotalJobItems, CreatedBy.Email FROM AsyncApexJob WHERE Id = :bc.getJobId()];

        // TODO: job
 
    }   
 
}