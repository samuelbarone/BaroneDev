trigger BattleStationTrigger on Battle_Station__c (after update) {
 
    if (Trigger.isAfter) {
 
        List<Id> battleStationIds = new List<Id>();
        battleStationIds.addAll(Trigger.newMap.keySet());
    
        System.debug('Publishing battle station update notifications');
        List<Battle_Station_Updated__e> notifications = new List<Battle_Station_Updated__e>();

        // AmazonSqsSender t = new AmazonSqsSender();

        for (Battle_Station__c b: [SELECT Id, Name FROM Battle_Station__c WHERE Id IN :battleStationIds]) {
            notifications.add(new Battle_Station_Updated__e(
                Battle_Station__c = (String)b.Id 
            ));

         // AmazonSqsSender.sendMessage((String)b.Id);
        }

         //System.debug(notifications);

         	
		   
   
        List<Database.SaveResult> results = EventBus.publish(notifications);

        // Inspect publishing results
        for (Database.SaveResult result : results) {
            if (!result.isSuccess()) {
                for (Database.Error error : result.getErrors()) {
                    System.debug('Error returned: ' +
                        error.getStatusCode() +' - '+
                        error.getMessage());
                }
            }
        }

    }



}