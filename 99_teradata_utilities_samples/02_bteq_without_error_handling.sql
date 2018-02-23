.logon 127.0.0.1/dbc,dbc;

--SQL with issues. Date is misspelled as DAT

SELECT CURRENT_DAT;

--Fails with standard return code 8 which represents a error in most programming languages.

.LOGOFF;
