/*
Name:        Jacob Ira
Project:     Project 0
Description: This class is used as a holder for all assigned methods for Project 0
Due Date:    2/6/2019
*/
public class Project0 {
    
    private static integer openParen = 40;
    private static integer closedParen = 41;
    private static integer openBracket = 91;
    private static integer closedBracket = 93;
    private static integer openCurly = 123;
    private static integer closedCurly = 125;

/*
This method checks the number of employees all accounts have and updates those accounts
*/
	public static void updateAccountSize( ) {
    	List<Account> updateAccount = new List<Account>();
    	for(Account a: [Select id, numberOfEmployees, Size__c
                        From Account]){
            if(a.NumberOfEmployees >= 1
               && a.NumberOfEmployees <= 1000)
            	a.Size__c = 'Small';
            else if(a.NumberOfEmployees >= 1001
              		 && a.NumberOfEmployees <= 10000)
                a.Size__c = 'Medium';
        	else if(a.NumberOfEmployees > 10000)
                a.Size__c = 'Large';
            updateAccount.add(a);
        }
        update updateAccount;            
	}    
        
/*
This method returns the nth Fibonacci number
*/
        public static Integer nFibonacci( Integer n ){
            if (n == 0) {
            return 0;
        }
        
        if (n == 1){
            return 1;
        }

        integer first = 0;
        integer second = 1;
        integer nth = 1;

        for (integer i = 2; i <= n; i++) {
            nth = first + second;
            first = second;
            second = nth;
        }
        return nth;
    }

/*
This method swaps the values of A and B
*/
    public static void swap(integer A, integer B){
        integer temp = A;
        A = B;
        B = temp;
    }

/*
This method sorts an array of integers 
*/
    public static Integer[] sortArray( Integer[] intList ) {
        for(integer i = 0; i < intList.size(); i++){
            integer j = i;
            while (j > 0 && intList[j] > intList[j-1]){
                integer temp = intList[j];
                intList[j] = intList[j-1];
                intList[j-1] = temp;
                j--;
            }
        }
        system.debug(intList);
        return intList;
}
//Project0.sortArray(new integer[]{2,4,5,1,3,1});


/*
This method returns the factorial of the inputed number
*/
public static Integer nFactorial( Integer n) {
    Integer factorial = n;
    for(Integer i = 0; i < n; i++){
        factorial *= i;
    }
    system.debug(factorial);
    return factorial;
}

/*
Given an array, array, and an integer, n, rotate the values in array left n times and return array
*/
public static Integer[] rotateLeftNTimes( Integer[] inArray, Integer n) {
    if(inArray.size() >0){
    for(integer i = 0; i < n; i++){
        integer temp = inArray[0];
        for(integer j = 0; j < inArray.size()-1; j++){
            inArray[j] = inArray[j+1];
            system.debug(inArray[j]);
        }
        inArray[inArray.size() - 1] = temp;
    }
    }
    System.debug(inArray);
    return inArray;
}

/*
This method checks to see if the inputed bracket string is balanced
between open and closed matching brackets.
*/
public static Boolean bracketsAreBalanced( String s ) {
    Integer[] bracketValues = s.getChars();
    List<Integer> openBrackets = new List<Integer>();
    for(integer i = 0; i < bracketValues.size(); i++){
        if(bracketValues[i] == openParen || bracketValues[i] == openBracket|| bracketValues[i] == openCurly)
            openBrackets.add(bracketValues[i]);
        else if((bracketValues[i] == closedParen || bracketValues[i] == closedBracket || bracketValues[i] == closedCurly) && openBrackets.size() > 0)
            if(openBrackets.size() > 0 && !isMatching(openBrackets.remove(openBrackets.size() - 1), bracketValues[i])){
                system.debug('false');
                return false;
            }       
    }
    system.debug('True');
    return true;
}

/*
This method takes in 2 integers and checks to see if they match returning true if they 
match and false if they don't match.
*/
private Static Boolean isMatching(integer int1, integer int2){
    if (int1 == openParen && int2 == closedParen) 
         return true; 
       else if (int1 == openCurly && int2 == closedCurly) 
         return true; 
       else if (int1 == openBracket && int2 == closedBracket) 
         return true; 
       else
         return false; 
    } 


/* 
 * 7. This method will find all leads that contain 'ca' in their fields. 
 *  If a lead is located in California(CA), change their Lead Status field to 'Closed - Not 
 * Converted' and their description should display the message, "We are no longer doing 
 * business in California."
 */
public static void updateCALeads( ) {
    List<Lead> updateLeads = new List<Lead>();
    for(Lead l: [SELECT state, status, description
                 FROM Lead]){
        if(l.state == 'CA')
        {
            l.status = 'Closed - Not Converted';
            l.description = 'We are no longer doing business in California.';
        }
    system.debug(l);
    updateLeads.add(l);
    }
    update updateLeads;
}

/*
 * This method will find all Opportunities which have already passed their Close Date 
 * and have a Stage field that is not 'Closed Won'. Since they have passed their Close Date and 
 * they are not marked as 'Closed Won', they should be marked as 'Closed Lost'.
 */
public static void closePastDueOpportunities( ) {
    List<Opportunity> stageOpportunity = new List<Opportunity>();
        for(Opportunity o: [SELECT stageName, closeDate
                        FROM Opportunity]){
            if(o.closeDate < Date.Today() && o.stageName != 'Closed Won'){
                o.StageName = 'Closed Lost';
            stageOpportunity.add(o);
        }
        update stageOpportunity;
    }
}
	
public static void HelloWorld(){
   system.debug('HelloWorld!');
}
}


