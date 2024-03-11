trigger ContactTrigger on Contact (before update) {

    if(Trigger.isBefore || Trigger.isAfter){
        
        if(Trigger.isUpdate){
            
            System.debug('apex class method is called...');
            ContactAccountUpdate.updateContactAccountId(Trigger.newMap, Trigger.oldMap);
        }
    }
}