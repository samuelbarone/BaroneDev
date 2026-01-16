/**
 * Created by samuelbarone on 10/2/17.
 */

trigger ManagingDataAccountTrigger on Account (after update) {

    ManagingApex1.HandleAccountUpdate(Trigger.old,Trigger.oldMap);
}