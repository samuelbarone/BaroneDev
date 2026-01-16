({ 
    doInit: function (component, event, helper) { 
        /*
        var myTabs = component.get("v.mytabs");   
         helper.refreshCaseTabs(component).then(function(response) {
             const tabs = response.data.tabs;
             component.set("v.mytabs", tabs);
             console.log(tabs); 
        }).catch(function(error) {
           console.log(error);
        }); 
        */ 
                    
        helper.getCaseTabs(component).then(function(response) {
             const tabs = response.data.tabs;
             component.set("v.mytabs", tabs);
             console.log(tabs); 
        }).catch(function(error) {
           console.log(error);
        });  
	},
    
    onTabCreated: function(component, event, helper) {
    var newTabId = event.getParam('tabId');
    //var workspaceAPI = component.find("workspace"); 
    // var myTabs = component.get("v.mytabs"); 
     setTimeout(() => {   
      helper.getCaseTabs(component).then(function(response) {
          const tabs = response.data.tabs;
          component.set("v.mytabs", tabs); 
          console.log(tabs); 
          
          let createdTab = tabs.find(t => t.tabId === newTabId);
          
          if(createdTab) {
              console.log({createdTab});
          }
          
        }).catch(function(error) {
           console.log(error);
        });  
       }, "1000"); 
        
        
   /*     
        setTimeout(() => {
            workspaceAPI.getTabInfo({
                tabId: newTabId
            }).then(function(response) {
 
                var recId = response.recordId;
                var title = response.title;

                if (myTabs.filter(t => t.value === recId).length == 0) { 
                    
                    myTabs.push({
                        tabId: newTabId,
                        title: title,
                        value: recId
                    });
                    component.set("v.mytabs", myTabs);
                    console.log({
                        myTabs
                    });
                } else { 
                    console.log('Record already exists');
                    
                }
            })
        }, "1000");  
     */
},
     onTabClosed : function(component, event, helper) { 
        var closedTabId = event.getParam('tabId');
        var workspaceAPI = component.find("workspace");
        var myTabs = component.get("v.mytabs");   
         helper.getCaseTabs(component).then(function(response) {
             const tabs = response.data.tabs;
             component.set("v.mytabs", tabs);             
             console.log(tabs); 
               
          let closedTab = myTabs.find(t => t.tabId === closedTabId);
          
          if(closedTab) {
              console.log({closedTab});
          }  
             
        }).catch(function(error) {
           console.log(error);
        });  
    },
     onTabRefreshed: function(component, event, helper) {
        var refreshedTabId = event.getParam("tabId");
        let workspaceAPI = component.find("workspace");
        console.log({refreshedTabId});
     },
})