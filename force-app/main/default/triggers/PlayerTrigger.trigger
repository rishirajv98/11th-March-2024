trigger PlayerTrigger on Player__c (after insert, after update) {

    if(Trigger.isAfter){
        
        if(Trigger.isInsert){
            PlayerStats.getPlayerStats(Trigger.new);
        }else if(Trigger.isUpdate){
            PlayerStats.updatePlayerStats(Trigger.newMap, Trigger.oldMap);
        }
    }
}