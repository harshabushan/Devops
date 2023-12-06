import { LightningElement } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';

export default class Navigationpage extends NavigationMixin(LightningElement){

        NavigationtoAccHome(){
            this[NavigationMixin.Navigate]({
                type: 'standard__objectPage',
                attributes: {
                    objectApiName: 'Account',
                    actionName: 'home'
                },
            });
        }

        NavigationtoAccView(){
            this[NavigationMixin.Navigate]({
                type: 'standard__objectPage',
                attributes: {
                    objectApiName: 'Account',
                    actionName: 'list'
                },
                state: {
                    filterName: "AllAccounts", 
                }
            });
        }
}

