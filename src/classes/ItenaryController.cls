public class ItenaryController {
    
    public Itenary__c ItenaryRecord {get; set;}
    
    public ItenaryController()
    {
        string IdValue = 'a0061000003Y11R';
        ItenaryRecord = [select id, name, Amount__c, 
                         Amount_Paid_Date__c, Approval_Status__c,
                         Invoice_Email__c 
                         from Itenary__c 
                         where id = : IdValue];
        
    }
    
    public pageReference save() 
    { 
        
        //pageReference p = new pageReference('http://google.com');
       	testExecutionContext  test = new testExecutionContext();
        string teststring = test.classMethod();
        update ItenaryRecord;
        return null;
    }
}