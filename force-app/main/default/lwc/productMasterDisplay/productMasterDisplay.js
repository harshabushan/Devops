import { LightningElement,wire } from 'lwc';
import getAllProdlist from '@salesforce/apex/PorductManger.getAllProdlist';
import ProdListSelect from '@salesforce/apex/PorductManger.ProdListSelect';

export default class ProductMasterDisplay extends LightningElement {
     selectedAccount;
    accountOptions=[];
    errorDeatails;
 
    @wire(getAllProdlist)
    accountProcess({error,data}){
        if(data){
            this.errorDeatails = undefined;
           for(var i=0;i<data.length;i++){
                this.accountOptions = [...this.accountOptions,{value:data[i].Id,label:data[i].Name}];
           }
        }
        else if(error){
            this.data = undefined;
            this.errorDeatails = error;
        }
    }
    accountNameChange(event){
        this.selectedAccount = event.detail.value;
    }    
}