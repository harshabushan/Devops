@RestResource(urlMapping='/LeadService1/*')
global with sharing class LeadClass {
    
    @httpget
    global static list<lead> getleadInfo(){

        List<lead> listLeadRecords =[SELECT id,Name,Email,Phone,Company,MobilePhone From Lead];
        return listLeadRecords;

    }
}