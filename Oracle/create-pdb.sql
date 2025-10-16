CREATE PLUGGABLE DATABASE TEST_PDB
ADMIN USER TEST_PDB_ADMIN IDENTIFIED BY "Password1" 
ROLES = (DBA)
FILE_NAME_CONVERT = (
    '/opt/oracle/oradata/XE/pdbseed/',
    '/opt/oracle/oradata/XE/test_pdb/'
)
