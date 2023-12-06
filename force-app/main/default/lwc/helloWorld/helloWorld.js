import { LightningElement, track } from 'lwc';

export default class HelloWorld extends LightningElement {
   DynamicGreeting ='Hello World';

    handleFilesChange(event){
        this.DynamicGreeting=event.target.value;
    } 
}