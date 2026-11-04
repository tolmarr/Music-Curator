-- Display album reviews with certified curators first.
-- Reviews with the same certification status are sorted
-- newest first by rated_at, then alphabetically by username.
SELECT
    a.title AS album_title,
    u.username,
    u.display_name,
    u.is_certified_curator,
    r.rating,
    r.review
FROM Rates AS r -- r, the Rates table
JOIN Users AS u -- u, the Users table
    ON r.username = u.username
JOIN Albums AS a -- a, the Albums table
    ON r.album_id = a.album_id
WHERE r.review IS NOT NULL
ORDER BY
    u.is_certified_curator DESC,
    r.rated_at DESC,
    u.username ASC; -- if reviews share certification status and rated_at, sort alphabetically by username