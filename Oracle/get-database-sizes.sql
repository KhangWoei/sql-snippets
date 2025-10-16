SELECT
   c.name,
   ROUND(SUM(df.bytes) / 1024 / 1024/ 1024, 2) AS size_gb
FROM v$containers c
LEFT JOIN cdb_data_files df ON c.con_id = df.con_id
GROUP BY c.name;
