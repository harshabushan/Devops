import { LightningElement } from 'lwc';
 
export default class BasicCalculator extends LightningElement {
    firstInput;
    secondInput;
    thirdInput;
    totalValue; 
    snhowResult=false;  
    firstInputChange(evet){
        this.firstInput =  event.target.value;   
    } 
    secondInputChange(event){
        this.secondInput = event.target.value;
    }  
       add(event){
        this.totalValue = Number(this.firstInput) + Number(this.secondInput);
        this.showResult = true;
    }
    subtract(event){
        this.totalValue = Number(this.firstInput) - Number(this.secondInput); 
        this.showResult = true;
    }
    multipication(event){
        this.totalValue = Number(this.firstInput) * Number(this.secondInput); 
        this.showResult = true;
    }
    div(event){
        this.totalValue = Number(this.firstInput) / Number(this.secondInput); 
        this.showResult = true;
    }
}