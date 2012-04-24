public with sharing class MerchandiseMobileController {

    public MerchandiseMobileController () {
    }    

    @RemoteAction
    public static List<Merchandise__c> getMerchandiseRecs(){
        return [select Name, Description__c, Price__c, 
                Total_Inventory__c from Merchandise__c limit 20];
    } 

    @RemoteAction
    public static String saveMerchandiseImage(String imageData, String recId) {
        Attachment a = new Attachment (ParentId = recId,
                                       Body = EncodingUtil.base64Decode(imageData),
                                       ContentType = 'image/jpg',
                                       Name = 'PhoneImage');
        insert a;      
        return null;
    }
    
    @RemoteAction
    public static Merchandise__c getMerchandiseRecByBarCode(String barCode) {
        System.debug('Bar Code is:'+barCode);
        Merchandise__c[] rec = [select id, name, Description__c, 
                                Total_Inventory__c, Price__c from Merchandise__c 
                                where Bar_Code__c = :barCode limit 1];
        if (rec.size() == 1)
           return rec[0];
        else          
           return null;
    }
}