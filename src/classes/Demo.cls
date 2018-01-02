public class Demo {
	@AuraEnabled
    public static List<PricebookEntry> getProducts(ID priceBookId) {
        return [SELECT Id, Name, ProductCode, UnitPrice 
                FROM PricebookEntry 
                WHERE IsActive = true 
                AND Pricebook2Id = :priceBookId
                ORDER BY ProductCode ASC];
    }
    
    @AuraEnabled
    public static List<OpportunityLineItem> getOpportunityLineItems(ID OpportunityId) {
        return [SELECT Id, Name, PricebookEntryId, OpportunityId, ListPrice, ProductCode, Quantity, TotalPrice, UnitPrice
                FROM OpportunityLineItem 
                WHERE OpportunityId = :OpportunityId];
    }
    
    @AuraEnabled
    public static List<OpportunityLineItem> saveOpportunityLineItems(List<OpportunityLineItem> lineItems) {
        List<OpportunityLineItem> upsertLineItems = new List<OpportunityLineItem>();
        List<OpportunityLineItem> deleteLineItems = new List<OpportunityLineItem>();
        
        for (OpportunityLineItem li : lineItems) {
            if (li.Quantity == 0) {
                deleteLineItems.add(li);
            } else {
                upsertLineItems.add(li);                
            }
        }
        upsert upsertLineItems;
        delete deleteLineItems;
        
        return getOpportunityLineItems(lineItems[0].OpportunityId);
    }
}