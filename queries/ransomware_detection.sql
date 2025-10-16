SELECT
  f.path, f.filename, f.size, f.mtime,
  h.md5, h.sha1, h.sha256
FROM file f
JOIN hash h ON f.path = h.path
WHERE f.path LIKE 'C:/Users/%/Desktop/%'
  AND f.mtime > strftime('%s','now','-1 hour')
  AND (
    f.filename LIKE '%.encrypted' OR f.filename LIKE '%.locked' OR
    f.filename LIKE '%.crypted' OR f.filename LIKE '%.enc' OR f.filename LIKE '%.lock'
  );
