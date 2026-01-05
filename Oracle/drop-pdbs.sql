BEGIN
      FOR pdb IN (SELECT name, open_mode FROM v$PDBS WHERE name LIKE :pattern) LOOP
            IF pdb.open_mode != 'MOUNTED' THEN
                EXECUTE IMMEDIATE 'ALTER PLUGGABLE DATABASE ' || pdb.name || ' CLOSE IMMEDIATE';
            END IF;

            EXECUTE IMMEDIATE 'DROP PLUGGABLE DATABASE ' || pdb.name || ' INCLUDING DATAFILES';
      END LOOP;
END;
  
