import { LightningElement,track } from 'lwc';

export default class ConditionalRendering extends LightningElement {
    @track displayDiv =false;
  @track CityList =['Jaipur','Bangluru','Hyderbad','Mumabi'];
    ShowDivhandler(event){
       this.displayDiv = event.target.checked;
    }
}