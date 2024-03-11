@isTest
public class MassDeleteStatsRecordsBatchClassTest {

    @isTest public static void massDeleteStatsRecordTest(){
        
        Test.startTest();
        
        List<Stats__c> statsList = new List<Stats__c>();
        for(Integer statsCount = 0; statsCount < 200; statsCount++){
            
            statsList.add(new Stats__c());
        }
        insert statsList;
        
        Database.executeBatch(new MassDeleteStatsRecordsBatchClass());                
        
        Test.stopTest();
        
        Integer statsCount = [SELECT COUNT() FROM Stats__c];
        System.assertEquals(0, statsCount, 'All stats records is deleted.');
    }
}