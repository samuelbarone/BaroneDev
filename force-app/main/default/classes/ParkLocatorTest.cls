@isTest
public class ParkLocatorTest {
    
      @isTest static void testCallout() {              
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        // Call the method that invokes a callout
       String country = 'United States';
        
        List<String> result = ParkLocator.country('United States'); 
        // Verify that a fake result is returned
        System.assertEquals('Park1', result[0]); 
    }

}