SELECT p.pid, p.name, p.path, p.cmdline, datetime(p.start_time, 'unixepoch','localtime') AS started
FROM processes p
WHERE p.name = 'runas.exe'
  AND p.start_time > strftime('%s','now','-24 hours');

-- elevated token processes (if supported in schema)
SELECT p.pid, p.name, p.path, p.cmdline, u.username
FROM processes p
LEFT JOIN users u ON p.uid = u.uid
WHERE p.elevated_token = 1;
