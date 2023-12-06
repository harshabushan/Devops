import { LightningElement, api} from 'lwc';

export default class ChildComp extends LightningElement {

    @api message;

   @api
    childCompMethod(name){
     alert(name);
    this.message = name;

    }
    handleClick(){
        const event= new CustomEvent('btnclick', {
            detail: {
                key :'0015HSAAJ1',
                value :'Apexhours'
            }

        });
        this.dispatchEvent(event);


    }
}