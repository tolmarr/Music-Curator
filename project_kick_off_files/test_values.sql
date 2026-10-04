USE music_curator;

-- ----------------------
-- (1) insert entities --
-- ----------------------
-- Create users, artists, albums, and songs by inserting their required details
-- Users are identified by the supplied username 
-- artist, album, and song IDs are generated automatically

-- 3 Users: each with a username and display name
INSERT INTO Users VALUES
('user1', 'displayname1'),
('user2', 'displayname2'),
('user3', 'displayname3');

-- 2 Artists: each with an artist name
-- AUTO_INCREMENT generates an artist_id for each inserted artist
INSERT INTO Artists (artist_name) VALUES
('artist1'),
('artist2');

-- 2 Albums: each with a title, release date & genre
-- AUTO_INCREMENT generates an album_id for each inserted album
INSERT INTO Albums (title, release_date, primary_genre) VALUES
('album1', '2024-01-01', 'genre1'),
('album2', '2025-01-01', 'genre2');

-- 2 Songs: song1 has a 100 second duration & song2 has a 200 duration
-- AUTO_INCREMENT generates a song_id for each inserted song
INSERT INTO Songs (title, duration_seconds) VALUES
('song1', 100),
('song2', 200);

-- ---------------------------
-- (2) create curated lists --
-- ---------------------------
-- list_type identifies each list as SONG or ALBUM
-- List IDs are generated, timestamps use their defaults

-- user1 owns song list1; user2 owns album list2
INSERT INTO Lists (username, title, list_type) VALUES
('user1', 'list1', 'SONG'),
('user2', 'list2', 'ALBUM');

-- add both songs to list1 at positions 1 and 2
INSERT INTO ListSongs (list_id, song_id, position) VALUES
(1, 1, 1),
(1, 2, 2);

-- add both albums to list2 at positions 1 and 2
INSERT INTO ListAlbums (list_id, album_id, position) VALUES
(2, 1, 1),
(2, 2, 2);

-- ---------------------------
-- (3) create curated lists --
-- ---------------------------

-- user1 rates album1=5 and album2=1; user2 rates album1=4.
INSERT INTO Rates VALUES
('user1', 1, 5),
('user1', 2, 1),
('user2', 1, 4);

-- user1 and user2 both favourite album1
INSERT INTO Favourites VALUES
('user1', 1),
('user2', 1);

-- artist1 on song1, artist2 on song2
INSERT INTO Performs VALUES
(1, 1, 'credit1'),
(2, 2, 'credit2');


-- --------------
-- show tables --
-- --------------


SELECT * FROM Users;
SELECT * FROM Artists;
SELECT * FROM Albums;
SELECT * FROM Songs;
SELECT * FROM Lists;
SELECT * FROM ListSongs;
SELECT * FROM ListAlbums;
SELECT * FROM Rates;
SELECT * FROM Favourites;
SELECT * FROM Performs;





