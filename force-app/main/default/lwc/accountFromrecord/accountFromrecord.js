import { LightningElement } from 'lwc';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import Phn_FIELD from '@salesforce/schema/Account.phone';
import WebSit_FIELD from '@salesforce/schema/Account.Website';
export default class AccountFromrecord extends LightningElement {
    recordId;
    //fieldsArray = ['Name','Phone','Website'];
   // fieldsArray = [NAME_FIELD,Phn_FIELD,WebSit_FIELD];
    handlesuccess(event){
        this.recordId =event.detail.id;
    }
}