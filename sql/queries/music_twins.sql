SET @target_username = 'user_in_our_db';
SET @min_shared = 3;

SELECT
    Users.username,
    Users.display_name,
    COUNT(*) AS shared_count
FROM Favourites AS mine
JOIN Favourites AS twin
    ON mine.album_id = twin.album_id
    AND mine.username <> twin.username
JOIN Users ON twin.username = Users.username
WHERE mine.username = @target_username
GROUP BY Users.username, Users.display_name
HAVING COUNT(*) >= @min_shared
ORDER BY shared_count DESC, Users.username;