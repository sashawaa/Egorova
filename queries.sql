SELECT d.name, e.event_time, e.event_type, e.value
FROM events e
JOIN devices d ON e.device_id = d.device_id
WHERE d.name = 'Термостат-01'
ORDER BY e.event_time;
SELECT event_type, COUNT(*) AS event_count
FROM events
GROUP BY event_type;
SELECT d.name, d.location, COUNT(e.event_id) AS error_count
FROM devices d
JOIN events e ON d.device_id = e.device_id
WHERE e.event_type = 'ошибка'
GROUP BY d.device_id
HAVING COUNT(e.event_id) > 1;
SELECT d.name, MAX(e.event_time) AS last_event_time
FROM devices d
JOIN events e ON d.device_id = e.device_id
GROUP BY d.device_id;
SELECT d.name, d.location
FROM devices d
LEFT JOIN events e ON d.device_id = e.device_id AND e.event_type = 'ошибка'
WHERE e.event_id IS NULL;
