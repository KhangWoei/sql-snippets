SELECT 
    datname AS database,
    pg_size_pretty(pg_database_size(datname)) as database_size
FROM pg_database;
