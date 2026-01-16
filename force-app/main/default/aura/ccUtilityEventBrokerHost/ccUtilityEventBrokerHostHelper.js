({
 getCaseTabs: function(component) {
    var workspaceAPI = component.find("workspace");
     
    const casesOnly = (t) => t.recordId.startsWith('500');
     
    return new Promise((resolve, reject) => {

    workspaceAPI.getAllTabInfo().then(function(tabInfo) {

        const uniqueTabs = {};
          
         tabInfo.filter(casesOnly).forEach(function(tab) {
            if (!uniqueTabs[tab.recordId]) {
                uniqueTabs[tab.recordId] = {
                    tabId: tab.tabId,
                    title: tab.title,
                    value: tab.recordId,
                    count: 1,
                    subTabs: new Array(),
                };
            } else {    
               uniqueTabs[tab.recordId].count += 1; 
            }            
           
            tab.subtabs.filter(casesOnly).forEach((subtab) => {
                if (!uniqueTabs[subtab.recordId]) {
                    uniqueTabs[subtab.recordId] = {
                        tabId: subtab.tabId,
                        title: subtab.title,
                        value: subtab.recordId,
                        count: 1,
                    }; 
                } else { 
                   uniqueTabs[subtab.recordId].count += 1; 
                }
                                                                            
                uniqueTabs[tab.recordId].subTabs.push(uniqueTabs[subtab.recordId]);                                                           
            });
        }); 

        const tabs = Object.values(uniqueTabs);
        resolve({ data: {tabs}});
    });

  })
},
/*
refreshCaseTabs: function(component) {  
    return new Promise((resolve, reject) => {
        this.getCaseTabs(component).then(function(response) {
            const tabs = response.data.tabs; 
            resolve({ data: {tabs}});
        }).catch(function(error) {
            console.error(error);
        });         
   });
}  */   
})