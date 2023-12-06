public with sharing class ContactControlle {
   
    @AuraEnabled
    public static List<contact> getcontact() {
        List<Contact> contacts = 
        [SELECT Id, Name, MailingStreet, Phone, Email, LeadSource FROM Contact];
        
        //Add isAccessible() check
        return contacts;

    }
}