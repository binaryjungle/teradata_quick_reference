DEFINE JOB MY_TPT_JOB
(

 DEFINE SCHEMA SOURCE_SCHEMA
 (
   EMP_ID       VARCHAR(20)
  ,EMP_NAME     VARCHAR(100)
  ,GENDER       VARCHAR(1)
  ,EMAIL        VARCHAR(100)
  ,PHONE        VARCHAR(15)
  ,JOINING_DATE VARCHAR(10)
  ,STATE        VARCHAR(50)
 );

 DEFINE OPERATOR FILE_READER
 TYPE DATACONNECTOR PRODUCER
 SCHEMA SOURCE_SCHEMA
 ATTRIBUTES
 (
   VARCHAR PrivateLogName = 'FILE_READER.LOG'
  ,VARCHAR FileName       = '/root/Desktop/teradata_quick_reference/data/create_large_file.txt'
  ,VARCHAR Format         = 'Delimited'
  ,VARCHAR OpenMode       = 'Read'
  ,INTEGER SkipRows       = 1
  ,VARCHAR TextDelimiter  = '|'
 );

 DEFINE OPERATOR TABLE_LOADER
 TYPE UPDATE
 SCHEMA SOURCE_SCHEMA
 ATTRIBUTES
 (
   VARCHAR PrivateLogName = 'TABLE_LOADER.LOG'
  ,VARCHAR DateForm       = 'INTEGERDATE'
  ,VARCHAR TdpId          = '127.0.0.1'
  ,VARCHAR UserName       = 'ABC_ADMIN'
  ,VARCHAR UserPassword   = 'ADMIN123'
  ,VARCHAR TargetTable    = 'MASTER_DB.EMPLOYEE'
  ,VARCHAR ErrorTable1    = 'MASTER_DB.ET_EMPLOYEE'
  ,VARCHAR ErrorTable2    = 'MASTER_DB.UV_EMPLOYEE'
  ,VARCHAR WorkTable      = 'MASTER_DB.WT_EMPLOYEE'
  ,VARCHAR LogTable       = 'MASTER_DB.LG_EMPLOYEE'
 );
 
 STEP DATA_LOAD_OPERATION
 (
  APPLY
  (
   'INSERT INTO MASTER_DB.EMPLOYEE
    (
      EMP_ID
     ,EMP_NAME
     ,GENDER
     ,EMAIL
     ,PHONE
     ,JOINING_DATE
     ,STATE
    )
    VALUES
    (
      :EMP_ID
     ,:EMP_NAME
     ,:GENDER
     ,:EMAIL
     ,:PHONE
     ,CAST(:JOINING_DATE AS DATE)
     ,:STATE
    );
   '
  )
  TO OPERATOR (TABLE_LOADER)
  SELECT * FROM OPERATOR (FILE_READER);
 );

);
