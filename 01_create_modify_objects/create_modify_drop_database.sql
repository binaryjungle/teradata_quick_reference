--Creates DATABASE with few or all of below attributes.
--Full list of such attributes for DATABASES can be found in Teradata documentation.

CREATE DATABASE SAMPLE_DB --Name to DATABASE
FROM DBC --From which parent DATABASE this DATABASE is to be created.
AS
PERMANENT = 10000000000 --Spaces are allocated.
SPOOL = 5000000000
TEMPORARY = 5000000000 
NO FALLBACK;

--Modify one or more of DATABASES' attributes. Below example changes DATABASE's maximum spool space.

MODIFY DATABASE SAMPLE_DB
AS
SPOOL = 1000000000;

---Drop the DATABASE from the system/server.

DROP DATABASE SAMPLE_DB;