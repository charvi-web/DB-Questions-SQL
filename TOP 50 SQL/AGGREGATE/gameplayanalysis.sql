SELECT ROUND(  (COUNT(DISTINCT A.player_id))*1.0/(SELECT COUNT(DISTINCT player_id) FROM Activity),2)
AS fraction
FROM Activity A 
JOIN (
    SELECT player_id, MIN(event_date) as first_date FROM Activity GROUP BY player_id
) B 
ON A.player_id = B.player_id WHERE A.event_date = B.first_date+1