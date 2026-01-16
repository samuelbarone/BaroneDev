@isTest
global class ParkServiceMock implements WebServiceMock {
   global void doInvoke(
           Object stub,
           Object request,
           Map<String, Object> response,
           String endpoint,
           String soapAction,
           String requestName,
           String responseNS,
           String responseName,
           String responseType) {
        // start - specify the response you want to send
       ParkService.byCountryResponse response_byCountry = 
            new ParkService.byCountryResponse();
                
               List<String> lst = new List<String>();
               lst.add('Park1');
                lst.add('Park2');
                 lst.add('Park3');
                response_byCountry.return_x = lst;
        // end
        response.put('response_byCountry', response_byCountry); 
 
   }
}