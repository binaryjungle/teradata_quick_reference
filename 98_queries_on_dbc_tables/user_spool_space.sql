SELECT SUM(MAXSPOOL)/(1000*1000*1000) FROM
DBC.DISKSPACE
WHERE DATABASENAME = 'ABC_ADMIN';

SELECT SPOOLSPACE/(1000*1000*1000) FROM DBC.DATABASESV
WHERE DATABASENAME = 'ABC_ADMIN';

SELECT SPOOLSPACE/(1000*1000*1000) FROM DBC.USERS
WHERE USERNAME = 'ABC_ADMIN';