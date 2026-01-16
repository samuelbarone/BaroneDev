({
	getBedBoardFacility : function(component) { 
        var action = component.get("c.getBedBoardFacility");
        action.setParams({  facilityName : "Desert Hope"  });
        
        action.setCallback(this, function(actionResult) {
        component.set("v.bedBoard", actionResult.getReturnValue());  
             this.getDetoxFirst(component); 
             this.setDays(component);
    	});
        
        $A.enqueueAction(action); 
	},
     getDetoxFirst : function(component) { 
        
        var bedBoard = component.get("v.bedBoard");
         // alert("getDetoxFirst " + bedBoard);
        var facilityName = bedBoard.FacilityName__c;
                                 
        if (facilityName.startsWith("Forterus") ||
            (facilityName.startsWith("Recovery") && facilityName.toLocaleLowerCase() != "recovery first fort lauderdale east") ||
            facilityName.startsWith("Sunrise") ||
            facilityName.startsWith("Townsend") ||
            facilityName.startsWith("Solutions") ||
            facilityName.toLowerCase().startsWith("river oaks") ||
            facilityName.toLowerCase() == "oxford centre") {
             component.set("v.detoxFirst", true);    
        } else {
             component.set("v.detoxFirst", false);  
        }
    },
    setDays : function(component) {        
         var today = new Date(); 
         today.setDate(today.getDate() + 1);
    
         var dd = today.getDate();
         var mm = today.getMonth() + 1;      
         var day1FormattedDate = mm + '/' + dd 
          
         today.setDate(today.getDate() + 1);
         dd = today.getDate();
         mm = today.getMonth() + 1;  
         var day2FormattedDate = mm + '/' + dd 
        
         var day1 =  component.get('v.day1');
         var day2 =  component.get('v.day2'); 
         var day3 =  component.get('v.day3');
        
         component.set("v.day1", "Today");   
         component.set("v.day2", day1FormattedDate);  
         component.set("v.day3", day2FormattedDate);   
    },
    showSpinner: function (component, event, helper) {
        var spinner = component.find("mySpinner");
        $A.util.removeClass(spinner, "slds-hide");
    },    
    hideSpinner: function (component, event, helper) {
        var spinner = component.find("mySpinner");
        $A.util.addClass(spinner, "slds-hide");
    }
})