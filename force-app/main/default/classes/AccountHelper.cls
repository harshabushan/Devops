public with sharing class AccountHelper {    
    @AuraEnabled(cacheable=true)
    public static list<Account> getAccountList(){
        return [SELECT id,Name,Type,Rating,Phone, Website, AnnualRevenue FROM Account];
    }
}