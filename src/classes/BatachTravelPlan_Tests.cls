@isTest()
public class BatachTravelPlan_Tests {
    
    public static TestMethod void testBatchClass()
    {
        Travel_plan__c tp = new Travel_plan__c();
        tp.Type__c = 'test1';
        tp.Name = 'Batch Test1';
        tp.Hotel_Phone_No__c = '(234) 567-8901';
        insert tp;
        
       
        test.startTest();
        BatchTravelPlan b = new BatchTravelPlan();
        Database.executeBatch(b);
        
        Travel_plan__c tp2 = new Travel_plan__c();
        tp2.Type__c = 'test';
        tp2.Name = 'test';
        tp2.Hotel_Phone_No__c = '(234) 567-8901';
        insert tp2;
        
         Travel_plan__c tpbefore = [select id, name, Type__c from Travel_plan__c where id = : tp2.Id];
        system.debug('before batch : ' +tpbefore);
        
        BatchTravelPlan b2 = new BatchTravelPlan();
        Database.executeBatch(b2);
        test.stopTest();
        
        Travel_plan__c tpInserted = [select id, name, Type__c from Travel_plan__c where id = : tp2.Id];
        system.debug('After batch : ' +tpInserted);
        system.assertEquals(tpInserted.name, tpInserted.Type__c);
    }

}