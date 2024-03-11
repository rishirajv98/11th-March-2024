public class ManOfTheMatch {                    
    
    public static Map<String, Integer> playerPointsMap = new Map<String, Integer>();
    public static Map<String, String> playerFranchiseMap = new Map<String, String>();
    public static Map<String, Integer> playerCenturyMap = new Map<String, Integer>();
    public static Map<String, Integer> playerStrikeRateMap = new Map<String, Integer>();
    public static Map<String, Integer> player5WicektsMap = new Map<String, Integer>();
    public static Map<String, Integer> playerEconomyMap = new Map<String, Integer>();    
    public static List<String> listOfPlayerIds = new List<String>();
    public static Set<Id> playerIds = new Set<Id>();
    public static Set<Id> playerIdsList = new Set<Id>();             
    public static Integer playerTotalPoints = 0;
    public static Integer playerPoints = 0;   
    public static String maxPointsPlayerId;
    
    public static void getManOfTheMatch(List<Match__c> newMatchList){                                                                
        //if(!Test.isRunningTest()) {
        try{
            //String myName;
            //myName.toUpperCase();
            listOfPlayerIds.clear();
            for(Match__c newMatch : newMatchList){
                
                if (newMatch.Player_1__c != null || newMatch.Player_2__c != null || newMatch.Player_3__c != null || newMatch.Player_4__c != null ||
                    newMatch.Player_5__c != null || newMatch.Player_6__c != null || newMatch.Player_7__c != null || newMatch.Player_8__c != null ||
                    newMatch.Player_1_T2__c != null || newMatch.Player_2_T2__c != null || newMatch.Player_3_T2__c != null || newMatch.Player_4_T2__c != null ||
                    newMatch.Player_5_T2__c != null || newMatch.Player_6_T2__c != null || newMatch.Player_7_T2__c != null || newMatch.Player_8_T2__c != null 
                   ) {                                                            
                       playerIds.add(newMatch.Player_1__c);
                       playerIds.add(newMatch.Player_2__c);
                       playerIds.add(newMatch.Player_3__c);
                       playerIds.add(newMatch.Player_4__c);
                       playerIds.add(newMatch.Player_5__c);
                       playerIds.add(newMatch.Player_6__c);
                       playerIds.add(newMatch.Player_7__c);
                       playerIds.add(newMatch.Player_8__c);
                       playerIds.add(newMatch.Player_1_T2__c);
                       playerIds.add(newMatch.Player_2_T2__c);
                       playerIds.add(newMatch.Player_3_T2__c);
                       playerIds.add(newMatch.Player_4_T2__c);
                       playerIds.add(newMatch.Player_5_T2__c);
                       playerIds.add(newMatch.Player_6_T2__c);
                       playerIds.add(newMatch.Player_7_T2__c);
                       playerIds.add(newMatch.Player_8_T2__c);
                   }                
            }
            
            System.debug('playerIds : '+ playerIds); 
            
            calculatePlayersFromMap(playerIds, newMatchList);
        }catch(Exception e){
            HandleCustomException.LogException(e);
        }
        //}
    }
    
    public static void getupdatedManOfTheMatch(Map<Id, Match__c> newMatchMap, Map<Id, Match__c> oldMatchMap){               
        
        try{
            //String myName;
            //myName.toUpperCase();
            listOfPlayerIds.clear();
            for(Match__c newMatch : newMatchMap.values()){
                
                Match__c oldMatch = oldMatchMap.get(newMatch.Id);
                
                if (newMatch.Player_1__c != oldMatch.Player_1__c || 
                    newMatch.Player_2__c != oldMatch.Player_2__c ||
                    newMatch.Player_3__c != oldMatch.Player_3__c ||
                    newMatch.Player_4__c != oldMatch.Player_4__c ||
                    newMatch.Player_5__c != oldMatch.Player_5__c ||
                    newMatch.Player_6__c != oldMatch.Player_6__c ||
                    newMatch.Player_7__c != oldMatch.Player_7__c ||
                    newMatch.Player_8__c != oldMatch.Player_8__c ||
                    newMatch.Player_1_T2__c != oldMatch.Player_1_T2__c ||
                    newMatch.Player_2_T2__c != oldMatch.Player_2_T2__c ||
                    newMatch.Player_3_T2__c != oldMatch.Player_3_T2__c ||
                    newMatch.Player_4_T2__c != oldMatch.Player_4_T2__c ||
                    newMatch.Player_5_T2__c != oldMatch.Player_5_T2__c ||
                    newMatch.Player_6_T2__c != oldMatch.Player_6_T2__c ||
                    newMatch.Player_7_T2__c != oldMatch.Player_7_T2__c ||
                    newMatch.Player_8_T2__c != oldMatch.Player_8_T2__c
                   ) {                                                            
                       playerIdsList.add(newMatch.Player_1__c);
                       playerIdsList.add(newMatch.Player_2__c);
                       playerIdsList.add(newMatch.Player_3__c);
                       playerIdsList.add(newMatch.Player_4__c);
                       playerIdsList.add(newMatch.Player_5__c);
                       playerIdsList.add(newMatch.Player_6__c);
                       playerIdsList.add(newMatch.Player_7__c);
                       playerIdsList.add(newMatch.Player_8__c);
                       playerIdsList.add(newMatch.Player_1_T2__c);
                       playerIdsList.add(newMatch.Player_2_T2__c);
                       playerIdsList.add(newMatch.Player_3_T2__c);
                       playerIdsList.add(newMatch.Player_4_T2__c);
                       playerIdsList.add(newMatch.Player_5_T2__c);
                       playerIdsList.add(newMatch.Player_6_T2__c);
                       playerIdsList.add(newMatch.Player_7_T2__c);
                       playerIdsList.add(newMatch.Player_8_T2__c);
                   }                                        
            }
            
            System.debug('playerIdsList : '+ playerIdsList);                                       
            
            calculatePlayersFromMap(playerIdsList, newMatchMap.values());  
        }catch(Exception e){
            HandleCustomException.LogException(e);
        }
    }    
    
    public static void calculatePlayersFromMap(Set<Id> playerIds, List<Match__c> newMatchList){
        
        Map<Id, Player__c> playersMap = new Map<Id, Player__c>([SELECT Id, Name, Overs__c, BRuns__c, Balls__c, Runs__c, 
                                                                Wickets__c, Maidens__c, Strike_rate__c, Economy__c, 
                                                                Centuries__c, Fours__c, Sixes__c, Dots__c FROM Player__c 
                                                                WHERE Id IN :playerIds]);                                      	                                                                               
        for(Match__c newMatch : newMatchList){                                
            
            for(Player__c player : playersMap.values()){
                
                if(player.Id == newMatch.Player_1__c || player.Id == newMatch.Player_2__c || player.Id == newMatch.Player_3__c || 
                   player.Id == newMatch.Player_4__c || player.Id == newMatch.Player_5__c || player.Id == newMatch.Player_6__c ||
                   player.Id == newMatch.Player_7__c || player.Id == newMatch.Player_8__c){
                       
                       System.debug('~~~~~~ Team T1 ~~~~~~');
                       System.debug(' newMatch.Team_1__c : '+ newMatch.Team_1__c);
                       
                       playerTotalPoints = returnPoints(player.Runs__c, player.Fours__c, player.Sixes__c, player.Strike_rate__c, player.Wickets__c, player.Maidens__c, player.Dots__c, player.Economy__c);                                                                               
                       if(playerTotalPoints > 0){ 
                           
                           System.debug('player \"' + player.Name + '\" points (Team 1) : '+playerTotalPoints);
                           
                           putPlayerPointsInMapCollection(playerTotalPoints, player.Id, newMatch.Team_1__c, player.centuries__c, player.Strike_rate__c, player.Wickets__c, player.Economy__c);                                        
                       }
                   }
                if(player.Id == newMatch.Player_1_T2__c || player.Id == newMatch.Player_2_T2__c || player.Id == newMatch.Player_3_T2__c || 
                   player.Id == newMatch.Player_4_T2__c || player.Id == newMatch.Player_5_T2__c || player.Id == newMatch.Player_6_T2__c || 
                   player.Id == newMatch.Player_7_T2__c || player.Id == newMatch.Player_8_T2__c){
                       
                       System.debug('~~~~~~ Team T2 ~~~~~~');
                       System.debug(' newMatch.Team_2__c : '+ newMatch.Team_2__c);
                       
                       playerTotalPoints = returnPoints(player.Runs__c, player.Fours__c, player.Sixes__c, player.Strike_rate__c, player.Wickets__c, player.Maidens__c, player.Dots__c, player.Economy__c);                                                                               
                       if(playerTotalPoints > 0){   
                           
                           System.debug('player \"' + player.Name + '\" points (Team 2) : '+playerTotalPoints);
                           
                           putPlayerPointsInMapCollection(playerTotalPoints, player.Id, newMatch.Team_2__c, player.centuries__c, player.Strike_rate__c, player.Wickets__c, player.Economy__c);                                        
                       }
                   }
            }
            calculateManOfTheMatch(newMatch);                
        }                                        
    }
    
    public static void calculateManOfTheMatch(Match__c match){
        
        // Get Maximum points player Id.
        maxPointsPlayerId = getMaxPlayerId(match);  
        
        if(maxPointsPlayerId != null){
            match.Man_of_The_Match__c = maxPointsPlayerId;
        }
    }
    
    public static Integer returnPoints(Decimal pRuns, Decimal pFours, Decimal pSixes, Decimal pStrikeRate, Decimal pWickets, Decimal pMaiden, Decimal pDots, Decimal pEconomy){                
        
        System.debug('pRuns : '+ pRuns);
        System.debug('pFours : '+ pFours);
        System.debug('pSixes : '+ pSixes);
        System.debug('pStrikeRate : '+ pStrikeRate);
        System.debug('pWickets : '+ pWickets);
        System.debug('pMaiden : '+ pMaiden);
        System.debug('pDots : '+ pDots);        
        System.debug('pEconomy : '+ pEconomy);
        
        if(pRuns > 0){            
            playerPoints += (Integer)pRuns;
            if(pRuns > 50 && pRuns <= 100){
                playerPoints += 4;
            }else if(pRuns > 100){
                playerPoints += 8;
            }
        }
        System.debug('pRuns points : '+ playerPoints);
        if(pFours > 0){
            playerPoints += (Integer)pFours;
        }
        System.debug('pFours points : '+ playerPoints);
        if(pSixes > 0){
            playerPoints += (Integer)pSixes*2;
        }
        System.debug('pSixes points : '+ playerPoints);
        if(pStrikeRate > 150){
            playerPoints += 4;
        }                                
        System.debug('pStrikeRate points : '+ playerPoints);
        if(pWickets > 0){            
            playerPoints += (Integer)pWickets*15;
            if(pWickets >= 5){
                playerPoints += 10;
            }
        }
        System.debug('pWickets points : '+ playerPoints);
        if(pMaiden > 0){
            playerPoints += (Integer)pMaiden*6;
        }
        System.debug('pMaiden points : '+ playerPoints);
        if(pDots > 10){
            playerPoints += (Integer)pDots*3;
        }
        System.debug('pDots points : '+ playerPoints);
        if(pEconomy > 0 && pEconomy < 6.5){
            playerPoints += 3;
        }
        System.debug('pEconomy points : '+ playerPoints);
        return playerPoints;
    }
    
    public static void putPlayerPointsInMapCollection(Integer points, String playerId, String team, Decimal century, Decimal strikeRate, Decimal is5Wickets, Decimal economy){
        
        playerPointsMap.put(playerId, points);
        
        System.debug('playerPointsMap : '+ playerPointsMap);
        
        playerFranchiseMap.put(playerId, team);
        
        System.debug('playerFranchiseMap : '+ playerFranchiseMap.values());
        
        playerCenturyMap.put(playerId, (Integer)century);
        playerStrikeRateMap.put(playerId, (Integer)strikeRate);
        player5WicektsMap.put(playerId, (Integer)is5Wickets);
        playerEconomyMap.put(playerId, (Integer)economy);
        playerPoints = 0;   
    }
    
    public static String getMaxPlayerId(Match__c match){
        
        String maxPlayerId;
        
        if(!playerPointsMap.isEmpty()){
            
            Integer maxPoints1 = 0;
            Integer maxPoints2 = 0;			            
            for(String plyId : playerPointsMap.keySet()){                                                
                
                if(playerPointsMap.get(plyId) > maxPoints1){
                    maxPoints1 = playerPointsMap.get(plyId);  
                    maxPlayerId = plyId;
                }                                
                System.debug('value of MaxPoints1 in loop iteration : '+ maxPoints1);
            }
            
            System.debug('final value of MaxPoints1 : '+ maxPoints1);
            System.debug('playerPointsMap: '+ playerPointsMap);
            //System.debug('playerPointsList: '+ playerPointsList);
            
            for(String plyId : playerPointsMap.keySet()){                                           
                
                System.debug('maxPoints1 in iteration : ' + maxPoints1);
                System.debug('playerPointsMap.get(plyId) in iteration : ' + playerPointsMap.get(plyId));
                
                if(maxPoints1 == playerPointsMap.get(plyId)){
                    
                    System.debug('come inside ====> ');
                    
                    listOfPlayerIds.add(plyId);                                           
                }                                                
            }
            
            System.debug('Size of listOfPlayerIds : '+ listOfPlayerIds.size());
            
            if(listOfPlayerIds.size() >= 2){
                maxPoints2 = playerPointsMap.get(listOfPlayerIds[1]);
            }
            
            System.debug('maxPoints1 : ' + maxPoints1);
            System.debug('maxPoints2 : ' + maxPoints2);
            
            if(maxPoints1 == maxPoints2){
                
                System.debug('========1========');
                System.debug('playerFranchiseMap.get(listOfPlayerIds[0]) : '+ playerFranchiseMap.get(listOfPlayerIds[0]));
                System.debug('playerFranchiseMap.get(listOfPlayerIds[1]) : '+ playerFranchiseMap.get(listOfPlayerIds[1]));
                
                if(playerFranchiseMap.get(listOfPlayerIds[0]) != playerFranchiseMap.get(listOfPlayerIds[1])){
                    
                    System.debug('========2========');
                    System.debug('Both team total : '+ match.Total__c + '<==>' + match.Total_T2__c);
                    
                    if(match.Total__c > match.Total_T2__c){
                        
                        System.debug('========3========');
                        
                        maxPlayerId = listOfPlayerIds[0];
                    }else if(match.Total__c < match.Total_T2__c){
                        maxPlayerId = listOfPlayerIds[1];
                    }                    
                }else{
                    
                    if(playerCenturyMap.get(listOfPlayerIds[0]) == playerCenturyMap.get(listOfPlayerIds[1])){
                        System.debug('========4========');
                        if(playerStrikeRateMap.get(listOfPlayerIds[0]) == playerStrikeRateMap.get(listOfPlayerIds[1])){
                            System.debug('========5========');
                            if(player5WicektsMap.get(listOfPlayerIds[0]) == player5WicektsMap.get(listOfPlayerIds[1])){
                                System.debug('========6========');
                                if(playerEconomyMap.get(listOfPlayerIds[0]) == playerEconomyMap.get(listOfPlayerIds[1])){
                                    System.debug('========7========');
                                    maxPlayerId = listOfPlayerIds[0];
                                    System.debug('man of the match player Id in if condition : ' + maxPlayerId);
                                }else{
                                    System.debug('========7 else========');
                                    if(playerEconomyMap.get(listOfPlayerIds[0]) > playerEconomyMap.get(listOfPlayerIds[1])){
                                        maxPlayerId = listOfPlayerIds[0];
                                    }else if(playerEconomyMap.get(listOfPlayerIds[0]) < playerEconomyMap.get(listOfPlayerIds[1])){
                                        maxPlayerId = listOfPlayerIds[1];
                                    } 
                                }
                            }else{
                                System.debug('========6 else========');
                                if(player5WicektsMap.get(listOfPlayerIds[0]) > player5WicektsMap.get(listOfPlayerIds[1])){
                                    maxPlayerId = listOfPlayerIds[0];
                                }else if(player5WicektsMap.get(listOfPlayerIds[0]) < player5WicektsMap.get(listOfPlayerIds[1])){
                                    maxPlayerId = listOfPlayerIds[1];
                                } 
                            }
                        }else{
                            System.debug('========5 else========');
                            if(playerStrikeRateMap.get(listOfPlayerIds[0]) > playerStrikeRateMap.get(listOfPlayerIds[1])){
                                maxPlayerId = listOfPlayerIds[0];
                            }else if(playerStrikeRateMap.get(listOfPlayerIds[0]) < playerStrikeRateMap.get(listOfPlayerIds[1])){
                                maxPlayerId = listOfPlayerIds[1];
                            }
                        }
                    }else{
                        System.debug('========4 else========');
                        if(playerCenturyMap.get(listOfPlayerIds[0]) > playerCenturyMap.get(listOfPlayerIds[1])){
                            maxPlayerId = listOfPlayerIds[0];
                        }else if(playerCenturyMap.get(listOfPlayerIds[0]) < playerCenturyMap.get(listOfPlayerIds[1])){
                            maxPlayerId = listOfPlayerIds[1];
                        }
                    }							                                                                                                                
                }   
            }else{
                System.debug('========outer else========');
                maxPlayerId = listOfPlayerIds[0];                
            }                                   
        }  
        return maxPlayerId;
    }
}