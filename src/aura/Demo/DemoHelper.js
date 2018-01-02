({
	getInitialData : function(component, helper) {
        helper.getProducts(component, helper);
        helper.getOpportunityLineItems(component, helper);
    },
    calculateTotals : function(component, helper) {
        debugger;
    	var OpportunityTotal = 0;
        var lineItems = component.get("v.lineItems");
        for (var i = 0; i < lineItems.length; i++) {
            var lineItem = lineItems[i];
            OpportunityTotal += lineItem.TotalPrice;
        }
        component.set("v.OpportunityTotal", OpportunityTotal);
    },
    getProducts : function(component, helper) {
        var action = component.get("c.getProducts");
        action.setParams({ priceBookId : component.get("v.opportunity").Pricebook2Id });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.products", response.getReturnValue());
            } else {
                helper.handleErrors(component, helper, response);
            }
        });
        $A.enqueueAction(action);
    },
    saveLineItems : function(component, helper) {
        var action = component.get("c.saveOpportunityLineItems");
        action.setParams({ lineItems : component.get("v.lineItems") });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.lineItems", response.getReturnValue());
                component.find('toaster').showToast({
                    title: "Success",
                    message: "The opportunity's line items have been saved",
                    variant: "success"
                });
            } else {
                helper.handleErrors(component, helper, response);
            }
        });
        $A.enqueueAction(action);
    },
    getOpportunityLineItems : function(component, helper){
        var action = component.get("c.getOpportunityLineItems");
        action.setParams({ OpportunityId : component.get("v.opportunity").Id });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.lineItems", response.getReturnValue());
                helper.calculateTotals(component, helper);
            } else {
                helper.handleErrors(component, helper, response);
            }
        });
        $A.enqueueAction(action);
    },
    handleErrors: function(component, helper, response) {
        if (state === "INCOMPLETE") {
            // do something
        }
        else if (state === "ERROR") {
            var errors = response.getError();
            if (errors) {
                if (errors[0] && errors[0].message) {
                    component.set("v.recordError", errors[0].message);
                    console.log("Error message: " + errors[0].message);
                }
            } else {
                component.set("v.recordError", "Unknown error");
                console.log("Unknown error");
            }
        }
    }
})