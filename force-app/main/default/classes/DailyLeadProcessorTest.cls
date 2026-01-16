@isTest
private class DailyLeadProcessorTest {

    public static String CRON_EXP = '0 0 0 15 3 ? 2022';
    static testMethod void testMe() {
        List<Lead> leads  = new List<Lead>();
        
        for(Integer i =0;i<200;i++) {
            Lead l = new Lead();
            l.LeadSource = ''; 
            l.LastName='Barone';
            l.Company='Company';
            l.Status='Closed-Converted';
            
            leads.add(l);
        }
        
        insert leads;
        
        Test.startTest();
        String jobId = System.schedule('ScheuledApexTest',CRON_EXP, new DailyLeadProcessor());
        Test.stopTest();
    }
}