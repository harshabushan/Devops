/**
 * CTLocationTracingController
 * Main controller class for Location_Tracing__c object
 * @author Manish
 */
public with sharing class CTLocationTracingController {

     /**
     * Get last 30 days visitors
     * @param locationId
     * @return List<Location_Tracing__c>
     */
  public static List<Location_Tracing__c> getVistors(String locationId){
    return [SELECT Id, Person__c, Location__c, Visit_Date__c, Person__r.Token__c, Person__r.Health_Status__c 
                        FROM Location_Tracing__c 
                        WHERE Id =: locationId
                        ORDER BY Visit_Date__c DESC ];

  }  
   /**
     * Get all location ids for visitors
     * @param personIds
     * @return List<Location_Tracing__c>
     */
  public static List<Location_Tracing__c> getLocationsByPersonIds(Set<Id> personIds){
                return [SELECT Id, Person__c, Location__c 
                FROM Location_Tracing__c 
                WHERE Person__c IN :personIds
                AND Visit_Date__c = LAST_N_DAYS:10];
  }
  /**
     * Get all visitor ids for locations
     * @param locationIds
     * @param Person__r.Health_Status__c = 'Green'
     * @return List<Location_Tracing__c>
     */
    public static List<Location_Tracing__c> getLocationsByLocationIds(Set<Id> locationIds){
                return [SELECT Id, Person__c, Location__c 
                FROM Location_Tracing__c 
                WHERE Location__c IN :locationIds
                AND Person__r.Health_Status__c = 'Green'
                AND Visit_Date__c = LAST_N_DAYS:10];

    }

    public static List<Location_Tracing__c> CheckeDuplicates(List<Location_Tracing__c> NewlocationTraces){
       set<id> LocationIds =new set<id>();
       set<id> PersonIds =new set<id>();

       for(Location_Tracing__c trace:NewlocationTraces){
            LocationIds.add(trace.Location__c);
            PersonIds.add(trace.Person__c);
       }
         Map<id,set<id>> mapofExisitngRecords = new Map<id,set<id>>();
       //Query existing location tracing records
        List<Location_Tracing__c> existinRecords =[SELECT Id, Person__c, Location__c 
                                                   FROM Location_Tracing__c 
                                                   WHERE Location__c IN :LocationIds
                                                   AND Person__c IN :PersonIds];

           // list of duplicate records
           List<Location_Tracing__c> duplicates = new List<Location_Tracing__c>();                                        
         if(existinRecords !=null && existinRecords.size()>0){
            
            for(Location_Tracing__c trace: existinRecords){
                  if(!mapofExisitngRecords.containsKey(trace.Location__c)){
                     mapofExisitngRecords.put(trace.Location__c, new set<id>());
                  }
                  // add person ids to map set
                  mapofExisitngRecords.get(trace.Location__c).add(trace.Person__c);
            }
            //loop over new locationtracing records
            for (Location_Tracing__c trace : NewlocationTraces) {
               // first check for loaction id
               // if iteam found in map, then check for person in set
               if(mapofExisitngRecords.containsKey(trace.Location__c) 
                  && mapofExisitngRecords.get(trace.Location__c).contains(trace.Person__c)){
                     duplicates.add(trace);
                  }
            }
         }
         return duplicates;
       } 

    
}