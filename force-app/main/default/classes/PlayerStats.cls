public class PlayerStats {
    
    public static Map<Id, Decimal> playersRunsMap = new Map<Id, Decimal>();
    public static Map<Id, Decimal> playersWicketsMap = new Map<Id, Decimal>(); 
    public static Map<Id, Decimal> playersHighestMap = new Map<Id, Decimal>(); 
    public static Map<Id, Decimal> playersBattingAvgMap = new Map<Id, Decimal>(); 
    public static Map<Id, Decimal> playersEconomyMap = new Map<Id, Decimal>(); 
    public static Map<Id, Decimal> playersFoursMap = new Map<Id, Decimal>(); 
    public static Map<Id, Decimal> playersSixesMap = new Map<Id, Decimal>(); 
    public static Map<Id, Decimal> playersStrikeRateMap = new Map<Id, Decimal>(); 
    public static Map<Id, Decimal> playersCenturiesMap = new Map<Id, Decimal>(); 
    public static Map<Id, Decimal> playersHalfCenturiesMap = new Map<Id, Decimal>(); 
    public static Map<Id, Decimal> playersMaidensMap = new Map<Id, Decimal>(); 
    public static Map<Id, Decimal> playersDotsMap = new Map<Id, Decimal>();     
    public static Id maxRunPlayerId;
    public static Id maxWickesPlayerId;
    public static Id maxHighestPlayerId;
    public static Id maxBAPlayerId;
    public static Id maxEconomyPlayerId;
    public static Id maxFoursPlayerId;
    public static Id maxSixesPlayerId;
    public static Id maxSRPlayerId;
    public static Id maxCenturiesPlayerId;
    public static Id maxHalfCenturiesPlayerId;
    public static Id maxMaidensPlayerId;
    public static Id maxDotsPlayerId;
    
    public static void getPlayerStats(List<Player__c> newPlayerList){
        
        try{                
            for(Player__c player : newPlayerList){
                
                playersRunsMap.put(player.Id, player.Runs__c);    
                playersWicketsMap.put(player.Id, player.Wickets__c);
                playersHighestMap.put(player.Id, player.Highest__c);
                playersBattingAvgMap.put(player.Id, player.Average__c);
                playersEconomyMap.put(player.Id, player.Economy__c);
                playersFoursMap.put(player.Id, player.Fours__c);
                playersSixesMap.put(player.Id, player.Sixes__c);
                playersStrikeRateMap.put(player.Id, player.Strike_rate__c);
                playersCenturiesMap.put(player.Id, player.Centuries__c);
                playersHalfCenturiesMap.put(player.Id, player.Half_Centuries__c);
                playersMaidensMap.put(player.Id, player.Maidens__c);
                playersDotsMap.put(player.Id, player.Dots__c);                
                
                System.debug('newPlayerList : '+ newPlayerList);
                System.debug('plerRunsMap : '+ playersRunsMap);                
            }    
            
            insertStatsData(playersRunsMap, playersWicketsMap, playersHighestMap, playersBattingAvgMap, playersEconomyMap,
                            playersFoursMap, playersSixesMap, playersStrikeRateMap, playersCenturiesMap, playersHalfCenturiesMap,
                            playersMaidensMap, playersDotsMap);                           
        }catch(Exception e){
            HandleCustomException.LogException(e);
        }
    }
    
    public static void updatePlayerStats(Map<Id, Player__c> playerNewMap, Map<Id, Player__c> playerOldMap){
        
        try{                
            for(Player__c newPlayer : playerNewMap.values()){
                
                Player__c oldPlayer = playerOldMap.get(newPlayer.Id);
                
                if(newPlayer.Runs__c != oldPlayer.Runs__c || newPlayer.Wickets__c != oldPlayer.Wickets__c || 
                   newPlayer.Highest__c != oldPlayer.Highest__c || newPlayer.BRuns__c != oldPlayer.BRuns__c || 
                   newPlayer.Matches__c != oldPlayer.Matches__c || newPlayer.Fours__c != oldPlayer.Fours__c || 
                   newPlayer.Overs__c != oldPlayer.Overs__c || newPlayer.Sixes__c != oldPlayer.Sixes__c || 
                   newPlayer.Centuries__c != oldPlayer.Centuries__c || newPlayer.Half_Centuries__c != oldPlayer.Half_Centuries__c || 
                   newPlayer.Maidens__c != oldPlayer.Maidens__c || newPlayer.Dots__c != oldPlayer.Dots__c || 
                   newPlayer.BBalls__c != oldPlayer.BBalls__c){
                   
                      playersRunsMap.put(newPlayer.Id, newPlayer.Runs__c);    
                      playersWicketsMap.put(newPlayer.Id, newPlayer.Wickets__c);
                      playersHighestMap.put(newPlayer.Id, newPlayer.Highest__c);
                      playersBattingAvgMap.put(newPlayer.Id, newPlayer.Average__c);
                      playersEconomyMap.put(newPlayer.Id, newPlayer.Economy__c);
                      playersFoursMap.put(newPlayer.Id, newPlayer.Fours__c);
                      playersSixesMap.put(newPlayer.Id, newPlayer.Sixes__c);
                      playersStrikeRateMap.put(newPlayer.Id, newPlayer.Strike_rate__c);
                      playersCenturiesMap.put(newPlayer.Id, newPlayer.Centuries__c);
                      playersHalfCenturiesMap.put(newPlayer.Id, newPlayer.Half_Centuries__c);
                      playersMaidensMap.put(newPlayer.Id, newPlayer.Maidens__c);
                      playersDotsMap.put(newPlayer.Id, newPlayer.Dots__c);                
                      
                      System.debug('plerRunsMap : '+ playersRunsMap);   
                  }                                             
            }    
            
            insertStatsData(playersRunsMap, playersWicketsMap, playersHighestMap, playersBattingAvgMap, playersEconomyMap,
                            playersFoursMap, playersSixesMap, playersStrikeRateMap, playersCenturiesMap, playersHalfCenturiesMap,
                            playersMaidensMap, playersDotsMap);                           
        }catch(Exception e){
            HandleCustomException.LogException(e);
        }
    }
    
    public static void insertStatsData(Map<Id, Decimal> playersRunsMap, Map<Id, Decimal> playersWicketsMap, 
                                       Map<Id, Decimal> playersHighestMap, Map<Id, Decimal> playersBattingAvgMap, 
                                       Map<Id, Decimal> playersEconomyMap, Map<Id, Decimal> playersFoursMap, 
                                       Map<Id, Decimal> playersSixesMap, Map<Id, Decimal> playersStrikeRateMap, 
                                       Map<Id, Decimal> playersCenturiesMap, Map<Id, Decimal> playersHalfCenturiesMap, 
                                       Map<Id, Decimal> playersMaidensMap, Map<Id, Decimal> playersDotsMap                          
                                      ){
                                          
                                          maxRunPlayerId = getMostRuns(playersRunsMap);
                                          maxWickesPlayerId = getMostWickets(playersWicketsMap);
                                          maxHighestPlayerId = getHighest(playersHighestMap);
                                          maxBAPlayerId = getBestBettingAverage(playersBattingAvgMap);
                                          maxEconomyPlayerId = getBestEconomy(playersEconomyMap);
                                          maxFoursPlayerId = getMostFours(playersFoursMap);
                                          maxSixesPlayerId = getMostSixes(playersSixesMap);
                                          maxSRPlayerId = getBestStrikeRate(playersStrikeRateMap);
                                          maxCenturiesPlayerId = getMostCenturies(playersCenturiesMap);
                                          maxHalfCenturiesPlayerId = getMostHalfCenturies(playersHalfCenturiesMap);
                                          maxMaidensPlayerId = getMostMaidens(playersMaidensMap);
                                          maxDotsPlayerId = getMostDots(playersDotsMap);
                                          
                                          System.debug('most runs player id : '+ maxRunPlayerId);
                                          
                                          Stats__c stats = new Stats__c();
                                          stats.Most_Runs__c = maxRunPlayerId;
                                          stats.Most_Wickets__c = maxWickesPlayerId;
                                          stats.Highest__c = maxHighestPlayerId;
                                          stats.Best_Batting_Average__c = maxBAPlayerId;
                                          stats.Best_Economy__c = maxEconomyPlayerId;
                                          stats.Most_Fours__c = maxFoursPlayerId;
                                          stats.Most_Sixes__c = maxSixesPlayerId;
                                          stats.Best_Strike_Rate__c = maxSRPlayerId;
                                          stats.Most_Centuries__c = maxCenturiesPlayerId;
                                          stats.Most_Half_Centuries__c = maxHalfCenturiesPlayerId;
                                          stats.Most_Maidens__c = maxMaidensPlayerId;
                                          stats.Most_Dots__c = maxDotsPlayerId;
                                          
                                          insert stats;  
                                      }
    
    public static Id getMostRuns(Map<Id, Decimal> getPlayersRunsMap){
        
        try{
            Decimal maxRun = 0;
            Id playerMaxRunId;
            for(Id playerId : getPlayersRunsMap.keySet()){
                
                Decimal playerRun = getPlayersRunsMap.get(playerId);
                if(playerRun > maxRun){
                    
                    maxRun = playerRun;
                    playerMaxRunId = playerId;
                }
            }
            return playerMaxRunId;
        }catch(Exception e){
            HandleCustomException.LogException(e);
            return null;
        }
    }
    
    public static Id getMostWickets(Map<Id, Decimal> getPlayersWicketsMap){
        
        try{
            Decimal maxWickets = 0;
            Id playerMaxWicketsId;
            for(Id playerId : getPlayersWicketsMap.keySet()){
                
                Decimal playerWickets = getPlayersWicketsMap.get(playerId);
                if(playerWickets > maxWickets){
                    
                    maxWickets = playerWickets;
                    playerMaxWicketsId = playerId;
                }
            }
            return playerMaxWicketsId;
        }catch(Exception e){
            HandleCustomException.LogException(e);
            return null;
        }
    }
    
    public static Id getHighest(Map<Id, Decimal> getPlayersHighestMap){
        
        try{
            Decimal maxHighest = 0;
            Id playerMaxHighestId;
            for(Id playerId : getPlayersHighestMap.keySet()){
                
                Decimal playerHighest = getPlayersHighestMap.get(playerId);
                if(playerHighest > maxHighest){
                    
                    maxHighest = playerHighest;
                    playerMaxHighestId = playerId;
                }
            }
            return playerMaxHighestId;
        }catch(Exception e){
            HandleCustomException.LogException(e);
            return null;
        }
    }
    
    public static Id getBestBettingAverage(Map<Id, Decimal> getPlayersBattingAvgMap){
        
        try{
            Decimal maxBA = 0;
            Id playerMaxBAId;
            for(Id playerId : getPlayersBattingAvgMap.keySet()){
                
                Decimal playerBA = getPlayersBattingAvgMap.get(playerId);
                if(playerBA > maxBA){
                    
                    maxBA = playerBA;
                    playerMaxBAId = playerId;
                }
            }
            return playerMaxBAId;
        }catch(Exception e){
            HandleCustomException.LogException(e);
            return null;
        }
    }
    
    public static Id getBestEconomy(Map<Id, Decimal> getPlayersEconomyMap){
        
        try{
            Decimal maxEconomy = 0;
            Id playerMaxEconomyId;
            for(Id playerId : getPlayersEconomyMap.keySet()){
                
                Decimal playerEconomy = getPlayersEconomyMap.get(playerId);
                if(playerEconomy > maxEconomy){
                    
                    maxEconomy = playerEconomy;
                    playerMaxEconomyId = playerId;
                }
            }
            return playerMaxEconomyId;
        }catch(Exception e){
            HandleCustomException.LogException(e);
            return null;
        }
    }
    
    public static Id getMostFours(Map<Id, Decimal> getPlayersFoursMap){
        
        try{
            Decimal maxFours = 0;
            Id playerMaxFoursId;
            for(Id playerId : getPlayersFoursMap.keySet()){
                
                Decimal playerFours = getPlayersFoursMap.get(playerId);
                if(playerFours > maxFours){
                    
                    maxFours = playerFours;
                    playerMaxFoursId = playerId;
                }
            }
            return playerMaxFoursId;
        }catch(Exception e){
            HandleCustomException.LogException(e);
            return null;
        }
    }
    
    public static Id getMostSixes(Map<Id, Decimal> getPlayersSixesMap){
        
        try{
            Decimal maxSixes = 0;
            Id playerMaxSixesId;
            for(Id playerId : getPlayersSixesMap.keySet()){
                
                Decimal playerSixes = getPlayersSixesMap.get(playerId);
                if(playerSixes > maxSixes){
                    
                    maxSixes = playerSixes;
                    playerMaxSixesId = playerId;
                }
            }
            return playerMaxSixesId;
        }catch(Exception e){
            HandleCustomException.LogException(e);
            return null;
        }
    }
    
    public static Id getBestStrikeRate(Map<Id, Decimal> getPlayersStrikeRateMap){
        
        try{
            Decimal maxSR = 0;
            Id playerMaxSRId;
            for(Id playerId : getPlayersStrikeRateMap.keySet()){
                
                Decimal playerSR = getPlayersStrikeRateMap.get(playerId);
                if(playerSR > maxSR){
                    
                    maxSR = playerSR;
                    playerMaxSRId = playerId;
                }
            }
            return playerMaxSRId;
        }catch(Exception e){
            HandleCustomException.LogException(e);
            return null;
        }
    }
    
    public static Id getMostCenturies(Map<Id, Decimal> getPlayersCenturiesMap){
        
        try{
            Decimal maxCenturies = 0;
            Id playerMaxCenturiesId;
            for(Id playerId : getPlayersCenturiesMap.keySet()){
                
                Decimal playerCenturies = getPlayersCenturiesMap.get(playerId);
                if(playerCenturies > maxCenturies){
                    
                    maxCenturies = playerCenturies;
                    playerMaxCenturiesId = playerId;
                }
            }
            return playerMaxCenturiesId;
        }catch(Exception e){
            HandleCustomException.LogException(e);
            return null;
        }
    }
    
    public static Id getMostHalfCenturies(Map<Id, Decimal> getPlayersHalfCenturiesMap){
        
        try{
            Decimal maxHalfCenturies = 0;
            Id playerMaxHalfCenturiesId;
            for(Id playerId : getPlayersHalfCenturiesMap.keySet()){
                
                Decimal playerHalfCenturies = getPlayersHalfCenturiesMap.get(playerId);
                if(playerHalfCenturies > maxHalfCenturies){
                    
                    maxHalfCenturies = playerHalfCenturies;
                    playerMaxHalfCenturiesId = playerId;
                }
            }
            return playerMaxHalfCenturiesId;
        }catch(Exception e){
            HandleCustomException.LogException(e);
            return null;
        }
    }
    
    public static Id getMostMaidens(Map<Id, Decimal> getPlayersMaidensMap){
        
        try{
            Decimal maxMaidens = 0;
            Id playerMaxMaidensId;
            for(Id playerId : getPlayersMaidensMap.keySet()){
                
                Decimal playerMaidens = getPlayersMaidensMap.get(playerId);
                if(playerMaidens > maxMaidens){
                    
                    maxMaidens = playerMaidens;
                    playerMaxMaidensId = playerId;
                }
            }
            return playerMaxMaidensId;
        }catch(Exception e){
            HandleCustomException.LogException(e);
            return null;
        }
    }
    
    public static Id getMostDots(Map<Id, Decimal> getPlayersDotsMap){
        
        try{
            Decimal maxDots = 0;
            Id playerMaxDotsId;
            for(Id playerId : getPlayersDotsMap.keySet()){
                
                Decimal playerDots = getPlayersDotsMap.get(playerId);
                if(playerDots > maxDots){
                    
                    maxDots = playerDots;
                    playerMaxDotsId = playerId;
                }
            }
            return playerMaxDotsId;
        }catch(Exception e){
            HandleCustomException.LogException(e);
            return null;
        }
    }
}

//String myName;
//myName.toUpperCase();
/*Contact cont = new Contact();
cont.FirstName ='Apex';
insert cont;*/