import { api, LightningElement } from 'lwc';

export default class EnrollCourse extends LightningElement {

 @api courseDetailInfo = {courseName:'Lightning Web Component',
                           courseDuration:'30 Days',courseFee:'1,000', 
                           courseRating:'*****'}

}