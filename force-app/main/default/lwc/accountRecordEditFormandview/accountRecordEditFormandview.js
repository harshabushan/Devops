import { LightningElement,track } from 'lwc';

export default class AccountRecordEditFormandview extends LightningElement {
    
    @track recordId;
    handleSuccess(event){
        this.recordId=event.detail.id;


    }
}