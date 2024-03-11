trigger MatchTrigger on Match__c (before insert, before update) {

    if(Trigger.isBefore){
        
        if(Trigger.isInsert){
            ManOfTheMatch.getManOfTheMatch(Trigger.new);
        }else if(Trigger.isUpdate){
            ManOfTheMatch.getupdatedManOfTheMatch(Trigger.newMap, Trigger.oldMap);
        }
    }
}