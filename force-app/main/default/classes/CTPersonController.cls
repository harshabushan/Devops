/**
 * CTPersonController
 * Main controller class for Person__c object
 * @author Manish
 */
public with sharing class CTPersonController {

    /**
     * generate unique token using mobile number
     * use MD5 algorithm to generate one-way hash
     * @param mobile
     * @return string token
     */
    public static String getToken(String mobileNo){
        Blob value = Blob.valueOf(mobileNo);
        Blob hash = Crypto.generateDigest('MD5', value);
        // return encoded string
        return EncodingUtil.base64Encode(hash);
    }
    /**
     * Get 100 contacts with recent health status change
     * @return List<Person__c>
     */
    public  static List <Person__c> getRecentHealthChnages(){
        return [Select Id,Name,Health_Status__c,Mobile__c,Status_Update_Date__c,Token__c FROM Person__c ORDER BY Status_Update_Date__c DESC NULLS LAST limit 100];
    }
     /**
     * Search a person by name, token or mobile
     * @return List<Person__c>
     */
    public static List<Person__c> Searchpeople(String SearchTerm){
        SearchTerm =SearchTerm +'%';
      return [Select Id,Name,Health_Status__c,Mobile__c,Status_Update_Date__c,Token__c 
                            FROM Person__c
                                 where Name LIKE:SearchTerm OR  
                                     Mobile__c LIKE:SearchTerm OR 
                                     Token__c LIKE:SearchTerm 
                                     ORDER BY Status_Update_Date__c DESC NULLS LAST ];

    }
      /**
     * Search a person by id
     * @return Person__c
     */
   public static Person__c getPersonById(String PersonId){       
    List<Person__c> Pepole =[Select Id,Name,Health_Status__c,Mobile__c,Status_Update_Date__c,Token__c 
                                        FROM Person__c  where Id=:PersonId ];
        if(Pepole !=null && Pepole.size() > 0){
            return Pepole[0];
        }
      return null;
   }
}