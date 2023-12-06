public with sharing class CarSearchFormController {
    
    @AuraEnabled(cacheable=true)
    public static List<Car_Type__C> getCarTypes(){
        return [SELECT Id,Name FROM Car_Type__C];
    }
}