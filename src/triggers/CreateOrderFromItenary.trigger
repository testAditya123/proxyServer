trigger CreateOrderFromItenary on Itenary__c (after insert, before update) {
    
 if(Trigger.isAfter)
 {
 list<Order__c> orderlist = new list<Order__c>();
    for(Itenary__c i : Trigger.new) 
    {
       Order__c o = new Order__c();
        o.name = i.name;
        o.Amount__c = i.Amount__c;
        o.Customer_Email__c = i.Invoice_Email__c;
        orderlist.add(o);
    }
   insert orderlist;
 }
   
    if(Trigger.isbefore)
    {
        for(Itenary__c i : Trigger.new) 
        {
            i.name = i.name + 'Updated';
        }
    }
}

/*
//Trigger Context Variables
Trigger.isbefore
Trigger.isAfter

Trigger.isInsert
Trigger.isUpdate
Trigger.isDelete
Trigger.isUnDelete


//one more set
Trigger.new  // list
Trigger.old
Trigger.newMap
Trigger.oldMap

//created
//created and Edited
//created and Edited to subsequently meet the criteria
//
//*/