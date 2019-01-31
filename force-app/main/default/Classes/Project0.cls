public class Project0 {

//Create a method that retrieves a list of all accounts and updates those accounts.
//Create a custom field on the Account standard object called Size__c that will be a 
//picklist containing small/medium/large
//Create a method that retrieves a list of all accounts. 
//If an account has between 1-1000 employees then it is classified as small.
//If an account has between 1001-10000 employees it is classified as medium.
//If an account has more than 10000 employees it is classified as large.
//Update the Size__c field on each account to reflect the amount of employees in the Account.
   
	public static void allAccounts(){
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
        
}