public with sharing class bitlySerivceClass {
    
    
    public bitlySerivceClass() {

    }
    public string shorten(string courseURL){
        //HTTP post call 1- HTTP Object, 2- HTTp Requesr, 3 HTTP response
        http hp =New Http();
        HttpRequest hReq =new HttpRequest();
        hReq.setMethod('POST');
        hReq.setEndpoint('callout:Bitly/v4/shorten');
        hReq.setHeader('Authorization', 'Bearer {!$Credential.Password}');
        hReq.setHeader('Accept','application/json');
        hReq.setHeader('Content-Type', 'application/json');
         hReq.setBody(JSON.serialize(new Map<string,Object>{
            'group_guid'=>'{!$Credential.Username}',
            'long_url'=> courseURL,
            'domain'=>'bit.ly' 
        }));
        HttpResponse res =hp.send(hReq);
        Map<String,Object> response =(Map<String,Object>)JSON.deserializeUntyped(res.getBody());
        string surl =(string)response.get('link');
        Return surl;
    }
}