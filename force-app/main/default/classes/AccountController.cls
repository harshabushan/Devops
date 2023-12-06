public with sharing class AccountController {
    public AccountController() {
        
    }
    
    public static void updateAvgCaseResolutionDays(List<Id> AccountIds){
        
        Map<id,Integer> accountTotalCaseMap = new Map<Id,Integer>();
        Map<id,Integer> accountTotalCaseDaysMap = new Map<Id,Integer>();    
        
        for(Case Caseobj :[Select Id,AccountId,CreatedDate, ClosedDate From Case
                           where IsClosed=TRUE and 
                           AccountId IN :AccountIds]){
                               
                               // if map does not have current Account id, then add it 
                               if(!accountTotalCaseMap.containsKey(Caseobj.AccountId)){
                                   accountTotalCaseMap.put(Caseobj.AccountId, 0);
                                   accountTotalCaseDaysMap.put(Caseobj.AccountId, 0);
                               }
                               Integer totalcase =accountTotalCaseMap.get(Caseobj.AccountId);
                               totalcase ++;                             
                               accountTotalCaseMap.put(Caseobj.AccountId, totalcase);
                               
                               Integer totalDays =accountTotalCaseDaysMap.get(Caseobj.AccountId);
                               totalDays += Caseobj.CreatedDate.date().daysBetween(Caseobj.ClosedDate.date());               
                               accountTotalCaseDaysMap.put(Caseobj.AccountId, totalDays);
                           } 
        List<Account> AccountUpdate =New List<Account>();    
        for(Id accountid :accountTotalCaseMap.keySet()){
            Decimal resoluationDays =accountTotalCaseDaysMap.get(accountid)/accountTotalCaseMap.get(accountid);
            AccountUpdate.add(new Account(Id=accountid, AvgCaseResolutiondays__c = resoluationDays)); 
        }
        update AccountUpdate;
    }
    @AuraEnabled    
    public static list<account> fetchAccounts(){
        List<Account> accList = [SELECT Id, Name, BillingState, 
                                 Website, Phone from Account LIMIT 20];
        return  accList;
        
    }
}