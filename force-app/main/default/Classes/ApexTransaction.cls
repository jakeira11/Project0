public class ApexTransaction {
    private static List<Bank_Account__C> bankAccount = new List<Bank_Account__c>();
    

    public static void fillAccounts(){
        for(Bank_Account__C ba : [SELECT Account_Balance__c, withdrawal_balance__c, status__c From Bank_Account__c])
            bankAccount.add(ba);
    }
    


/*
    • Check if an account is overdrawn and change the status of the account accordingly.
    • Create a new transaction relating to the account.
    • Update the account based on all related transactions to show current balance.
*/
    public static void accountOverdrawn(Account_Balance__c ab, withdrawal_balance__c withdrawal, Status__c accountStatus){
        if(ab - withdrawal < 0)
            accountStatus = 'Overdrawn';
    }

    public static void newTransaction(Account_Balance__c ab, withdrawal_balance__c withdrawal, deposit_Balance__c deposit){
        if(withdrawal > 0 && ab - withdrawal > 0)
            ab -= withdrawal;
        else if(deposit > 0)
            ab += deposit;

    }

    public static void updateAccount(){
        


    }
}