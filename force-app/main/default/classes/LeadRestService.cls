@RestResource(urlMapping='/LeadService/*')
global class LeadRestService {
    @httpget
    global static list<Lead> getleadinfo(){
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        system.debug('req.requestURI'+req.requestURI);
        string requestURI = req.requestURI;
        String leadName ='%'+ requestURI.substring(req.requestURI.lastIndexOf('=')+1) +'%';
        system.debug('leadName: ' +leadName);       
        list<lead> leadlist =[SELECT Id,Name,Email,Phone,Company,MobilePhone from lead where Name like :leadName];
        return leadlist;
        
    }
    @httpdelete
    global static string  DeletematchingLead(){
        string responseMessage;
        integer leadCount =0;
        try{
            RestRequest req = RestContext.request;
            RestResponse res = RestContext.response;
            system.debug('req.requestURI'+req.requestURI);
            string requestURI = req.requestURI;
            String leadName ='%'+ req.requestURI.substring(req.requestURI.lastIndexOf('=')+1) +'%';
            system.debug('leadName: ' +leadName);       
            list<lead> leadList =[SELECT Id,Name,Email,Phone,Company,MobilePhone from lead where Name like :leadName];
            if(leadList !=null && leadList.size()>0){
                leadCount = leadList.size();
            }
            Delete leadList;
            
        }
        catch(Exception ex){
            responseMessage = 'Exception occured during delete ==>' +ex.getMessage(); 
            
        }
        responseMessage = 'Lead Deleted sucesfully ==> lead Deleted count' +leadCount;
        return responseMessage;
    }
    @httppost
    global static string leadCreate(string fname, string lname,string cname,string leademail,string phonenumber){
        string respMessage;
        try{
        Lead l =New Lead();
        l.firstname=fname;
        l.LastName =lname;
        l.Company =cname;
        l.Email =leademail;
        l.Phone =phonenumber;
        insert l;
           respMessage ='Lead Created succesfully with id as ===> ' + l.Id;
            
        }catch(Exception ex){
          respMessage ='Error occured New lead Creation ==> ' +ex.getMessage();  
        } 
        
        return respMessage;
    }
    @httpPatch
    global static string updateLeadEmail(string newEmail){
        string respMessage;
        try {
        RestRequest req =RestContext.request;
        string requestURI = req.requestURI;
        string leadId ='%'+ requestURI.substring(requestURI.lastIndexOf('=')+1) +'%';

       lead mylead = [Select id,email from lead where id=:leadid];
        
        if(mylead !=null && mylead.Email !=newEmail){
            string oldemail = mylead.Email;
            mylead.email = newEmail;
            update mylead;
            respMessage = 'Lead updated from old email '+oldemail +' with new email as '+newEmail;
        }else {
            respMessage = 'Currently this lead is having same email address '+newEmail;
        }
        } catch (Exception ex)  {
            
            respMessage ='Exception occured during lead update '+ex.getMessage();
        }

        return respMessage;
    
    }
}