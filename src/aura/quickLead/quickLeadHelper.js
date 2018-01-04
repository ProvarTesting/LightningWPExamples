({
    createLead: function(component, lead) {
        //Save the lead
        var action = component.get("c.saveLead");
        action.setParams({"newLead": lead});
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log('Lead saved id ='+response.getReturnValue().Id);
                //component.set("c.saveLead", '');
                component.set("v.newLead", null);
            }
            else {
                console.log('Error - server save failed : '+response.getError());
            }
        });
        $A.enqueueAction(action);
        /*
        this.upsertLead(component, lead, function(a) {
            var leads = component.get("v.lead");
            leads.push(a.getReturnValue());
            component.set("v.lead", leads);
        });
        */
    },
    upsertLead : function(component, lead, callback) {
      var action = component.get("c.saveLead");
      action.setParams({ 
          "newLead": lead
      });
      if (callback) {
          action.setCallback(this, callback);
      }
      $A.enqueueAction(action);
    }
})