({
	doInit : function(component, event, helper) {
		
        helper.showSpinner(component); 
        
        helper.getBedBoardFacility(component); 
        
       helper.hideSpinner(component);
        
      //  $A.util.addClass(spinner, "slds-hide");
        
       // helper.getDetoxFirst(component);
    }

})