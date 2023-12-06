public with sharing class ContactController {
   
    @AuraEnabled
    public static List<contact> getContacts1() {
        List<Contact> contacts = 
        [SELECT Id, Name,Accountid, MailingStreet, Phone, Email, LeadSource FROM Contact];
        
        //Add isAccessible() check
        return contacts;

    }

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts() {
        return [
            SELECT Name, AnnualRevenue, Industry
            FROM Account
            WITH SECURITY_ENFORCED
            ORDER BY Name
        ];
    }
}