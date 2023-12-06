public with sharing class caseManager {
   
    @AuraEnabled
    public static list<case> fetchCaseDetails(string caseNumber){
        if(string.isNotBlank(caseNumber)){
            string searchCase ='%'+caseNumber+'%';
            return [SELECT Id,Account.Name,CaseNumber,IsClosed,Origin,Description,Priority,Subject,Status
                    FROM CASE
                    where caseNumber like :searchCase];
        } 
        else{
            return NULL;
        }   
    }
}