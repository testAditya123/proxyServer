public class IntnaryExtension {

    public boolean HideBudgetDetails { get; set; }
    public list<Travel_Plan__c> TravelPlanList {get; set;}
    
    public IntnaryExtension(Apexpages.StandardController stdController)
    {
        HideBudgetDetails =true;
        TravelPlanList = [select Id, Name, Hotel_Phone_No__c from Travel_Plan__c limit 10];
    }

}