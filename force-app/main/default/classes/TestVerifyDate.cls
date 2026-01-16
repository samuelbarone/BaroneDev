@isTest
public class TestVerifyDate {

     @isTest static void testCheckDatesWithin30Days() {
         Date today = Date.Today();
         Date tomorrow = Date.Today().addDays(1);
         Date result = VerifyDate.CheckDates(today,tomorrow);
        System.assertEquals(tomorrow, result);
    }
    
     @isTest static void testCheckDatesOver30Days() {
         Date today = Date.Today();
         Date tomorrow = Date.Today().addDays(40);
         
         Date result = VerifyDate.CheckDates(today,tomorrow);
        System.assertEquals(Date.parse('05/31/2017'), result);
    }
}