global class BatchTravelPlan implements Database.Batchable<sObject>, schedulable{

    string Query = 'select id, name, Type__c from Travel_Plan__c';
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
     	system.debug('data : ' +database.getQueryLocator(Query));   
        return database.getQueryLocator(Query);
    }
    
    
    global void Execute(Database.BatchableContext BC, list<Travel_Plan__c> scope)
    {
        list<Travel_Plan__c> tplist = new list<Travel_Plan__c>();
        for(Travel_Plan__c  tp : scope)
        {
            
            system.debug('tp.name : ' +tp.name);
            system.debug('tp.Type__c : ' +tp.Type__c);
            if(tp.Type__c != null  && tp.name != tp.Type__c)
                 tp.Type__c = tp.Name;
            else
                tp.Type__c = tp.Name;
            tplist.add(tp);
            
        }
        update tplist;
    }
    
    global void finish(Database.BatchableContext BC)
    {
        
    }
    
    global void execute(SchedulableContext SC)
    {
        BatchTravelPlan b = new BatchTravelPlan();
        system.scheduleBatch(b, 'Travel Plan Batch', 2);
    }
             
}