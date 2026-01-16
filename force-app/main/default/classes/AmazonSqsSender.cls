public class AmazonSqsSender  extends AWS {

  public override void init() { 

            //createSigningKey('2fQbMs3ZJqATNIxNWSa2yw5YoAThPOS1TsxoWOFP');
       }

       // not sure if this will work
       // HttpRequest req = new HttpRequest();
        // Reference the Named Credential using 'callout:' followed by its Name
       // req.setEndpoint('callout:AmazonSqs/600391573830/BattleStationQueue');
      //  req.body = Blob.valueOf('Hello From Samuel Joseph Barone III');
      //  req.setMethod('POST');

       // Http http = new Http();
       // HttpResponse res = http.send(req);
 
       public String[] getBuckets() {
           HttpResponse response = sendRequest();
           String[] results = new String[0];
           // Read response XML; if we get this far, no exception happened
           // This code was omitted for brevity
           return results;
       }
    }
