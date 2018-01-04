public with sharing class LeadController {

    @AuraEnabled
    public static Lead saveLead(Lead newLead) {
        // Perform isCreatable()/Updateable checking first, then
        System.debug('Saving Lead, id before is'+newLead.id);
        upsert newLead;
        System.debug('Lead saved, Id is '+newLead.id);
        
        return newLead;
    }
}