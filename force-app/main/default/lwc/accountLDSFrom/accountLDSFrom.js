import { LightningElement,api } from 'lwc';

export default class AccountLDSFrom extends LightningElement {

    @api recordId;
    @api objectApiName;
    @api testClass;
}