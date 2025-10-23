-- Alternatively, modify the postgresql.conf file and reload the config

ALTER SYSTEM SET log_destionation = 'stderr';
ALTER SYSTEM SET logging_collector = on;
ALTER SYSTEM SET log_directory = 'log'; -- /var/lib/postgres/data/log
ALTER SYSTEM SET log_filename = 'postgresql-%Y-%m-%d_%H%M%S.log';

ALTER SYSTEM SET log_min_duration_statement = 1000;
ALTER SYSTEM SET log_connections = on;
ALTER SYSTEM SET log_disconnections = on;

ALTER SYSTEM SET log_line_prefix = '%t [%p%] [%a] %u@%d';

ALTER SYSTEM SET log_statement = 'ddl'; -- none, ddl, mod, all

SELECt pg_reload_conf();
