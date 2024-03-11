@isTest
public class MassDeleteStatsRecordsScheduleClassTest {

    @isTest public static void massDeleteRecord(){
        
        Test.startTest();
        
        String cron_Expression = '0 0 12 1 * ? *';
        String jobID = System.schedule('MassDeleteStatsRecordsTest',cron_Expression, new MassDeleteStatsRecordsScheduleClass());
        CronTrigger ct = [SELECT TimesTriggered, CronExpression, NextFireTime FROM CronTrigger WHERE Id = :jobID];
        
        System.assertEquals(cron_Expression, ct.CronExpression);     
        
        Test.stopTest();
    }
}