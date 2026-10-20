


USE music_curator;



-- =========================== Test Data =========================== 

INSERT INTO Users (username, display_name) VALUES ('sprint_test', 'Sprint Test');
INSERT INTO Albums (title, release_date, primary_genre) VALUES ('Test Album', '2026-01-01', 'Rock');
SET @album = LAST_INSERT_ID();

INSERT INTO Songs (title, duration_seconds) VALUES ('Test Song', 180);
SET @song = LAST_INSERT_ID();

-- ===========================  [1] Optional Album Reviews =========================== 

-- ------------------------- run valid -------------------------
-- [VALID] Written review
INSERT INTO Rates (username, album_id, rating, review) VALUES ('sprint_test', @album, 4, 'Great album');

-- show output
SELECT * FROM Rates WHERE username = 'sprint_test' AND album_id = @album;

-- [VALID] No written review
UPDATE Rates SET review = NULL WHERE username = 'sprint_test' AND album_id = @album;

-- show output
SELECT * FROM Rates WHERE username = 'sprint_test' AND album_id = @album;


-- ------------------------- run invalid -------------------------

-- [INVALID] Whitespace-only review
UPDATE Rates SET review = '   ' WHERE username = 'sprint_test' AND album_id = @album;

-- [INVALID] Empty review
UPDATE Rates SET review = '' WHERE username = 'sprint_test' AND album_id = @album;

-- Original review should remain
SELECT * FROM Rates WHERE username = 'sprint_test' AND album_id = @album;


-- ===========================  [2] List Subtypes Reference Existing Lists =========================== 

-- ------------------------- run valid -------------------------

INSERT INTO Lists (username, title, list_type) VALUES ('sprint_test', 'Test Song List', 'SONG');
SET @song_list = LAST_INSERT_ID();

-- [VALID] Subtype references an existing matching parent
INSERT INTO SongLists (list_id) VALUES (@song_list);

-- show output
SELECT Lists.list_id, Lists.list_type, SongLists.list_type AS subtype
FROM Lists JOIN SongLists ON Lists.list_id = SongLists.list_id
WHERE Lists.list_id = @song_list;


-- ------------------------- run invalid -------------------------

-- Confirm this ID is absent before the invalid test
SELECT list_id FROM Lists WHERE list_id = 999999;
-- [INVALID] Subtype references a nonexistent parent
INSERT INTO SongLists (list_id) VALUES (999999);


-- ===========================  [3] Subtype consistency =========================== 

-- ------------------------- run valid -------------------------

-- Create matching ALBUM parent & subtype
INSERT INTO Lists (username, title, list_type)
VALUES ('sprint_test', 'Test Album List', 'ALBUM');

SET @album_list = LAST_INSERT_ID();

-- [VALID] ALBUM parent belongs to AlbumLists
INSERT INTO AlbumLists (list_id)
VALUES (@album_list);

-- show output
SELECT
    Lists.list_id,
    Lists.list_type,
    SongLists.list_id IS NOT NULL AS in_songlists,
    AlbumLists.list_id IS NOT NULL AS in_albumlists
FROM Lists
LEFT JOIN SongLists ON Lists.list_id = SongLists.list_id
LEFT JOIN AlbumLists ON Lists.list_id = AlbumLists.list_id
WHERE Lists.list_id IN (@song_list, @album_list);


-- ------------------------- run invalid -------------------------

-- [INVALID] That SONG parent cannot also belong to AlbumLists
INSERT INTO AlbumLists (list_id)
VALUES (@song_list);

-- [INVALID] ALBUM parent cannot belong to SongLists
INSERT INTO SongLists (list_id)
VALUES (@album_list);


-- ===========================  [4] List content restrictions =========================== 

-- ------------------------- run valid -------------------------
 
-- [VALID] Song in a song list.
INSERT INTO ListSongs (list_id, song_id, position)
VALUES (@song_list, @song, 1);

-- [VALID] Album in an album list.
INSERT INTO ListAlbums (list_id, album_id, position)
VALUES (@album_list, @album, 1);

-- show output
SELECT 'SONG' AS content_type, list_id, song_id AS item_id, position
FROM ListSongs
WHERE list_id = @song_list
UNION ALL
SELECT 'ALBUM', list_id, album_id, position
FROM ListAlbums
WHERE list_id = @album_list;


-- ------------------------- run invalid -------------------------

-- [INVALID] Album in a song list.
INSERT INTO ListAlbums (list_id, album_id, position)
VALUES (@song_list, @album, 1);

-- [INVALID] Song in an album list.
INSERT INTO ListSongs (list_id, song_id, position)
VALUES (@album_list, @song, 1);


-- ===========================  [5] Composite uniqueness =========================== 

-- Inspect the definition to show UNIQUE (list_id, list_type)
SHOW CREATE TABLE Lists;

-- This supports the composite foreign keys tested in section 3
-- No separate duplicate-ID test proves this new constraint:
-- duplicate list_id values were already blocked by the primary key


-- ===========================  [6] Timestamp order =========================== 

-- ------------------------- run valid -------------------------

-- [VALID] updated_at follows created_at
INSERT INTO Lists(username, title, list_type, created_at, updated_at)
VALUES('sprint_test', 'Valid Dates', 'SONG','2026-01-01 12:00:00', '2026-01-02 12:00:00');
SET @date_list = LAST_INSERT_ID();

-- show output
SELECT title, created_at, updated_at FROM Lists WHERE list_id = @date_list;


-- ------------------------- run invalid -------------------------

-- [INVALID] updated_at precedes created_at
INSERT INTO Lists (username, title, list_type, created_at, updated_at)
VALUES ('sprint_test', 'Invalid Dates', 'SONG', '2026-01-02 12:00:00', '2026-01-01 12:00:00');


-- ===========================  [7] Automatic timestamp updates =========================== 

-- ------------------------- run valid -------------------------

-- Show the original timestamp
SELECT title, created_at, updated_at
FROM Lists
WHERE list_id = @date_list;

-- Change the title without setting updated_at
UPDATE Lists
SET title = 'Updated Title'
WHERE list_id = @date_list;

-- updated_at should now show the current timestamp
SELECT title, created_at, updated_at
FROM Lists
WHERE list_id = @date_list;

