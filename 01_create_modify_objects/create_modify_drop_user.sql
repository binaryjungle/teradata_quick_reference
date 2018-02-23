--Creates USER with few or all of below attributes.
--Full list of such attributes for USERS can be found in Teradata documentation.

CREATE USER SAMPLE_USER
FROM DBC 
AS
PASSWORD = SAMPLEUSER123 --Password NOT to be surrounded with single or double quotes.
PERMANENT = 0 --0 space is permissible.
SPOOL = 5000000000
TEMPORARY = 5000000000
DEFAULT DATABASE = SAMPLE_USER --It is possible to assign a USER with default database.
NO FALLBACK;

--Modify one or more of USER attributes. Below example changes USER's password.

MODIFY USER SAMPLE_USER
AS
PASSWORD = SAMPLEUSER456; --Changing USER password happens like this even though if web tools are provided within an organization.

---Drop the USER from the system/server.

DROP USER SAMPLE_USER;