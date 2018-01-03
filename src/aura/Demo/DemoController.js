({
    doInit : function(component, event, helper) {
        
    },
    handleOpportunityUpdated : function(component, event, helper) {
        helper.getInitialData(component, helper);
    },
    amountChanged : function(component, event, helper) {
        helper.calculateTotals(component, helper);
    },
    saveLineItems : function(component, event, helper) {
    	helper.saveLineItems(component, helper);
    }
})