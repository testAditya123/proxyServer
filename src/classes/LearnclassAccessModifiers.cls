//public Private Global

public class LearnclassAccessModifiers {
    
    //Variables         
    public string name;                       
    private integer RollNo = 24;
    integer temp = -12;
    Double tempDenver = 12.34;
    string standard = 'B-Tech';
    Boolean TenthPass = False; 
    Account acc;
    Itenary__c itenary;
    list<string> NameList;
    
    class tstintclass
    {
        
    }
    
    //methods (function)
    
    LearnclassAccessModifiers()  //constructor
    {
       
    }
    
    public void charychocolatesStory(integer chocolates, string chocolatename)
    {
        
    }
    
	integer vamsichocolatesStory()
    {
        integer chocolatecover = 2;
        return chocolatecover;
    }
    
    integer vamsichocolatesStory(integer i)
    {
        integer chocolatecover = 2;
        return chocolatecover;
    }

}