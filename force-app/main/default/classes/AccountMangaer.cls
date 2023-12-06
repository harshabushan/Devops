public with sharing class AccountMangaer {
    
    @AuraEnabled(cacheable=true)
    public static list<Account> getAccount(Integer numberOfRecords){
        return [SELECT Id,Name,Phone FROM Account Limit :numberOfRecords];
           }
}