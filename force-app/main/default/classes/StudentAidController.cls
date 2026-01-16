public with sharing class StudentAidController {

    private final Student__c studentRecord; 
    
    public StudentAidController(ApexPages.StandardController sc)
    {
        studentRecord = (Student__c)sc.getRecord();
    }
    
    public PageReference applyForAid()
    {
        studentRecord.AppliedForFinancialAid__c = true;
        update studentRecord;
        return null;
    }
    
    @RemoteAction
    public static void applyForAidAction(ID studentID)
    {
        List<Student__c> students = [Select ID, AppliedForFinancialAid__c from Student__c where ID = :studentId];
        if(students.size()>0)
        {
            students[0].AppliedForFinancialAid__c = true;
            update students;
        }
    }
}