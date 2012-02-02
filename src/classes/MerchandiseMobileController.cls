public with sharing class MerchandiseMobileController {

    public MerchandiseMobileController () {
    }    

    @RemoteAction
    public static List<Merchandise__c> getMerchandiseRecs(){
        return [select Name, Description__c, Price__c, Total_Inventory__c from Merchandise__c limit 20];
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
}