import { LightningElement,track } from 'lwc';

export default class Bmicalculator extends LightningElement {

  @track  bMiData ={
        height : 0,
        weight : 0,
        result :0
    }
    
        onWeigthChange(event){
            this.bMiData.weight=event.target.value;

        }
        onheightChange(event){
            this.bMiData.height=event.target.value;
        }
        CalculaterBMI(){
            try{
                this.bMiData.result = this.bMiData.weight/(this.bMiData.height*this.bMiData.height);
            }catch(error){
                this.bMiData.result =undefined;
            }
            
        }
}