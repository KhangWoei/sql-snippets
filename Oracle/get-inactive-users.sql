WITH active_users AS
(
 SELECT username
 FROM v$session
 WHERE status = 'ACTIVE'
)

SELECT
 u.username,
 CASE
     WHEN s.sid IS NOT NULL AND s.serial# IS NOT NULL THEN TO_CHAR(s.sid) || ',' || TO_CHAR(s.serial#)
     ELSE NULL
 END as session_info
FROM dba_users u
LEFT JOIN v$session s
 ON u.username = s.username
WHERE NOT EXISTS
(
 SELECT 1
 FROM active_users a
 WHERE a.username = u.username
)
