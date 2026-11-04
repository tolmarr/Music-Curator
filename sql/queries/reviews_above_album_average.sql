-- Written reviews whose helpful count is above the average helpful
-- count of written reviews on the same album.
-- helpful_counts holds one row per written review; reviews with no
-- votes count as 0 so they still pull the album's average down.
WITH helpful_counts AS (
    SELECT
        r.username,
        r.album_id,
        r.rated_at,
        COALESCE(SUM(v.is_helpful), 0) AS helpful_count
    FROM Rates AS r
    LEFT JOIN ReviewVotes AS v
        ON v.reviewer_username = r.username
       AND v.album_id = r.album_id
    WHERE r.review IS NOT NULL
    GROUP BY r.username, r.album_id, r.rated_at
)
SELECT
    hc.username AS reviewer_username,
    hc.album_id,
    hc.helpful_count
FROM helpful_counts AS hc
WHERE hc.helpful_count > (
    SELECT AVG(h2.helpful_count)
    FROM helpful_counts AS h2
    WHERE h2.album_id = hc.album_id
)
ORDER BY
    hc.album_id ASC,
    hc.helpful_count DESC,
    hc.username ASC;
