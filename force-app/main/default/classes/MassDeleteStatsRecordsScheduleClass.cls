//Schedular for every sunday to delete stats__c object records
//String jobID = System.schedule('MassDeleteStatsRecords',' 0 0 0 ? * SUN *', new MassDeleteStatsRecordsScheduleClass());
//CronTrigger ct = [SELECT TimesTriggered, NextFireTime FROM CronTrigger WHERE Id = :jobID];
//System.debug(ct);

global class MassDeleteStatsRecordsScheduleClass implements Schedulable {

    global void execute(SchedulableContext sc){
        
        Database.executeBatch(new MassDeleteStatsRecordsBatchClass());
    }
}