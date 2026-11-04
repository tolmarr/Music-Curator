-- Album Leaderboard
-- Albums must have at least 5 ratings to rank
-- If two albums have the same avg rating, then the higher ranking one is the one with more ratings

Select
    a.album_id,
    a.title,
    ROUND(AVG(r.rating), 2) AS average_rating,
    COUNT(*) AS total_ratings
FROM Albums AS a
JOIN Rates AS r
    ON a.album_id = r.album_id
GROUP BY a.album_id, a.title -- rows with same album title and ablum id are treated as one group for aggregation
HAVING COUNT(*) >= 1
ORDER BY
    AVG(r.rating) DESC, 
    COUNT(*) DESC,
    a.album_id ASC
LIMIT 10;