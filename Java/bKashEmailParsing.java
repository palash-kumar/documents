 public static void main(String []args){
        System.out.println("Hello World");
        
        String s = "bKash: You have received Tk 980.00 from 01712960072. Fee Tl 0.00. Balance Tk 22776.33. TrxID 7C91Q2K69X at 09/03/2020 19:10";
        
        //String s = "bKash: Cash In Tk 2,650.00 from 01854641117 successful. Fee Tk 0.00. Balance Tk 16,171.33. TrxID 7C92Q5789W at 09/03/2020 20:31";
        
        String[] cashInTk = s.split(" ",2);
        
        System.out.println("type : "+cashInTk[0]);//OK
        //System.out.println("type : "+cashInTk[1]);
        String[] type = cashInTk[1].split("Tk",2);
        //System.out.println("txn type : "+type[0]);//OK
        
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
        
        System.out.println("TrxID : "+trxId[0].trim());
        
     }