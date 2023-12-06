import { LightningElement } from 'lwc';
import AccountControllers from '@salesforce/apex/AccountController.fetchAccounts';

export default class AllCourseForEach extends LightningElement {

    allCourseDetails =[
        {courseName:'LWC',courseDuration:'20Days'},
        {courseName:'Integration',courseDuration:'30Days'},
        {courseName:'Aura Componnet',courseDuration:'20Days'},
        {courseName:'Design pattern',courseDuration:'30Days'}
    ];
}