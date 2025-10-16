SELECT
  s.username,
  s.program,
  s.status,
  s.type,
  TO_CHAR(s.logon_time, 'YYYY-MM-DD HH24:MI:SS') AS logon_datetime
FROM
  v$session s
JOIN v$process p 
    ON s.paddr = p.addr
WHERE
  s.type = 'USER'

