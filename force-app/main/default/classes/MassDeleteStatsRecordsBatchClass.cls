global class MassDeleteStatsRecordsBatchClass implements Database.Batchable<sObject>{

    global Database.QueryLocator start(Database.BatchableContext bc){
        
        return Database.getQueryLocator('SELECT Id FROM Stats__c');
    }
    
    global void execute(Database.BatchableContext bc, List<Stats__c> scope){
        
        delete scope;
    }
    
    global void finish(Database.BatchableContext bc){
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {'rishirajvaishnav000@gmail.com'}; 
        email.setToAddresses(toAddresses);
        email.setSubject('Stats Deletion Batch Process Completed');
        email.setPlainTextBody('The batch process to delete Stats records has completed successfully.');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { email });
    }
}