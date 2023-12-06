import { LightningElement,wire,track } from 'lwc';
import getAllRecords from '@salesforce/apex/AccountMangaer.getAccount';
export default class AccountManageApex extends LightningElement {
 
  @track numberOfRecords;
  @track accounts
  responseReceived(){
    if(this.accounts){
      return true;
    }
    return false;
  }
  numberOfAccountChangeHandler(event){
    this.numberOfRecords = event.target.value;
  }
  getAccounts(){

   getAllRecords({
    numberOfRecords :this.numberOfRecords}).then(response =>{
      this.accounts =response;

    }).catch(error =>{
      console.error('Error in getting the Account', error.body.message);
      
    })
  }
 
  /*@wire(getAllRecords) accounts;

 responseReceived(){
   if(this.accounts){
     return true;
   }
   return false;
 }
 */
}