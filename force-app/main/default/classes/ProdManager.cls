public with sharing class ProdManager {
   
    @AuraEnabled
    global static List<Product2> getprodlist(){       
        return [Select id,Type,name,ProductCode,ProductClass,IsActive From Product2];        
    }

}