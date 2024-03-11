import { LightningElement, api, track, wire } from 'lwc';
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
import getPlayersData from '@salesforce/apex/FatchPlayersData.getPlayersData';
import { NavigationMixin } from 'lightning/navigation';

export default class LeadingPlayers extends NavigationMixin(LightningElement) {

    recordId1 = '';
    recordId2 = '';
    recordId3 = '';
    recordId4 = '';
    recordId5 = '';
    recordId6 = '';
    recordId7 = '';
    recordId8 = '';
    recordId9 = '';
    recordId10 = '';
    recordId11 = '';
    recordId12 = '';
    fullName1 = '';
    fullName2 = '';
    fullName3 = '';
    fullName4 = '';
    fullName5 = '';
    fullName6 = '';
    fullName7 = '';
    fullName8 = '';
    fullName9 = '';
    fullName10 = '';
    fullName11 = '';
    fullName12 = '';

    country1 = '';
    country2 = '';
    country3 = '';
    country4 = '';
    country5 = '';
    country6 = '';
    country7 = '';
    country8 = '';
    country9 = '';
    country10 = '';
    country11 = '';
    country12 = '';

    players = [];
    imageUrl1 = viratKohali;
    imageUrl2 = ravindraJadeja;
    imageUrl3 = rohitSharma;
    imageUrl4 = suryaKumarYadav;
    imageUrl5 = jaspritBumrah;
    imageUrl6 = arshdeepSingh;
    imageUrl7 = rishabhPant;
    imageUrl8 = hardikPandya;
    imageUrl9 = AksharPatel;
    imageUrl10 = klRahul;
    imageUrl11 = ravindraChandranAshwin;
    imageUrl12 = mohammadShami;

    //Get players data from Player__c object.
    @wire(getPlayersData)
    wirePlayersData({ error, data }) {
        if (data) {
            this.players = data;

            console.log(this.players);

            this.players.forEach(ply => {
                if (ply.Name == 'Virat') {
                    this.recordId1 = ply.Id;
                    this.fullName1 = ply.Name + ' ' + ply.Last_Name__c;
                    this.country1 = ply.Country__c;
                } else if (ply.Name == 'Ravindra') {
                    this.recordId2 = ply.Id;
                    this.fullName2 = ply.Name + ' ' + ply.Last_Name__c;
                    this.country2 = ply.Country__c;
                } else if (ply.Name == 'Rohit') {
                    this.recordId3 = ply.Id;
                    this.fullName3 = ply.Name + ' ' + ply.Last_Name__c;
                    this.country3 = ply.Country__c;
                } else if (ply.Name == 'Surya Kumar') {
                    this.recordId4 = ply.Id;
                    this.fullName4 = ply.Name + ' ' + ply.Last_Name__c;
                    this.country4 = ply.Country__c;
                } else if (ply.Name == 'Jasprit') {
                    this.recordId5 = ply.Id;
                    this.fullName5 = ply.Name + ' ' + ply.Last_Name__c;
                    this.country5 = ply.Country__c;
                } else if (ply.Name == 'Arshdeep') {
                    this.recordId6 = ply.Id;
                    this.fullName6 = ply.Name + ' ' + ply.Last_Name__c;
                    this.country6 = ply.Country__c;
                } else if (ply.Name == 'Rishabh') {
                    this.recordId7 = ply.Id;
                    this.fullName7 = ply.Name + ' ' + ply.Last_Name__c;
                    this.country7 = ply.Country__c;
                } else if (ply.Name == 'Hardik') {
                    this.recordId8 = ply.Id;
                    this.fullName8 = ply.Name + ' ' + ply.Last_Name__c;
                    this.country8 = ply.Country__c;
                } else if (ply.Name == 'Akshar') {
                    this.recordId9 = ply.Id;
                    this.fullName9 = ply.Name + ' ' + ply.Last_Name__c;
                    this.country9 = ply.Country__c;
                } else if (ply.Name == 'KL') {
                    this.recordId10 = ply.Id;
                    this.fullName10 = ply.Name + ' ' + ply.Last_Name__c;
                    this.country10 = ply.Country__c;
                } else if (ply.Name == 'RavindraChandran') {
                    this.recordId11 = ply.Id;
                    this.fullName11 = ply.Name + ' ' + ply.Last_Name__c;
                    this.country11 = ply.Country__c;
                } else if (ply.Name == 'Mohammad') {
                    this.recordId12 = ply.Id;
                    this.fullName12 = ply.Name + ' ' + ply.Last_Name__c;
                    this.country12 = ply.Country__c;
                }
            });

        } else if (error) {
            console.log('There is a problem in fatching data of player.');
        }
    }

    handleImageUrl1() {
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: this.recordId1,
                actionName: 'view'
            }
        });
    }

    handleImageUrl2() {
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: this.recordId2,
                actionName: 'view'
            }
        });
    }

    handleImageUrl3() {
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: this.recordId3,
                actionName: 'view'
            }
        });
    }

    handleImageUrl4() {
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: this.recordId4,
                actionName: 'view'
            }
        });
    }

    handleImageUrl5() {
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: this.recordId5,
                actionName: 'view'
            }
        });
    }

    handleImageUrl6() {
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: this.recordId6,
                actionName: 'view'
            }
        });
    }

    handleImageUrl7() {
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: this.recordId7,
                actionName: 'view'
            }
        });
    }

    handleImageUrl8() {
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: this.recordId8,
                actionName: 'view'
            }
        });
    }

    handleImageUrl9() {
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: this.recordId9,
                actionName: 'view'
            }
        });
    }

    handleImageUrl10() {
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: this.recordId10,
                actionName: 'view'
            }
        });
    }

    handleImageUrl11() {
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: this.recordId11,
                actionName: 'view'
            }
        });
    }

    handleImageUrl12() {
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: this.recordId12,
                actionName: 'view'
            }
        });
    }

    handleMouseOver(event) {

        let image = '';
        const myImg = event.target.dataset.id;
        image = this.chooseImage(myImg);        

        console.log('image is : ' + image);
        console.log('my image is : ' + myImg);

        image.classList.add('zoom');
    }

    handleMouseLeave(event) {

        let image = '';
        const myImg = event.target.dataset.id;
        image = this.chooseImage(myImg);        

        console.log('image is : ' + image);
        console.log('my image is : ' + myImg);

        image.classList.remove('zoom');
    }

    chooseImage(myImg){

        switch (myImg) {
            case 'image1':
                return this.template.querySelector('img[data-id="image1"]');
                
            case 'image2':
                return this.template.querySelector('img[data-id="image2"]');
                
            case 'image3':
                return this.template.querySelector('img[data-id="image3"]');
                
            case 'image4':
                return this.template.querySelector('img[data-id="image4"]');
                
            case 'image5':
                return this.template.querySelector('img[data-id="image5"]');
                
            case 'image6':
                return this.template.querySelector('img[data-id="image6"]');
                
            case 'image7':
                return this.template.querySelector('img[data-id="image7"]');
                
            case 'image8':
                return this.template.querySelector('img[data-id="image8"]');
                
            case 'image9':
                return this.template.querySelector('img[data-id="image9"]');
                
            case 'image10':
                return this.template.querySelector('img[data-id="image10"]');
                
            case 'image11':
                return this.template.querySelector('img[data-id="image11"]');
                
            case 'image12':
                return this.template.querySelector('img[data-id="image12"]');
                
            default:
                console.log('Unknowm Error...');
                return '';
                
        }
    }
}