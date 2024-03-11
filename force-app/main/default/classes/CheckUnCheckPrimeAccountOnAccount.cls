public class CheckUnCheckPrimeAccountOnAccount {    
    
    public static void conditionalPrimeAccount(List<Account> accNewList){
        
        for(Account acc : accNewList){
            
            if(acc.Rating != null && 
               (acc.Rating == 'Hot' || acc.Rating == 'Warm') && 
               acc.AccountNumber != null && 
               acc.AccountNumber != '' && 
               acc.Active__c != null && 
               acc.Active__c == 'Yes' 
              ){                
                acc.Prime_Account__c = true;                
              }else{
                  acc.Prime_Account__c = false;
              }
        }        
    }
    
    public static void updatePrimeAccount(List<Account> accNewList, Map<Id, Account> accOldMap){
        
        for(Account acc : accNewList){
            
            Account oldAcc = accOldMap.get(acc.Id);
            
            if(acc.Rating != null && 
               (acc.Rating == 'Hot' || acc.Rating == 'Warm') &&                
               acc.AccountNumber != null && 
               acc.AccountNumber != '' &&                
               acc.Active__c != null &&
               acc.Active__c == 'Yes' &&
               (acc.Active__c != oldAcc.Active__c || acc.Rating != oldAcc.Rating || acc.AccountNumber != oldAcc.AccountNumber)
              ){                  
                  acc.Prime_Account__c = true;                  
              }else{
                  acc.Prime_Account__c = false;
              }            
        }        
    }
}