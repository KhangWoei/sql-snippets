DECLARE
    current_value VARCHAR(4000);
    target_value CONSTANT VARCHAR2(4000) := '/opt/oracle/oradata';
BEGIN
    SELECT value INTO current_value
    FROM v$parameter
    WHERE name = 'db_create_file_dest';

    IF current_value IS NULL THEN
        EXECUTE IMMEDIATE 'ALTER SYSTEM SET db_create_file_dest = ''' || target_value || ''' SCOPE=BOTH';
    END IF;
END;

