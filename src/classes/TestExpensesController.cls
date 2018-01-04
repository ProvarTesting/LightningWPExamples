@isTest
private class TestExpensesController {

    static testMethod void testController() {
    
        // No data required just shameless code coverage         
        Expense__c exp = new Expense__c(Date__c = System.Today(), Amount__c = 12345.00);
        ExpensesController.saveExpense(exp);
        
        List<Expense__c> expList = ExpensesController.getExpenses();
        System.assertEquals(1, expList.size());
    }

}