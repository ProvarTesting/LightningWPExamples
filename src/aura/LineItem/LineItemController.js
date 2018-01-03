({
	viewLineItem : function(component, event, helper) {
        var navEvt = $A.get("e.force:navigateToSObject");
        navEvt.setParams({
            "recordId": component.get("v.lineItem").Id,
            "slideDevName": "details"
        });
        navEvt.fire();
    },
    recalculate : function(component, event, helper) {
 		var lineItem = component.get("v.lineItem");
        lineItem.TotalPrice = lineItem.Quantity * lineItem.UnitPrice;
        component.set("v.lineItem", lineItem);
        
        var lineItemUpdated = component.getEvent("lineItemUpdated");
        lineItemUpdated.setParams({
            OpportunityId: lineItem.OpportunityId,
            LineItemId: lineItem.Id
        });
        lineItemUpdated.fire();
    }
})