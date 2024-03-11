import { LightningElement, api, wire, track } from 'lwc';
import viratKohali from '@salesforce/resourceUrl/ViratKohali';
import rohitSharma from '@salesforce/resourceUrl/RohitSharma';
import rishabhPant from '@salesforce/resourceUrl/RishabhPant';
import ravindraJadeja from '@salesforce/resourceUrl/RavindraJadeja';
import hardikPandya from '@salesforce/resourceUrl/HardikPandya';
import arshdeepSingh from '@salesforce/resourceUrl/ArshdeepSingh';
import jaspritBumrah from '@salesforce/resourceUrl/JaspritBumrah';
import suryaKumarYadav from '@salesforce/resourceUrl/SuryaKumarYadav';
import ravindraChandranAshwin from '@salesforce/resourceUrl/RavindraChandranAshwin';
import AksharPatel from '@salesforce/resourceUrl/AksharPatel';
import mohammadShami from '@salesforce/resourceUrl/MohammadShami';
import klRahul from '@salesforce/resourceUrl/KLRahul';
import getIndividualPlayerData from '@salesforce/apex/FatchPlayersData.getIndividualPlayerData';

export default class IndividualPlayerProfileData extends LightningElement {

    @api recordId;
    @api playerName;
    @api franchise;
    @api country;
    @api role;
    @api styles;
    @api age;
    @api playerImage;
    @api sixes;

    @track brand = 'brand';
    @track neutral = 'Neutral';
    @track playerRecord;
    @track isSixes = true;

    @track economyOrCenturies;
    @track economyOrCenturiesValue;
    @track oversORHalfCenturies;
    @track oversORHalfCenturiesValue;
    @track strikeRateType;
    @track strikeRateTypeValue;
    @track averageType;
    @track averageTypeValue;
    @track maidensOrHighScore;
    @track maidensOrHighScoreValue;
    @track wicketsOrFours;
    @track wicketsOrFoursValue;
    @track matchesTypeValue;
    @track inningsTypeValue;
    @track runsTypeValue;

    connectedCallback() {

        console.log('Record Id : ' + this.recordId);

        this.callPlayerDataMethod(this.recordId);
    }

    callPlayerDataMethod(recordId) {
        getIndividualPlayerData({ playerId: recordId })
            .then(player__c => {

                if (player__c) {

                    this.playerRecord = player__c;
                    this.playerImage = this.getPlayerImage(player__c);

                    console.log(player__c);

                    this.playerName = player__c.Name + ' ' + player__c.Last_Name__c;
                    this.franchise = player__c.Franchise__r.Name;
                    this.country = player__c.Country__c;
                    this.role = player__c.Role__c;
                    this.styles = player__c.Style__c;
                    this.age = player__c.Age__c;

                    this.battingData(player__c);
                }
            })  
            .catch(error => {

                console.error(error);
            });
    }

    getPlayerImage(player__c) {

        console.log('come for get player... : ' + player__c.Name);

        switch (player__c.Name) {
            case 'Virat':

                console.log('come for virat player...');

                return viratKohali;

            case 'Rohit':
                return rohitSharma;

            case 'Rishabh':
                return rishabhPant;

            case 'Ravindra':
                return ravindraJadeja;

            case 'Hardik':
                return hardikPandya;

            case 'Arshdeep':
                return arshdeepSingh;

            case 'Jasprit':
                return jaspritBumrah;

            case 'Surya Kumar':
                return suryaKumarYadav;

            case 'RavindraChandran':
                return ravindraChandranAshwin;

            case 'Akshar':
                return AksharPatel;

            case 'Mohammad':
                return mohammadShami;

            case 'KL':
                return klRahul;
            
            default:
                console.log('Unknowm Error...');
                return '';
        }
    }

    battingData(player__c) {

        this.matchesTypeValue = player__c.Matches__c;
        this.inningsTypeValue = player__c.Innings__c;
        this.runsTypeValue = player__c.Runs__c;
        this.ballsTypeValue = player__c.Balls__c;

        this.economyOrCenturies = 'Centuries';
        this.oversORHalfCenturies = 'Half Centuries';
        this.strikeRateType = 'Batting Strike Rate';
        this.averageType = 'Batting Average';
        this.maidensOrHighScore = 'High Score';
        this.wicketsOrFours = 'Fours';
        this.brand = 'brand';
        this.neutral = 'Neutral';
        this.economyOrCenturiesValue = player__c.Centuries__c;
        this.oversORHalfCenturiesValue = player__c.Half_Centuries__c;
        this.strikeRateTypeValue = player__c.Strike_rate__c;
        this.averageTypeValue = player__c.Average__c;
        this.maidensOrHighScoreValue = player__c.Highest__c;
        this.wicketsOrFoursValue = player__c.Fours__c;

        this.sixes = player__c.Sixes__c;
        this.isSixes = true;
    }

    handleBatting() {

        this.battingData(this.playerRecord);
    }

    handleBowling() {

        this.matchesTypeValue = this.playerRecord.BMatches__c;
        this.inningsTypeValue = this.playerRecord.BInnings__c;
        this.runsTypeValue = this.playerRecord.BRuns__c;
        this.ballsTypeValue = this.playerRecord.BBalls__c;

        this.economyOrCenturies = 'Economy';
        this.oversORHalfCenturies = 'Overs';
        this.maidensOrHighScore = 'Maidens';
        this.wicketsOrFours = 'Wickets';
        this.strikeRateType = 'Bowling Strike Rate';
        this.averageType = 'Bowling Average';
        this.economyOrCenturiesValue = this.playerRecord.Economy__c;
        this.oversORHalfCenturiesValue = this.playerRecord.Overs__c;
        this.strikeRateTypeValue = this.playerRecord.Bowling_strike_rate__c;
        this.averageTypeValue = this.playerRecord.Bowling_average__c;
        this.maidensOrHighScoreValue = this.playerRecord.Maidens__c;
        this.wicketsOrFoursValue = this.playerRecord.Wickets__c;

        this.brand = 'Neutral';
        this.neutral = 'brand';

        this.isSixes = false;
    }

    get isFranchiseRCB(){
 
        return this.franchise == 'RCB';
    }

    get isFranchiseLSG(){

        return this.franchise == 'LSG';
    }

    get isFranchiseDK(){

        return this.franchise == 'DK';
    }

    get isFranchiseCSK(){

        return this.franchise == 'CSK';
    }

    get isFranchiseGT(){

        return this.franchise == 'GT';
    }

    get isFranchiseKXIP(){

        return this.franchise == 'KXIP';
    }

    get isFranchiseMI(){

        return this.franchise == 'MI';
    }
}