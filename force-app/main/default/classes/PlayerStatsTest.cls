@isTest
public class PlayerStatsTest {

    @isTest
    public static void playerStats(){
        
        Test.startTest();
        
        List<Franchise__c> franchiseList = new List<Franchise__c>();
        List<Player__c> playerList = new List<Player__c>();        
        
        Franchise__c franchise1 = new Franchise__c(Name = 'India');
        franchiseList.add(franchise1);
        Franchise__c franchise2 = new Franchise__c(Name = 'Pakistan');       
        franchiseList.add(franchise2);
        
        insert franchiseList;
        
        List<Franchise__c> queryFranchiseList = [SELECT Id, Name FROM Franchise__c];
                
        Player__c player1 = new Player__c(Name = 'Virat', Last_Name__c = 'Kohali', Highest__c = 190, Matches__c = 12, Runs__c = 80, Fours__c = 6, Sixes__c = 3, Balls__c = 40, Wickets__c = 6, Maidens__c = 1, Dots__c = 10, BRuns__c = 2, Overs__c = 1, Half_Centuries__c = 4, Centuries__c = 5, Franchise__c = queryFranchiseList[0].Id);
        playerList.add(player1);
        Player__c player2 = new Player__c(Name = 'Rohit', Last_Name__c = 'Sharma', Highest__c = 240, Matches__c = 8, Runs__c = 60, Fours__c = 4, Sixes__c = 4, Balls__c = 60, Wickets__c = 0, Maidens__c = 0, Dots__c = 0, BRuns__c = 0, Overs__c = 0, Half_Centuries__c = 2, Centuries__c = 4, Franchise__c = queryFranchiseList[0].Id);
        playerList.add(player2);
        
        insert playerList;
        
        List<Player__c> queryPlayerList = [SELECT Name, Runs__c, Wickets__c, Highest__c, Average__c, Economy__c, Fours__c, 
                                           Sixes__c, Strike_rate__c, Centuries__c, Half_Centuries__c, Maidens__c, Dots__c, 
                                           Franchise__c FROM Player__c];
        
        List<Player__c> updatePlayerList = new List<Player__c>();
        
        for(Player__c ply : queryPlayerList){
            
            if(ply.Name.contains('Virat')){
                ply.Runs__c = 300;
                updatePlayerList.add(ply);
            }
        }               
        
        if(!updatePlayerList.isEmpty()){
            update updatePlayerList;
        }
        
        System.assertEquals(2, queryPlayerList.size());
        
        Test.stopTest();
    }
}

/*List<Player__c> plyList = [SELECT Name, Runs__c, Wickets__c, 
Highest__c, Average__c, Economy__c, Fours__c, Sixes__c, Strike_rate__c, Centuries__c, Half_Centuries__c, 
Maidens__c, Dots__c FROM Player__c];*/