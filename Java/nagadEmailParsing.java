public class HelloWorld{

     public static void main(String []args){
        System.out.println("Hello World");
        
        String s = "Nagad: Money Received.\n"+
        "Amount: Tk 430.00\n"+
        "Sender: 01648235095\n"+
        "TxnID: 70L0HWIY\n"+
        "Balance: Tk 7454.90\n"+
        "09/03/2020 17:12";
        
        /*String s = "Nagad: Cash In Received.\n"+
        "Amount: Tk 430.00\n"+
        "Uddokta: 01648235095\n"+
        "TxnID: 70L0HWIY\n"+
        "Balance: Tk 7454.90\n"+
        "09/03/2020 17:12";*/
        
        //String s = "bKash: Cash In Tk 2,650.00 from 01854641117 successful. Fee Tk 0.00. Balance Tk 16,171.33. TrxID 7C92Q5789W at 09/03/2020 20:31";
        
        //String s = "";
        //System.out.println("gateway : "+s);//OK
        String[] gateway = s.split(":",2);
        
        System.out.println("gateway : "+gateway[0]);//OK
        //System.out.println("type : "+gateway[1]);
        String[] type = gateway[1].split("Tk",2);
        type = type[0].split("\\.",2);
        System.out.println("txn type : "+type[0].trim());//OK
        //System.out.println("txn type : "+type[1]);
        
        String[] amount = new String[100];
        if(type[0].trim().equalsIgnoreCase("Money Received")){
            amount = gateway[1].split("Amount: Tk",2);
            amount = amount[1].split("Sender:",2);
        }else if(type[0].trim().equalsIgnoreCase("Cash In Received")){
            amount = gateway[1].split("Amount: Tk",2);
            amount = amount[1].split("Uddokta:",2);
        }
        System.out.println("amount : "+amount[0].trim());
        //String[] 
        //System.out.println(">amount : "+amount[1]);
        
        String[] number = amount[1].split("TxnID:",2);
        System.out.println("number : "+number[0].trim());
        //System.out.println("number : "+number[1]);
        
        String[] txnId = number[1].split("Balance: Tk",2);
        System.out.println("txnId : "+txnId[0].trim());
        //System.out.println(">txnId : "+txnId[1]);
        
        String[] balance = txnId[1].split("\n",2);
        System.out.println("balance : "+balance[0].trim());
        System.out.println("date : "+balance[1].trim());
        /*
        String txnType = type[0].trim();
        String[] msg= new String[100];
        String[] nmbr= new String[100];
        String[] msg2= new String[100];
        if(txnType.equalsIgnoreCase("You have received")){
            System.out.println("txn type : "+txnType);
             msg = cashInTk[1].split("received Tk",2);
             msg2 = msg[1].split("from",2);
             nmbr = msg2[1].split("\\.",2);
        }else if(txnType.equalsIgnoreCase("Cash In")){
            System.out.println("txn type : "+txnType);
             msg = cashInTk[1].split("Cash In Tk",2);
             msg2 = msg[1].split("from",2);
             nmbr = msg2[1].split("successful",2);
        }
        
        System.out.println("received tk : "+msg2[0].trim());//OK
        
        System.out.println("nmbr : "+nmbr[0].trim());//OK
        
        String[] tk = nmbr[1].split("Balance Tk",2);
        tk = tk[1].split("\\. ",2);
        System.out.println("Balance Tk : "+tk[0].trim());
        
        String[] trxId = tk[1].split("TrxID",2);
        trxId = trxId[1].split("at",2);
        
        System.out.println("TrxID : "+trxId[0].trim());*/
        
     }
}