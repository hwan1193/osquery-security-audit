SELECT DISTINCT p.name, p.path, l.port, l.address, p.pid
FROM processes p
JOIN listening_ports l ON p.pid = l.pid
WHERE l.port > 1024
  AND l.address NOT IN ('127.0.0.1', '::1')
  AND p.name NOT IN ('chrome.exe','msedge.exe','firefox.exe','Teams.exe','Zoom.exe');
