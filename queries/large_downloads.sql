SELECT
  u.username, f.filename, f.path, f.size,
  datetime(f.mtime, 'unixepoch', 'localtime') AS mtime_local
FROM users u
JOIN file f ON f.uid = u.uid
WHERE f.path LIKE 'C:/Users/%/Downloads/%'
  AND f.size > 1000000000
  AND f.mtime > strftime('%s','now','-24 hours');
