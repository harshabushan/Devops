public class BitlyServiceInvocable {
    @invocableMethod(label='Shorten URL' description='Genertae short url with bitly API')
    
    public static void shorten(list<id> courseIds){        
        shortenFuture(courseIds);        
    }
    @Future(callout=true)
    public static void shortenFuture(list<id> courseIds){
        list<Course__c> courselist =[Select id,Name,CourseURL__c,CourseCode__c,ShortURL__c From Course__c where Id IN:courseIds];
        
        bitlySerivceClass bservice = new bitlySerivceClass();
        
        for(Course__c course : courselist){
            string fullURL = course.CourseURL__c;
            if(course.CourseCode__c!=null){
                fullURL = fullURL +'?couponCode='+course.CourseCode__c;
            }
            string shorturl = bservice.shorten(fullURL);            
            course.ShortURL__c = shorturl;
        }
        if(courselist.size()>0){
            
            update courselist;     
        }         
    }
}