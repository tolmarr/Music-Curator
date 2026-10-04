USE music_curator;


-- ----------------------------
-- (1) Retrieve related data --
-- ----------------------------
-- query connected tables to see who favourites each album
-- and which songs appear in list1 in their specified order

-- select from Favourites, joining Users and Albums for their names
-- Expected: displayname1 and displayname2 both favourite album1
SELECT u.display_name, a.title
FROM Favourites f
JOIN Users u ON u.username = f.username
JOIN Albums a ON a.album_id = f.album_id;

-- select from Lists, joining ListSongs and Songs for list1's contents.
-- Expected: 
--      list1, position 1, song1
--      list1, position 2, song2
SELECT l.title, ls.position, s.title
FROM Lists l
JOIN ListSongs ls ON ls.list_id = l.list_id
JOIN Songs s ON s.song_id = ls.song_id
WHERE l.list_id = 1
ORDER BY ls.position;


-- ---------------------------
-- (2) Update existing data --
-- ---------------------------
-- changing a stored rating then query it to confirm
-- the existing row was updated rather than adding another rating

-- update rates for user1 and album1, then select that pair
-- Expected: one row containing user1, album_id 1, rating 3
UPDATE Rates SET rating = 3
WHERE username = 'user1' AND album_id = 1;

SELECT * FROM Rates
WHERE username = 'user1' AND album_id = 1;


-- -----------------------
-- (3) Test constraints --
-- -----------------------

-- these inserts test: 
-- 1. duplicate usernames:          PRIMARY KEY
-- 2. missing display name:         NOT NULL
-- 3. duplicate favourite pairs:    composite PRIMARY KEY
-- 4. duplicate rating pairs:       composite PRIMARY KEY
-- 5. nonexistent album:            FOREIGN KEY
-- 6. rating outside 1-5:           CHECK
-- 7. List2 is not in SongLists:    FOREIGN KEY


-- by running separately, each query should be rejected with an error

-- 1. duplicate username: PRIMARY KEY
INSERT INTO Users VALUES ('user1', 'displayname4');
-- 2. missing display name: NOT NULL
INSERT INTO Users VALUES ('user4', NULL);
-- 3. duplicate favourite pair: composite PRIMARY KEY
INSERT INTO Favourites VALUES ('user1', 1);
-- 4. duplicate rating pair: composite PRIMARY KEY
INSERT INTO rates VALUES ('user1', 1, 2);
-- 5. nonexistent album: FOREIGN KEY
INSERT INTO Favourites VALUES ('user1', 999);
-- 6. rating outside 1–5: CHECK
INSERT INTO rates VALUES ('user2', 2, 6);



