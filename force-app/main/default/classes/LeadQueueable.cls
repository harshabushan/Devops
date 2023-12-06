public with sharing class LeadQueueable implements Queueable {
    public LeadQueueable() {

    }
    public void execute(QueueableContext context){

        List<Lead> le =[Select id, Leadsource from Lead];

        for(lead records :le){

            records.Leadsource='web';
        }
        update le;
    }
}