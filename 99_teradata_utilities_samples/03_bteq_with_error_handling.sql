.logon 127.0.0.1/dbc,dbc;

/*Correct SQL without any errors*/

SELECT CURRENT_DATE;

.IF ERRORCODE <> 0 THEN .EXIT ERRORCODE;

--SQL with issues. Date is misspelled as DAT

SELECT CURRENT_DAT;

/*Exits with actual error code returned by Teradata*/

--.IF ERRORCODE <> 0 THEN .EXIT ERRORCODE;

/*Exits with custom error code set by developer*/

.IF ERRORCODE <> 0 THEN .EXIT 5;

/*QUIT does the same like EXIT. EXIT cannot be used in Macro*/

--.IF ERRORCODE <> 0 THEN .QUIT ERRORCODE;

.LOGOFF;
