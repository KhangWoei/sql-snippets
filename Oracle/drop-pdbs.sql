BEGIN
    BEGIN
        EXECUTE IMMEDIATE 'ALTER PLUGGABLE DATABASE ' || :pdb || '  CLOSE IMMEDIATE';
    EXCEPTION
        WHEN OTHERS THEN
            --ORA-65020: Pluggable database string already closed
            IF SQLCODE NOT IN (-65020) THEN
                RAISE;
            END IF;
    END;

    EXECUTE IMMEDIATE 'DROP PLUGGABLE DATABASE ' || :pdb || ' INCLUDING DATAFILES';
END;
