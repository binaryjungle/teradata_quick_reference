SELECT
DATABASENAME
,SUM(MAXPERM)/(1000*1000*1000) AS ALLOCATED_SPACE
,(MAX(CURRENTPERM) * (HASHAMP() + 1))/(1000*1000*1000) AS USED_SPACE
,ALLOCATED_SPACE - USED_SPACE AS FREE_SPACE
FROM DBC.DISKSPACE
GROUP BY 1;
 
SELECT * FROM DBC.DATABASESV;

SELECT
(MAX(CURRENTPERM)*(HASHAMP()+1))/(1000*1000) AS USED_SPACE
,(1-(AVG(CURRENTPERM)/MAX(CURRENTPERM)))*100 AS SKEW_PERCENT
FROM DBC.TABLESIZE
WHERE DATABASENAME = 'DBC'
AND TABLENAME = 'TVM';
