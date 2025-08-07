SQL> 	CREATE TABLE CUSTOMERS(
  2  CID NUMBER PRIMARY KEY,
  3  NAME VARCHAR2(15),
  4  EMAIL VARCHAR2(30),
  5  PHONE NUMBER(10),
  6  ADDRESS VARCHAR2(30));

Table created.

SQL> CREATE TABLE ACCOUNTS(
  2  AID NUMBER PRIMARY KEY,
  3  CID NUMBER,
  4  ACCOUNT_TYPE VARCHAR(20,2),
  5  FOREIGN KEY (CID) REFERENCES CUSTOMERS(CID));
ACCOUNT_TYPE VARCHAR(20,2),
                       *
ERROR at line 4:
ORA-00907: missing right parenthesis 


SQL> ED
Wrote file afiedt.buf

  1  CREATE TABLE ACCOUNTS(
  2  AID NUMBER PRIMARY KEY,
  3  CID NUMBER,
  4  ACCOUNT_TYPE VARCHAR2(15),
  5  BALANCE NUMBER(20,2)
  6* FOREIGN KEY (CID) REFERENCES CUSTOMERS(CID))
SQL> /
FOREIGN KEY (CID) REFERENCES CUSTOMERS(CID))
*
ERROR at line 6:
ORA-00907: missing right parenthesis 


SQL> ED
Wrote file afiedt.buf

  1  CREATE TABLE ACCOUNTS(
  2  AID NUMBER PRIMARY KEY,
  3  CID NUMBER,
  4  ACCOUNT_TYPE VARCHAR2(15),
  5  BALANCE NUMBER(20,2),
  6* FOREIGN KEY (CID) REFERENCES CUSTOMERS(CID))
SQL> /

Table created.

SQL> CREATE TABLE TRANSACTIONS(
  2  TID NUMBER PRIMARY KEY,
  3  AID NUMBER,
  4  TDATE DATE(DD-MON-YYYY),
  5  AMOUNT NUMBER(20,2),
  6  TTYPE VARCHAR2(15),
  7  FOREIGN KEY(AID) REFERENCES ACCOUNTS(AID));
TDATE DATE(DD-MON-YYYY),
          *
ERROR at line 4:
ORA-00907: missing right parenthesis 


SQL> ED
Wrote file afiedt.buf

  1  CREATE TABLE TRANSACTIONS(
  2  TID NUMBER PRIMARY KEY,
  3  AID NUMBER,
  4  TDATE DATE,
  5  AMOUNT NUMBER(20,2),
  6  TTYPE VARCHAR2(15),
  7* FOREIGN KEY(AID) REFERENCES ACCOUNTS(AID))
SQL> /

Table created.

SQL> DESC CUSTOMERS;
 Name                                                                                                              Null?    Type
 ----------------------------------------------------------------------------------------------------------------- -------- ----------------------------------------------------------------------------
 CID                                                                                                               NOT NULL NUMBER
 NAME                                                                                                                       VARCHAR2(15)
 EMAIL                                                                                                                      VARCHAR2(30)
 PHONE                                                                                                                      NUMBER(10)
 ADDRESS                                                                                                                    VARCHAR2(30)

SQL> DESC ACCOUNTS;
 Name                                                                                                              Null?    Type
 ----------------------------------------------------------------------------------------------------------------- -------- ----------------------------------------------------------------------------
 AID                                                                                                               NOT NULL NUMBER
 CID                                                                                                                        NUMBER
 ACCOUNT_TYPE                                                                                                               VARCHAR2(15)
 BALANCE                                                                                                                    NUMBER(20,2)

SQL> DESC TRANSACTIONS;
 Name                                                                                                              Null?    Type
 ----------------------------------------------------------------------------------------------------------------- -------- ----------------------------------------------------------------------------
 TID                                                                                                               NOT NULL NUMBER
 AID                                                                                                                        NUMBER
 TDATE                                                                                                                      DATE
 AMOUNT                                                                                                                     NUMBER(20,2)
 TTYPE                                                                                                                      VARCHAR2(15)

SQL> INSERT INTO VALUES FROM CUSTOMERS(&CID,'&NAME','&EMAIL',&PHONE,'&ADDRESS');
Enter value for cid: 1
Enter value for name: Abhay
Enter value for email: abhaysinhsonwalkar@007.com
Enter value for phone: 8805814470
Enter value for address: kolki,tal,phaltan,dist.satara
old   1: INSERT INTO VALUES FROM CUSTOMERS(&CID,'&NAME','&EMAIL',&PHONE,'&ADDRESS')
new   1: INSERT INTO VALUES FROM CUSTOMERS(1,'Abhay','abhaysinhsonwalkar@007.com',8805814470,'kolki,tal,phaltan,dist.satara')
INSERT INTO VALUES FROM CUSTOMERS(1,'Abhay','abhaysinhsonwalkar@007.com',8805814470,'kolki,tal,phaltan,dist.satara')
            *
ERROR at line 1:
ORA-00903: invalid table name 


SQL> INSERT INTO CUSTOMERS(CID,NAME,EMAIL,PHONE,ADDRESS)
  2  VALUES (&CID,'&NAME','&EMAIL',&PHONE,'&ADDRESS');
Enter value for cid: 1
Enter value for name: Abhay
Enter value for email: abhaysinhsonwalkar@007.com
Enter value for phone: 8805814470
Enter value for address: kolki,tal,phaltan,dist.satara
old   2: VALUES (&CID,'&NAME','&EMAIL',&PHONE,'&ADDRESS')
new   2: VALUES (1,'Abhay','abhaysinhsonwalkar@007.com',8805814470,'kolki,tal,phaltan,dist.satara')

1 row created.

SQL> /
Enter value for cid: 2
Enter value for name: Satyashil
Enter value for email: satyasonwalkar@01.com
Enter value for phone: 9561079865
Enter value for address: kolki,tal,phaltan,dist.satara
old   2: VALUES (&CID,'&NAME','&EMAIL',&PHONE,'&ADDRESS')
new   2: VALUES (2,'Satyashil','satyasonwalkar@01.com',9561079865,'kolki,tal,phaltan,dist.satara')

1 row created.

SQL> /
Enter value for cid: 3
Enter value for name: Akshay
Enter value for email: akshaybankar@11.com
Enter value for phone: 8805741717
Enter value for address: phaltan
old   2: VALUES (&CID,'&NAME','&EMAIL',&PHONE,'&ADDRESS')
new   2: VALUES (3,'Akshay','akshaybankar@11.com',8805741717,'phaltan')

1 row created.

SQL> /
Enter value for cid: Karan
Enter value for name: /
Enter value for email: /
Enter value for phone: /
Enter value for address: /
old   2: VALUES (&CID,'&NAME','&EMAIL',&PHONE,'&ADDRESS')
new   2: VALUES (Karan,'/','/',/,'/')
VALUES (Karan,'/','/',/,'/')
                      *
ERROR at line 2:
ORA-00936: missing expression 


SQL> /
Enter value for cid: 4
Enter value for name: Karan
Enter value for email: karanbhosale@45.com
Enter value for phone: 8485781950
Enter value for address: Vai
old   2: VALUES (&CID,'&NAME','&EMAIL',&PHONE,'&ADDRESS')
new   2: VALUES (4,'Karan','karanbhosale@45.com',8485781950,'Vai')

1 row created.

SQL> /
Enter value for cid: 5
Enter value for name: Dhairyashil
Enter value for email: dhairyashilsonwalkar@77.com
Enter value for phone: 8999788999
Enter value for address: khandala
old   2: VALUES (&CID,'&NAME','&EMAIL',&PHONE,'&ADDRESS')
new   2: VALUES (5,'Dhairyashil','dhairyashilsonwalkar@77.com',8999788999,'khandala')

1 row created.

SQL> INSERT INTO ACCOUNTS(AID,CID,ACCOUNT_TYPE,BALANCE)
  2  VALUES(&AID,&CID,'&ACCOUNT_TYPE',&BALANCE);
Enter value for aid: 101
Enter value for cid: 1
Enter value for account_type: SAVINGS
Enter value for balance: 1565755.50
old   2: VALUES(&AID,&CID,'&ACCOUNT_TYPE',&BALANCE)
new   2: VALUES(101,1,'SAVINGS',1565755.50)

1 row created.

SQL> /
Enter value for aid: 102
Enter value for cid: 2
Enter value for account_type: CURRENT
Enter value for balance: 213213
old   2: VALUES(&AID,&CID,'&ACCOUNT_TYPE',&BALANCE)
new   2: VALUES(102,2,'CURRENT',213213)

1 row created.

SQL> /
Enter value for aid: 103
Enter value for cid: 3
Enter value for account_type: CURRENT
Enter value for balance: 2347332
old   2: VALUES(&AID,&CID,'&ACCOUNT_TYPE',&BALANCE)
new   2: VALUES(103,3,'CURRENT',2347332)

1 row created.

SQL> /
Enter value for aid: 104
Enter value for cid: 4
Enter value for account_type: SAVINGS
Enter value for balance: 7371663
old   2: VALUES(&AID,&CID,'&ACCOUNT_TYPE',&BALANCE)
new   2: VALUES(104,4,'SAVINGS',7371663)

1 row created.

SQL> /
Enter value for aid: 105
Enter value for cid: 5
Enter value for account_type: SAVINGS
Enter value for balance: 4234788.50
old   2: VALUES(&AID,&CID,'&ACCOUNT_TYPE',&BALANCE)
new   2: VALUES(105,5,'SAVINGS',4234788.50)

1 row created.

SQL> SELECT * FROM CUSTOMERS;

       CID NAME            EMAIL                               PHONE ADDRESS                                                                                                                            
---------- --------------- ------------------------------ ---------- ------------------------------                                                                                                     
         1 Abhay           abhaysinhsonwalkar@007.com     8805814470 kolki,tal,phaltan,dist.satara                                                                                                      
         2 Satyashil       satyasonwalkar@01.com          9561079865 kolki,tal,phaltan,dist.satara                                                                                                      
         3 Akshay          akshaybankar@11.com            8805741717 phaltan                                                                                                                            
         4 Karan           karanbhosale@45.com            8485781950 Vai                                                                                                                                
         5 Dhairyashil     dhairyashilsonwalkar@77.com    8999788999 khandala                                                                                                                           

SQL> SELECT * FROM ACCOUNTS;

       AID        CID ACCOUNT_TYPE       BALANCE                                                                                                                                                        
---------- ---------- --------------- ----------                                                                                                                                                        
       101          1 SAVINGS          1565755.5                                                                                                                                                        
       102          2 CURRENT             213213                                                                                                                                                        
       103          3 CURRENT            2347332                                                                                                                                                        
       104          4 SAVINGS            7371663                                                                                                                                                        
       105          5 SAVINGS          4234788.5                                                                                                                                                        

SQL> INSERT INTO TRANSACTIONS(TID,AID,TDATE,AMOUNT,TTYPE)
  2  VALUES(&TID,&AID,'&TDATE',&AMOUNT,'&TTYPE');
Enter value for tid: 1001
Enter value for aid: 101
Enter value for tdate: 25-JUN-2025
Enter value for amount: 55500
Enter value for ttype: DEPOSIT
old   2: VALUES(&TID,&AID,'&TDATE',&AMOUNT,'&TTYPE')
new   2: VALUES(1001,101,'25-JUN-2025',55500,'DEPOSIT')

1 row created.

SQL> /
Enter value for tid: 1002
Enter value for aid: 102
Enter value for tdate: 20-JUL-25
Enter value for amount: 45000
Enter value for ttype: WITHDRAWAL
old   2: VALUES(&TID,&AID,'&TDATE',&AMOUNT,'&TTYPE')
new   2: VALUES(1002,102,'20-JUL-25',45000,'WITHDRAWAL')

1 row created.

SQL> /
Enter value for tid: 1003
Enter value for aid: 103
Enter value for tdate: 10-APR-2025
Enter value for amount: 38322
Enter value for ttype: DEPOSIT
old   2: VALUES(&TID,&AID,'&TDATE',&AMOUNT,'&TTYPE')
new   2: VALUES(1003,103,'10-APR-2025',38322,'DEPOSIT')

1 row created.

SQL> /
Enter value for tid: 1004
Enter value for aid: 104
Enter value for tdate: 17-APR-2025
Enter value for amount: 21383
Enter value for ttype: WITHDRAWAL
old   2: VALUES(&TID,&AID,'&TDATE',&AMOUNT,'&TTYPE')
new   2: VALUES(1004,104,'17-APR-2025',21383,'WITHDRAWAL')

1 row created.

SQL> /
Enter value for tid: 1005
Enter value for aid: 105
Enter value for tdate: 01-AUG-2025
Enter value for amount: 23798
Enter value for ttype: PAYMENT
old   2: VALUES(&TID,&AID,'&TDATE',&AMOUNT,'&TTYPE')
new   2: VALUES(1005,105,'01-AUG-2025',23798,'PAYMENT')

1 row created.

SQL> SELECT * FROM TRANSACTIONS;

       TID        AID TDATE         AMOUNT TTYPE                                                                                                                                                        
---------- ---------- --------- ---------- ---------------                                                                                                                                              
      1001        101 25-JUN-25      55500 DEPOSIT                                                                                                                                                      
      1002        102 20-JUL-25      45000 WITHDRAWAL                                                                                                                                                   
      1003        103 10-APR-25      38322 DEPOSIT                                                                                                                                                      
      1004        104 17-APR-25      21383 WITHDRAWAL                                                                                                                                                   
      1005        105 01-AUG-25      23798 PAYMENT                                                                                                                                                      

SQL> SELECT * FROM CUSTOMERS;

       CID NAME            EMAIL                               PHONE ADDRESS                                                                                                                            
---------- --------------- ------------------------------ ---------- ------------------------------                                                                                                     
         1 Abhay           abhaysinhsonwalkar@007.com     8805814470 kolki,tal,phaltan,dist.satara                                                                                                      
         2 Satyashil       satyasonwalkar@01.com          9561079865 kolki,tal,phaltan,dist.satara                                                                                                      
         3 Akshay          akshaybankar@11.com            8805741717 phaltan                                                                                                                            
         4 Karan           karanbhosale@45.com            8485781950 Vai                                                                                                                                
         5 Dhairyashil     dhairyashilsonwalkar@77.com    8999788999 khandala                                                                                                                           

SQL> SELECT * FROM ACCOUNTS;

       AID        CID ACCOUNT_TYPE       BALANCE                                                                                                                                                        
---------- ---------- --------------- ----------                                                                                                                                                        
       101          1 SAVINGS          1565755.5                                                                                                                                                        
       102          2 CURRENT             213213                                                                                                                                                        
       103          3 CURRENT            2347332                                                                                                                                                        
       104          4 SAVINGS            7371663                                                                                                                                                        
       105          5 SAVINGS          4234788.5                                                                                                                                                        

SQL> DESC CUSTOMERS;
 Name                                                                                                              Null?    Type
 ----------------------------------------------------------------------------------------------------------------- -------- ----------------------------------------------------------------------------
 CID                                                                                                               NOT NULL NUMBER
 NAME                                                                                                                       VARCHAR2(15)
 EMAIL                                                                                                                      VARCHAR2(30)
 PHONE                                                                                                                      NUMBER(10)
 ADDRESS                                                                                                                    VARCHAR2(30)

SQL> SPOOL OF
