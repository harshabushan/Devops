import { LightningElement } from 'lwc';

export default class CourseFee extends LightningElement {

    courseName ='salesforce Lightning Web component';
    courseFee ='200';
    numberOfStudents ='10';
    totalCourseFee ='200';
    
    changeCourseFee(event){

        this.courseFee = event.target.value;
        this.calculateTotal();
    }
    changeNoOfStud(event){
   
        this.numberOfStudents = event.target.value;
        this.calculateTotal();

    } 
    
    calculateTotal(){
        this.totalCourseFee =parseFloat(this.courseFee) * parseFloat(this.numberOfStudents);

    }
}