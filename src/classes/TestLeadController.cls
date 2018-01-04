@isTest
private class TestLeadController {
    
    static TestMethod void testLead() {
        // Set up
     	Lead l = new Lead(LastName='Bloggs', FirstName='Joe', Email='nospam@nospam.com', Company='Bloggs & Co');
        // Execute
        Test.startTest();
        LeadController.saveLead(l);
        System.assert(l.Id != null);
        Test.stopTest();
    }

}