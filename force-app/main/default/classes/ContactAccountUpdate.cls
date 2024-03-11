public class ContactAccountUpdate {

    public static void updateContactAccountId(Map<Id, Contact> newConMap, Map<Id, Contact> oldConMap){
        
        List<Contact> conNewList = [SELECT Id, Name FROM Contact WHERE Id IN :newConMap.keySet()];
        System.debug('conNewList : ' + conNewList);
        
        for(Contact con : newConMap.values()){
            
            Contact oldCon = oldConMap.get(con.Id);
            
            System.debug('oldCon Account Id : '+oldCon.AccountId);
            System.debug('newCon Account Id : '+con.AccountId);
            
            if(con.AccountId != oldCon.AccountId){
                
                Id updatedConId = oldCon.AccountId;
                System.debug('oldcon Account Id in if conditoin : '+ updatedConId);
                System.debug('oldcon name : '+ [SELECT Id, Name FROM Contact WHERE Id = :oldCon.Id].Name);
                System.debug('newcon name : '+ [SELECT Id, Name FROM Contact WHERE Id = :con.Id].Name);
                con.Title = [SELECT Id, Name FROM Account WHERE Id = :con.AccountId LIMIT 1].Name + ' Title';
                //con.Title = con.AccountId + ' Title';
            }
        }
    }
}