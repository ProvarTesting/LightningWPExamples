({
    clickCreateLead: function(component, event, helper) {
        // Create the new lead
        var newLead = component.get("v.newLead");
        helper.createLead(component, newLead);
        //component.set("v.newLead", null);
    },
})