@isTest
public class AnimalLocatorTest {
    
 @isTest static  void  testGetCallout() {
    // Set mock callout class
    Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
    // This causes a fake response to be sent
    // from the class that implements HttpCalloutMock.
    String animalname = AnimalLocator.getAnimalNameById(1);
    // Verify that the response received contains fake values        
    String expectedValue = 'chicken';
    System.assertEquals(animalname, expectedValue);
    }

}