import { LightningElement } from 'lwc';

export default class ParentComp extends LightningElement {

   // message='i am from parent component fro attribute';

    handleClick(){
        this.message= 'Message changed';
        this.template.querySelector('c-child-comp').childCompMethod(this.message);
        // this.template.querySelector('c-child-comp') --> AccountController controller= new AccountController();
        // .chidcomp(this.message) --> controller.getmethod();

    }
    hadleEvent(event){
        let key =event.detail.key;
        let value =event.detail.value;
        this.message =key + '' + value;
        window.console.log('hellotest', this.message);
    }
}