public class Project0 {

//Create a method that retrieves a list of all accounts and updates those accounts.
//Create a custom field on the Account standard object called Size__c that will be a 
//picklist containing small/medium/large
//Create a method that retrieves a list of all accounts. 
//If an account has between 1-1000 employees then it is classified as small.
//If an account has between 1001-10000 employees it is classified as medium.
//If an account has more than 10000 employees it is classified as large.
//Update the Size__c field on each account to reflect the amount of employees in the Account.
   
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

public static Boolean bracketsAreBalanced( String s ) {

}

/* 
 * 7. This method will find all leads that contain 'ca' in their fields. 
 *  If a lead is located in California(CA), change their Lead Status field to 'Closed - Not 
 * Converted' and their description should display the message, "We are no longer doing 
 * business in California."
 */
public static void updateCALeads( ) {
    List<Lead> updateLeads = new List<Lead>();
    for(Lead l: [SELECT city, status, description
                 FROM Lead]){
        if(l.city == 'CA')
        {
            l.status = 'Closed - Not Converted';
            l.description = 'We are no longer doing business in California.';
        }
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
}


