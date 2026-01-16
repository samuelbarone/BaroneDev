({
	doInit : function(component, event, helper) {
        
        var mymy = {
            callback : component.getReference("c.onLeadContinue")
        }
        component.set("v.mySettings", mymy);
		
	},
    onLeadContinue : function(component, event, helper) {
        
         var mymy = {
            callback : component.getReference("c.onLeadContinue")
        }
         
        alert('Lead');
    },
    onAccountContinue : function(component, event, helper) {
        alert('Account');
    }
})