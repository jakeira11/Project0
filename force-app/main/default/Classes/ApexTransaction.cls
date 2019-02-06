//////////////////////////////////////////////////////////////////////////////////////////
//Name:        Jacob Ira
//Project:     Project 0
//Description: This class is used to create a transaction for the account.
//Due Date:    2/6/2019
//////////////////////////////////////////////////////////////////////////////////////////
public class ApexTransaction {

    //This method checks if an account is overdrawn and changes the status of the account accordingly.
    public static Boolean accountOverdrawn(string accountID, integer withdrawAmount){
        
            Bank_Account__C currentAccount = [Select name, id, Account_Balance__c, withdrawal_balance__c, status__c
                       	                   From Bank_Account__C Where name = :accountID];	
        if(currentAccount.Account_Balance__c > 0 && currentAccount.Account_Balance__c < withdrawAmount)
            currentAccount.Status__c = 'Overdrawn';
       	if(currentAccount.Name != null)
        	update currentAccount;
        return currentAccount.Status__c == 'Overdrawn';
    }
    
    //This method checks the accountID provided and queries to see if there is an account
    //that has a matching account name.  If there is and the transaction is a deposit
    //it adds the inputted amount to the account, if there is and the transaction is a 
    //withdrawal then it deductions the amount from the account.  Otherwise it does nothing. 
    public static void newTransaction(string accountID, Boolean withdraw, integer amount){
        Bank_Account__C bankAccount = [Select name, id, Account_Balance__c
                                       	   From Bank_Account__C Where name = :accountID];
        if(withdraw && !accountOverdrawn(accountID, amount))
            bankAccount.Account_Balance__c -= amount;
        else 
            bankAccount.Account_Balance__c += amount;
        if(bankAccount.Name != null){
             update bankAccount;
        }
        updateAccount(accountID);
    }

    //This method checks to see if the inputted account is null or not, if it's not null
    //then it updates the bank account.
    public static void updateAccount(string accountID){
        Bank_Account__C bankAccount = [Select name, id, Account_Balance__c
                                       	   From Bank_Account__C Where name = :accountID];
        if(bankAccount.Name != null){
            update bankAccount;   
        }
    }
}