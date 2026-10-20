-- ========================== Test Data ==========================


-- Populate database with 2 users and 2 albums


SET @user1 = CONCAT('test_', UUID());
SET @user2 = CONCAT('test_', UUID());

INSERT INTO Users (username, display_name) VALUES (@user1, 'Trending Test User 1'), (@user2, 'Trending Test User 2');

INSERT INTO Albums (title, release_date, primary_genre) VALUES ('Trending Test Album 1', '2026-01-01', 'Rock');
SET @album1 = LAST_INSERT_ID();

INSERT INTO Albums (title, release_date, primary_genre) VALUES ('Trending Test Album 2', '2026-01-01', 'Pop');
SET @album2 = LAST_INSERT_ID();


-- ========================== A user rated an album ==========================

-- Both users rate album 1
-- only user 1 rates album 2


INSERT INTO Rates (username, album_id, rating, review) VALUES 
(@user1, @album1, 4, NULL), 
(@user2, @album1, 5, NULL), 
(@user1, @album2, 3, NULL);

-- album 1: 2 points
-- album 2: 1 point


-- ========================== A user added an album to a list ==========================

-- User 1 creates 2 album lists, adds album 1 to both, and adds album 2 to one


INSERT INTO Lists (username, title, list_type) VALUES (@user1, 'Trending Test List 1', 'ALBUM');
SET @list1 = LAST_INSERT_ID();

INSERT INTO Lists (username, title, list_type) VALUES (@user1, 'Trending Test List 2', 'ALBUM');
SET @list2 = LAST_INSERT_ID();

INSERT INTO AlbumLists (list_id) VALUES 
(@list1), 
(@list2);

INSERT INTO ListAlbums (list_id, album_id, position) VALUES 
(@list1, @album1, 1), 
(@list2, @album1, 1), 
(@list1, @album2, 2);


-- album 1: 2 points
-- album 2: 1 point



-- ========================== Trending query ==========================

-- Expected:
-- album 1: 2 points
-- album 2: 1 point

SELECT album_id, COUNT(*) AS trending
FROM (
    SELECT username, album_id
    FROM Rates

    UNION

    SELECT Lists.username, ListAlbums.album_id
    FROM ListAlbums JOIN Lists
    ON ListAlbums.list_id = Lists.list_id
) AS contributions
WHERE album_id IN (@album1, @album2)
GROUP BY album_id
ORDER BY trending DESC, album_id;