public with sharing class FatchPlayersData {
    
    @auraEnabled(cacheable=true)
    public static List<Player__c> getPlayersData(){

        List<Player__c> playerList = [SELECT Id, Name, Last_Name__c, Country__c FROM Player__c];
        return playerList;
    }

    @auraEnabled(cacheable=true)
    public static Player__c getIndividualPlayerData(String playerId){

        List<Player__c> playerList = [SELECT Id, Name, DOB__c, Email__c, Phone__c, Birth_Place__c, Role__c, 
                                      Franchise__c, Franchise__r.Name, Matches__c, Innings__c, Runs__c, Balls__c, Highest__c, 
                                      Style__c, Half_Centuries__c, Ducks__c, Not_outs__c, Test_Played__c, 
                                      ODI_Played__c, T20_Played__c, IPL_Played__c, BMatches__c, BInnings__c, 
                                      Wickets__c, BBalls__c, Maidens__c, BRuns__c, BBM__c, Age__c, Average__c, 
                                      Strike_rate__c, Bowling_average__c, Bowling_strike_rate__c, Overs__c, 
                                      Economy__c, Centuries__c, Player_Rank__c, Last_Name__c, Fours__c, 
                                      Sixes__c, Dots__c, Bidding_price__c, Hike_Expected__c, Comments__c, Country__c 
                                      FROM Player__c WHERE Id = :playerId];
        return playerList[0];
    }
}