import { LightningElement,api } from 'lwc';
import lifecycleLWC1 from './lifecycleLWC';
export default class LifecycleLWC extends LightningElement {
 @api templateone ='templ1';

     constructor() {
        super();
        //code
        console.log('insise constructor');

    }
    connectedCallback() {
        //code
        console.log('insise connected Callback');
    }
    disconnectedCallback() {
        //code
        console.log('insise disconnected Callback');
    }
    changeTemplate(){
        console.log('insise changeTemplate LWC1');
        if(this.templateone ==='templ1'){
            this.templateone ==='templ2';
            
        }else{
            this.templateone ==='templ1';
        }
        
    }
    
}