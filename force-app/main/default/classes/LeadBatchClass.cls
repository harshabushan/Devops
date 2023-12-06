public with sharing class LeadBatchClass implements database.Batchable<SObject> {
    public LeadBatchClass() {

    }

   public database.QueryLocator start(Database.BatchableContext BC){
       return Database.getQueryLocator('SELECT ID, Leadsource FROM Lead');

   }
   public void execute(Database.BatchableContext Bc,List<Lead> scope){

    for(Lead le :scope){

        le.Leadsource='Web';
    }
    update scope;

   }

   public void finish(Database.BatchableContext bc){

	system.debug('batch finish');
   }
    
}