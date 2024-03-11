trigger AccountTrigger on Account (before insert, before update) {

    if(Trigger.isBefore){
        if(Trigger.isInsert){
            CheckUnCheckPrimeAccountOnAccount.conditionalPrimeAccount(Trigger.new);
        }
        if(Trigger.isUpdate){
            CheckUnCheckPrimeAccountOnAccount.updatePrimeAccount(Trigger.new, Trigger.oldMap);
        }
    }
}