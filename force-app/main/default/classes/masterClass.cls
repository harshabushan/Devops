public with sharing class masterClass {
    
    public masterClass() {

    }
    public static void jsonApex(Id accId){
      list<wrappercontact> listwccontact = new list<wrappercontact>();
       list<Contact> listcon =[Select id,Name,Accountid,Account.name,phone From Contact where Accountid =:accId];
        if(listcon.size()>0){
            for(contact objContact :listcon){

                wrappercontact ObjWc =New wrappercontact();
                ObjWc.name =objContact.name;
                ObjWc.phone =objContact.Phone;
                listwccontact.add(ObjWc);
            }
            Account objAcc =[Select id,name From Account where id =:accId];
            WrapperAccountclas objwc =new WrapperAccountclas(listwccontact);
            objwc.accName=objAcc.Name;
            objwc.accId =objAcc.id;

            
            System.debug('json --->' + JSON.serialize(objwc));

        }

    }

    public class WrapperAccountclas{

        public string accName{get;set;}
        public string accId{get;set;}
        public List<wrappercontact> contacts {get;set;}
        
        public WrapperAccountclas(list<wrappercontact> listcontacts){
            this.accName =null;
            this.accId =null;
            contacts =listcontacts;
        }
    }
    public class wrappercontact{
        public string name{get;set;}
        public string phone{get;set;}

        public wrappercontact(){
            this.name=null;
            this.phone=null;

        }
    }
}