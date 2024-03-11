@isTest
public class ManOfTheMatchTest {        
    
    @isTest 
    public static void manOfTheMatchPlayer(){
        
        Test.startTest();
        
        List<Match__c> matchList = new List<Match__c>();        
        List<Player__c> playerList = new List<Player__c>();
        List<Franchise__c> franchiseList = new List<Franchise__c>();
        
        Franchise__c franchise1 = new Franchise__c(Name = 'India');
        franchiseList.add(franchise1);
        Franchise__c franchise2 = new Franchise__c(Name = 'Pakistan');       
        franchiseList.add(franchise2);
        
        insert franchiseList;
        
        List<Franchise__c> queryFranchiseList = [SELECT Id, Name FROM Franchise__c];
        
        Player__c player1 = new Player__c(Name = 'Virat', Last_Name__c = 'Kohali', Runs__c = 80, Fours__c = 6, Sixes__c = 3, Balls__c = 40, Wickets__c = 6, Maidens__c = 0, Dots__c = 0, BRuns__c = 0, Overs__c = 0, Centuries__c = 3, Franchise__c = queryFranchiseList[0].Id);
        playerList.add(player1);
        Player__c player2 = new Player__c(Name = 'Rohit', Last_Name__c = 'Sharma', Runs__c = 60, Fours__c = 4, Sixes__c = 4, Balls__c = 1900, Wickets__c = 0, Maidens__c = 0, Dots__c = 0, BRuns__c = 0, Overs__c = 0, Centuries__c = 4, Franchise__c = queryFranchiseList[0].Id);
        playerList.add(player2);
        Player__c player3 = new Player__c(Name = 'Ravindra chandran', Last_Name__c = 'Ashwin', Runs__c = 0, Fours__c = 0, Sixes__c = 0, Balls__c = 0, Wickets__c = 0, Maidens__c = 0, Dots__c = 2, BRuns__c = 5, Overs__c = 2, Centuries__c = 0, Franchise__c = queryFranchiseList[0].Id);
        playerList.add(player3);
        Player__c player4 = new Player__c(Name = 'Babar', Last_Name__c = 'Azam', Runs__c = 80, Fours__c = 6, Sixes__c = 3, Balls__c = 40, Wickets__c = 6, Maidens__c = 0, Dots__c = 0, BRuns__c = 0, Overs__c = 0, Centuries__c = 3, Franchise__c = queryFranchiseList[1].Id);
        playerList.add(player4);
        Player__c player5 = new Player__c(Name = 'Rizwan', Last_Name__c = 'Khan', Runs__c = 10, Fours__c = 1, Sixes__c = 0, Balls__c = 20, Wickets__c = 0, Maidens__c = 10, Dots__c = 0, BRuns__c = 0, Overs__c = 0, Centuries__c = 2, Franchise__c = queryFranchiseList[1].Id);
        playerList.add(player5);
        Player__c player6 = new Player__c(Name = 'Mohammad', Last_Name__c = 'Ansari', Runs__c = 0, Fours__c = 0, Sixes__c = 0, Balls__c = 0, Wickets__c = 1, Maidens__c = 0, Dots__c = 4, BRuns__c = 4, Overs__c = 1, Centuries__c = 0, Franchise__c = queryFranchiseList[1].Id);
        playerList.add(player6);
        Player__c player7 = new Player__c(Name = 'Zahir', Last_Name__c = 'Khan', Runs__c = 0, Fours__c = 0, Sixes__c = 0, Balls__c = 0, Wickets__c = 2, Maidens__c = 0, Dots__c = 6, BRuns__c = 14, Overs__c = 2, Centuries__c = 0, Franchise__c = queryFranchiseList[0].Id);
        playerList.add(player7);
        Player__c player8 = new Player__c(Name = 'Shoyeb', Last_Name__c = 'Akhtar', Runs__c = 0, Fours__c = 0, Sixes__c = 0, Balls__c = 0, Wickets__c = 3, Maidens__c = 1, Dots__c = 8, BRuns__c = 4, Overs__c = 3, Centuries__c = 0, Franchise__c = queryFranchiseList[1].Id);
        playerList.add(player8);
        
        insert playerList;
        
        List<Player__c> queryPlayerList = [SELECT Id, Name, Last_Name__c, Franchise__c FROM Player__c];
        
        //Player__c getPlayer1 = [SELECT Id, Name, Last_Name__c, Runs__c, Franchise__c FROM Player__c WHERE Name = 'Virat'];
        
        Match__c match = new Match__c(Name = 'Ind_vs_Pak', Player_1__c = queryPlayerList[0].Id, 
                                      Player_2__c = queryPlayerList[1].Id, Player_6__c = queryPlayerList[2].Id, Player_1_T2__c = queryPlayerList[3].Id, 
                                      Player_2_T2__c = queryPlayerList[4].Id, Player_6_T2__c = queryPlayerList[5].Id, Team_1__c = queryFranchiseList[0].Id, 
                                      Team_2__c = queryFranchiseList[1].Id);
        
        matchList.add(match);                   
        
        insert matchList; 
        //ManOfTheMatch.getManOfTheMatch(matchList, null);
        
        List<String> matchIdsList = new List<String>();
        for(Match__c mt : matchList){
            matchIdsList.add(mt.Id);
        }
        
        System.debug('matchIdsList : ' + matchIdsList);
        
        List<Match__c> queryMatchList = [SELECT Id, Team_1__c, Team_2__c, Total__c,  Total_T2__c, Man_of_The_Match__c,
                                         
                                         Player_1__r.Centuries__c,  Player_2__r.Centuries__c, Player_3__r.Centuries__c, Player_6__r.Centuries__c,  Player_7__r.Centuries__c,
                                         Player_1__r.Name,Player_2__r.Name,Player_3__r.Name,Player_6__r.Name,Player_7__r.Name,
                                         Player_1__r.Runs__c, Player_2__r.Runs__c, Player_3__r.Runs__c,
                                         Player_1__c, Player_2__c, Player_3__c, Player_6__c, Player_7__c, 
                                         Player_1_Runs__c, Player_2_Runs__c, Player_3_Runs__c, Player_6_Runs__c, Player_7_Runs__c, 
                                         Fours_T1_1__c, Fours_T1_2__c, Fours_T1_3__c,  Fours_T1_6__c, Fours_T1_7__c, 
                                         Sixes_T1_1__c, Sixes_T1_2__c, Sixes_T1_3__c, Sixes_T1_6__c, Sixes_T1_7__c,
                                         
                                         Strike_Rate_T1_1__c, Strike_Rate_T1_2__c, Strike_Rate_T1_3__c, Strike_Rate_T1_6__c, Strike_Rate_T1_7__c, 
                                         Wickets_T1_1__c, Wickets_T1_2__c, Wickets_T1_3__c, Wickets_T1_6__c, Wickets_T1_7__c, 
                                         Maidens_T1_1__c, Maidens_T1_2__c, Maidens_T1_3__c, Maidens_T1_6__c, Maidens_T1_7__c,
                                         Dots_T1_1__c, Dots_T1_2__c, Dots_T1_3__c,  Dots_T1_6__c, Dots_T1_7__c,  
                                         Economy_T1_1__c, Economy_T1_2__c, Economy_T1_3__c, Economy_T1_6__c, Economy_T1_7__c,
                                         
                                         Player_1_T2__r.Centuries__c,  Player_2_T2__r.Centuries__c, Player_3_T2__r.Centuries__c, Player_6_T2__r.Centuries__c, Player_7_T2__r.Centuries__c, 
                                         Player_1_T2__r.Name, Player_2_T2__r.Name, Player_3_T2__r.Name, Player_6_T2__r.Name, Player_7_T2__r.Name,                                         
                                         Player_1_T2__r.Runs__c, Player_2_T2__r.Runs__c, Player_3_T2__r.Runs__c, Player_6_T2__r.Runs__c, Player_7_T2__r.Runs__c,
                                         Player_1_T2__r.Franchise__c, Player_2_T2__r.Franchise__c, Player_3_T2__r.Franchise__c, Player_6_T2__r.Franchise__c, Player_7_T2__r.Franchise__c,
                                         Player_1_T2__c, Player_2_T2__c, Player_3_T2__c, Player_6_T2__c, Player_7_T2__c,
                                         Fours_T2_1__c, Fours_T2_2__c, Fours_T2_3__c, Fours_T2_6__c, Fours_T2_7__c,      
                                         Sixes_T2_1__c, Sixes_T2_2__c, Sixes_T2_3__c, Sixes_T2_6__c, Sixes_T2_7__c, 
                                         
                                         Strike_Rate_T2_1__c, Strike_Rate_T2_2__c, Strike_Rate_T2_3__c, Strike_Rate_T2_6__c, Strike_Rate_T2_7__c, 
                                         Wickets_T2_1__c, Wickets_T2_2__c, Wickets_T2_3__c, Wickets_T2_6__c, Wickets_T2_7__c,
                                         Maidens_T2_1__c, Maidens_T2_2__c, Maidens_T2_3__c, Maidens_T2_6__c, Maidens_T2_7__c,
                                         Dots_T2_1__c, Dots_T2_2__c, Dots_T2_3__c, Dots_T2_6__c, Dots_T2_7__c,
                                         Economy_T2_1__c, Economy_T2_2__c, Economy_T2_3__c, Economy_T2_6__c, Economy_T2_7__c
                                         
                                         FROM Match__c WHERE Id IN :matchIdsList];                        
            
        queryMatchList[0].Team_2__c = queryFranchiseList[0].Id;
        queryMatchList[0].Player_6__c = queryPlayerList[6].Id;
        update queryMatchList; 
                        
        List<Match__c> queryMatchList1 = [SELECT Id, Player_1__r.BRuns__c, Player_1__r.Overs__c, Player_1__r.Centuries__c, Player_1_T2__r.Centuries__c, Player_6_T2__c FROM Match__c];
        queryMatchList1[0].Player_1__r.BRuns__c = 1;
        queryMatchList1[0].Player_1__r.Overs__c = 1;
        update queryMatchList1;                
        
        System.AssertEquals(1,queryMatchList1[0].Player_1__r.BRuns__c);
        System.AssertEquals(1,queryMatchList1[0].Player_1__r.Overs__c);
        
        Test.stopTest();
    }
}