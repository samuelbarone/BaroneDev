public with sharing class CheeseController {

    public List<Cheese__c> cheeses { get; set; }
    
    public CheeseController() {
        getCheeses();
    }
    
    public void getCheeses() { 
        
        cheeses = Database.query('SELECT Id, Name, Favorite_Cheese__c FROM Cheese__c');
    }
    
    public pageReference sortList() {
        getCheeses();
        return null;
    }
}