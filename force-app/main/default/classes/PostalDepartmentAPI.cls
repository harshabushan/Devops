public with sharing class PostalDepartmentAPI {
    
    public PostalDepartmentAPI() {

    }

    @AuraEnabled
    public static List<PostalResponseWrapper> Postalofficepincode(String  pincode){
      List<PostalResponseWrapper> getPostalList  = New List<PostalResponseWrapper>();  
       String endpoint ='https://api.postalpincode.in/pincode/{PINCODE}'; 

       if(pincode !=null){
        endpoint =endpoint+pincode; // 'https://api.postalpincode.in/pincode/754205
       }
      
       Http hp =New Http();
       HttpRequest hreq = New HttpRequest();
       hreq.setEndpoint(endpoint);
       hreq.setMethod('Get');
       hreq.setHeader('content-type','application/json');         
       HttpResponse hresp =hp.send(hreq);
      // resp.getBody();
       System.debug('getbody :' +hresp.getBody());

       if(hresp.getStatusCode() ==200){
            JSONParser parser =JSON.createParser(hresp.getBody());
            parser.nextToken();
            while (parser.nextToken() !=null) {
                if(parser.getCurrentToken() == JSONToken.START_ARRAY){
                    while (parser.nextToken() !=null) {
                        if(parser.getCurrentToken() == JSONToken.START_OBJECT){
                            PostalResponseWrapper eachpostal =(PostalResponseWrapper)parser.readValueAs(PostalResponseWrapper.class);
                            eachpostal.PINCode= pincode; 
                            getPostalList.add(eachpostal); 
                        }
                    }                 
                }
            }
        }           
            
      Return getPostalList;
    }

    public class PostalResponseWrapper{

        @AuraEnabled
         public string Name; 
         @AuraEnabled
         public string PINCode;   
         @AuraEnabled
         public string Description;   
         @AuraEnabled
         public string BranchType;  
         @AuraEnabled
         public string DeliveryStatus;  
         @AuraEnabled
         public string Circle;  
         @AuraEnabled
         public string District;  
         @AuraEnabled
         public string Division;           
         @AuraEnabled
         public string Region;  
         @AuraEnabled
         public string State;  
         @AuraEnabled
         public string Country;  

    }
}