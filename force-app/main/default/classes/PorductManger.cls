public with sharing class PorductManger {     
        @AuraEnabled(cacheable=true)
        public static list<Product2> getAllProdlist(){       
            return [SELECT Id,Name,IsActive from Product2];        
        }
    
        @AuraEnabled(cacheable=true)
        public static list<Product2> ProdListSelect(string prodId){              
            if(string.isNotBlank(prodId)){
                list<Product2> listprod =[SELECT id,Name,IsActive from Product2 where id =:prodid];
                return  listprod;
            }
            else {
                return  NULL;
            }
                  
        }
      
    }
