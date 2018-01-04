@isTest
private class TestDemo {

    // Yes it's bad, but it's just a placeholder
    static testMethod void testCoverage() {
       // Create some unit test data
        Account a = new Account(Name='Test 1');
        insert a;
        Opportunity o = new Opportunity(Name='Test Opp', AccountId=a.id, CloseDate=System.today(), Amount=100, StageName='Prospecting');
        insert o;
        Product2 p = new Product2(Name='Test Product', Family='Unit Test');
        insert p;
        
        // Get Standard Pricebook
        Id pricebookid = Test.getStandardPricebookId();
        PriceBookEntry pbe = new PriceBookEntry(PriceBook2Id = pricebookid,
                                                Product2Id = p.Id,
                                                UnitPrice = 100,
                                                IsActive = true
                                               );
        insert pbe;
        
        // Create one initial line item
        OpportunityLineItem oli1 = new OpportunityLineItem();
        oli1.OpportunityId = o.id;
        oli1.TotalPrice = 100;
        oli1.PricebookEntryId = pbe.Id;
        oli1.Quantity = 1;
        insert oli1;
        
        Test.startTest();        
        oli1.Quantity = 2;
        
        Demo.getProducts(null);
        Demo.getOpportunityLineItems(null);
        List<OpportunityLineItem> lineItems = new List<OpportunityLineItem>();
        lineItems.add(oli1);
        
        Demo.saveOpportunityLineItems(lineItems);
        
        OpportunityLineItem oli2 = [SELECT Quantity FROM OpportunityLineItem WHERE id = :oli1.id];
        System.assertEquals(2, oli2.Quantity);
        Test.stopTest();
    }
}