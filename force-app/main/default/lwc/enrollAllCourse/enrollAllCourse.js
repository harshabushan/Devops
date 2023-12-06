import { LightningElement } from 'lwc';
import Id from '@salesforce/user/Id';


export default class EnrollAllCourse extends LightningElement {
    allCourseDetailInfo=[
        {courseName:'AUra Component',courseDuration:'25 Days',courseFee:'9,000', courseRating:'*****'},
        {courseName:'Apex development',courseDuration:'30 Days',courseFee:'7,000', courseRating:'*****'},
        {courseName:'Design pattern',courseDuration:'20 Days',courseFee:'15,000', courseRating:'*****'},
        {courseName:'Integration',courseDuration:'30 Days',courseFee:'12,000', courseRating:'*****'}
 
    ];

    userId =Id;

}