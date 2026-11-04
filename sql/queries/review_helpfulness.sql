-- Rank written reviews by how helpful other users found them.
-- Only reviews with at least 5 votes and a helpful ratio above 0.8
-- are kept. The ratio test is written as 5 * helpful > 4 * total so
-- it is exact integer arithmetic rather than rounded division.
-- Ties: newest rated_at first, then username, then album_id.
SELECT
    r.username                   AS reviewer_username,
    r.album_id,
    r.rated_at,
    SUM(v.is_helpful)            AS helpful_count,
    COUNT(*)                     AS total_votes,
    SUM(v.is_helpful) / COUNT(*) AS helpful_ratio
FROM Rates AS r
JOIN ReviewVotes AS v
    ON v.reviewer_username = r.username
   AND v.album_id = r.album_id
WHERE r.review IS NOT NULL -- votes on ratings without review text are ignored
GROUP BY r.username, r.album_id, r.rated_at
HAVING COUNT(*) >= 5
   AND 5 * SUM(v.is_helpful) > 4 * COUNT(*)
ORDER BY
    helpful_count DESC,
    r.rated_at DESC,
    r.username ASC,
    r.album_id ASC;
