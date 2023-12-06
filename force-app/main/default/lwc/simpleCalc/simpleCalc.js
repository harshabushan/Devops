import { LightningElement,track } from 'lwc';

export default class SimpleCalc extends LightningElement {
@track currentResult;
@track previousResult =[];
@track showpreviousResult = false;
firstNumber;
secondNumber;

numberChangeHandler(event){
    const inputBoxName = event.target.name;
    if(inputBoxName === 'firstNumber'){
        this.firstNumber = event.target.value;
    } else if(inputBoxName === 'secondNumber'){
        this.secondNumber = event.target.value;
    }
}
/*
numberChangeHandle(event){
        const inputBoxName =event.target.Name;
        if(inputBoxName === 'firstNumber'){
            this.firstNumber = event.target.value;
        } else if(inputBoxName === 'secondNumber'){
                this.secondNumber = event.target.value;
        }
    }

    addHandler(){
    const firstN =parseInt(this.firstNumber);
    const secondN =parseInt(this.secondNumber);
    //this.CurrentResult ='Result of ' +FirstN+'+'+SecN+'is' +(FirstN+SecN);
    // this.CurrentResult = `Result of ${FirstN}+${SecN} is ${FirstN+SecN}`;
    this.currentResult = `Result of ${firstN}+${secondN} is ${firstN+secondN}`;

    }
    */

    addHandler(){
        const firstN = parseInt(this.firstNumber);
        const secondN = parseInt(this.secondNumber);

        //this.currentResult = 'Result of '+firstN+'+'+secondN+' is '+(firstN+secondN);
        this.currentResult = `Result of ${firstN}+${secondN} is ${firstN+secondN}`;
        this.previousResult.push(this.currentResult)
    }
    subtractHandler(){
        const firstN = parseInt(this.firstNumber);
        const secondN = parseInt(this.secondNumber);

        //this.currentResult = 'Result of '+firstN+'+'+secondN+' is '+(firstN+secondN);
        this.currentResult = `Result of ${firstN}-${secondN} is ${firstN-secondN}`;
        this.previousResult.push(this.currentResult)
    }
    multiplyHandler(){
        const firstN = parseInt(this.firstNumber);
        const secondN = parseInt(this.secondNumber);

        //this.currentResult = 'Result of '+firstN+'+'+secondN+' is '+(firstN+secondN);
        this.currentResult = `Result of ${firstN}X${secondN} is ${firstN*secondN}`;
        this.previousResult.push(this.currentResult)
    }
    divideHandler(){
        const firstN = parseInt(this.firstNumber);
        const secondN = parseInt(this.secondNumber);

        //this.currentResult = 'Result of '+firstN+'+'+secondN+' is '+(firstN+secondN);
        this.currentResult = `Result of ${firstN}/${secondN} is ${firstN/secondN}`;
        this.previousResult.push(this.currentResult)
    }
    showPerviousResultToggle(event){
            this.showpreviousResult = event.target.checked;

    }
}