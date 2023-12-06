import { LightningElement,track,api} from 'lwc';
import fetchCaseDetails from '@salesforce/apex/caseManager.fetchCaseDetails';

export default class CaseManager extends LightningElement {   
    
        searchCaseNumber;
        cases;
        errorDetails;
        caseCloseMessage;
        caseNumberChange(event){
            this.searchCaseNumber = event.target.value;
            console.log('this.searchCaseNumber'+this.searchCaseNumber);
            fetchCaseDetails({caseNumber:this.searchCaseNumber})
            .then(result=>{
                this.cases = result;
            })
            .catch(error=>{
                this.errorDetails = error;
            });
        }

}