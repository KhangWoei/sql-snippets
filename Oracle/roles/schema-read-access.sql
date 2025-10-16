BEGIN
    FOR t IN (
        SELECT owner, table_name
        FROM all_tables
        WHERE owner = :Grantor
    ) LOOP
        EXECUTE IMMEDIATE 'GRANT SELECT ON ' || t.owner || '.' || t.table_name || ' TO ' || :Grantee;
    END LOOP;
END;
