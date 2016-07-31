trigger SendEmailOnOrderInsert on order__c (after insert) {

    list<string> OwnerIdList = new list<string>();
    for(order__c ord : Trigger.new)
    	OwnerIdList.add(ord.OwnerId);
    
    map<id,User> idToUserMap = new map<id,User>([select id,name from user where id IN : OwnerIdList]);
    list< messaging.singleEmailMessage> allmessages = new list< messaging.singleEmailMessage>();
    for(order__c ord : Trigger.new)
    {
        messaging.singleEmailMessage msg = new messaging.singleEmailMessage(); //email, subject, cc, body
        list<string> tosendEmail = new list<string>();
        tosendEmail.add(ord.Customer_Email__c);
        msg.setToAddresses(tosendEmail);
        string subject = 'Your Order '+ ord.Name + ' is Ready to View.';
        msg.setSubject(subject);
        list<string> tosendEmailcc = new list<string>();
        tosendEmailcc.add('gambirvamshi@gmail.com');
        msg.setCcAddresses(tosendEmailcc);
       string body = '<!DOCTYPE html><html> <body><p>Hi ' + idToUserMap.get(ord.OwnerId).name + 
           							' welcome !! </br> The Order ' + ord.Name + ' is Ready. The order Amount is : ' 
           							+ ord.Amount__c + ' Please Pay On Time. </p></body></html>';
        msg.setHtmlBody(body);
        allmessages.add(msg);
    }
      Messaging.SendEmailResult[] results = Messaging.sendEmail(allmessages);

    
}