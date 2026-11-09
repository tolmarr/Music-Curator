-- Load into empty catalogue tables; IDs start at 1
-- Partial release dates use 01 for missing months/days
USE music_curator;

SET @previous_sql_mode = @@SESSION.sql_mode;
SET SESSION sql_mode = CONCAT_WS(',', NULLIF(@previous_sql_mode, ''), 'NO_BACKSLASH_ESCAPES');

START TRANSACTION;

-- ==================== Album 1: OK Computer ====================

-- Artists
INSERT INTO Artists (artist_id, artist_name)
VALUES
    (1, 'Radiohead');

-- Albums
INSERT INTO Albums (album_id, title, release_date, primary_genre)
VALUES
    (1, 'OK Computer', '1997-05-21', 'alternative rock');

-- Songs
INSERT INTO Songs (song_id, title, duration_seconds)
VALUES
    (1, 'Airbag', 284),
    (2, 'Paranoid Android', 383),
    (3, 'Subterranean Homesick Alien', 268),
    (4, 'Exit Music (for a Film)', 265),
    (5, 'Let Down', 299),
    (6, 'Karma Police', 262),
    (7, 'Fitter Happier', 117),
    (8, 'Electioneering', 231),
    (9, 'Climbing Up the Walls', 285),
    (10, 'No Surprises', 229),
    (11, 'Lucky', 260),
    (12, 'The Tourist', 325);

-- ArtistAlbums
INSERT INTO ArtistAlbums (artist_id, album_id, credit_type)
VALUES
    (1, 1, 'credited artist');

-- AlbumSongs
INSERT INTO AlbumSongs (album_id, song_id, track_number)
VALUES
    (1, 1, 1),
    (1, 2, 2),
    (1, 3, 3),
    (1, 4, 4),
    (1, 5, 5),
    (1, 6, 6),
    (1, 7, 7),
    (1, 8, 8),
    (1, 9, 9),
    (1, 10, 10),
    (1, 11, 11),
    (1, 12, 12);

-- Performs
INSERT INTO Performs (artist_id, song_id, credit_type)
VALUES
    (1, 1, 'credited artist'),
    (1, 2, 'credited artist'),
    (1, 3, 'credited artist'),
    (1, 4, 'credited artist'),
    (1, 5, 'credited artist'),
    (1, 6, 'credited artist'),
    (1, 7, 'credited artist'),
    (1, 8, 'credited artist'),
    (1, 9, 'credited artist'),
    (1, 10, 'credited artist'),
    (1, 11, 'credited artist'),
    (1, 12, 'credited artist');

-- AlbumGenreTags
INSERT INTO AlbumGenreTags (album_id, genre_tag)
VALUES
    (1, 'alternative rock'),
    (1, 'art rock'),
    (1, 'britpop'),
    (1, 'electronic'),
    (1, 'experimental'),
    (1, 'experimental rock'),
    (1, 'indie rock'),
    (1, 'leftfield'),
    (1, 'neo-psychedelia'),
    (1, 'pop rock'),
    (1, 'post-britpop'),
    (1, 'progressive'),
    (1, 'rock'),
    (1, 'space rock revival');

-- ==================== Album 2: The Bends ====================

-- Albums
INSERT INTO Albums (album_id, title, release_date, primary_genre)
VALUES
    (2, 'The Bends', '1995-03-08', 'alternative rock');

-- Songs
INSERT INTO Songs (song_id, title, duration_seconds)
VALUES
    (13, 'Planet Telex', 259),
    (14, 'The Bends', 246),
    (15, 'High and Dry', 258),
    (16, 'Fake Plastic Trees', 291),
    (17, 'Bones', 189),
    (18, '(Nice Dream)', 233),
    (19, 'Just', 234),
    (20, 'My Iron Lung', 276),
    (21, 'Bullet Proof..I Wish I Was', 209),
    (22, 'Black Star', 247),
    (23, 'Sulk', 223),
    (24, 'Street Spirit (Fade Out)', 253),
    (25, 'How Can You Be Sure', 262),
    (26, 'Killer Cars', 183);

-- ArtistAlbums
INSERT INTO ArtistAlbums (artist_id, album_id, credit_type)
VALUES
    (1, 2, 'credited artist');

-- AlbumSongs
INSERT INTO AlbumSongs (album_id, song_id, track_number)
VALUES
    (2, 13, 1),
    (2, 14, 2),
    (2, 15, 3),
    (2, 16, 4),
    (2, 17, 5),
    (2, 18, 6),
    (2, 19, 7),
    (2, 20, 8),
    (2, 21, 9),
    (2, 22, 10),
    (2, 23, 11),
    (2, 24, 12),
    (2, 25, 13),
    (2, 26, 14);

-- Performs
INSERT INTO Performs (artist_id, song_id, credit_type)
VALUES
    (1, 13, 'credited artist'),
    (1, 14, 'credited artist'),
    (1, 15, 'credited artist'),
    (1, 16, 'credited artist'),
    (1, 17, 'credited artist'),
    (1, 18, 'credited artist'),
    (1, 19, 'credited artist'),
    (1, 20, 'credited artist'),
    (1, 21, 'credited artist'),
    (1, 22, 'credited artist'),
    (1, 23, 'credited artist'),
    (1, 24, 'credited artist'),
    (1, 25, 'credited artist'),
    (1, 26, 'credited artist');

-- AlbumGenreTags
INSERT INTO AlbumGenreTags (album_id, genre_tag)
VALUES
    (2, 'alternative rock'),
    (2, 'art rock'),
    (2, 'britpop'),
    (2, 'post-britpop'),
    (2, 'psychedelic'),
    (2, 'rock');

-- ==================== Album 3: Amnesiac ====================

-- Albums
INSERT INTO Albums (album_id, title, release_date, primary_genre)
VALUES
    (3, 'Amnesiac', '2001-05-30', 'alternative rock');

-- Songs
INSERT INTO Songs (song_id, title, duration_seconds)
VALUES
    (27, 'Packt Like Sardines in a Crushd Tin Box', 241),
    (28, 'Pyramid Song', 289),
    (29, 'Pulk/Pull Revolving Doors', 247),
    (30, 'You and Whose Army?', 191),
    (31, 'I Might Be Wrong', 294),
    (32, 'Knives Out', 255),
    (33, 'Morning Bell / Amnesiac', 194),
    (34, 'Dollars & Cents', 292),
    (35, 'Hunting Bears', 121),
    (36, 'Like Spinning Plates', 237),
    (37, 'Life in a Glasshouse', 275);

-- ArtistAlbums
INSERT INTO ArtistAlbums (artist_id, album_id, credit_type)
VALUES
    (1, 3, 'credited artist');

-- AlbumSongs
INSERT INTO AlbumSongs (album_id, song_id, track_number)
VALUES
    (3, 27, 1),
    (3, 28, 2),
    (3, 29, 3),
    (3, 30, 4),
    (3, 31, 5),
    (3, 32, 6),
    (3, 33, 7),
    (3, 34, 8),
    (3, 35, 9),
    (3, 36, 10),
    (3, 37, 11);

-- Performs
INSERT INTO Performs (artist_id, song_id, credit_type)
VALUES
    (1, 27, 'credited artist'),
    (1, 28, 'credited artist'),
    (1, 29, 'credited artist'),
    (1, 30, 'credited artist'),
    (1, 31, 'credited artist'),
    (1, 32, 'credited artist'),
    (1, 33, 'credited artist'),
    (1, 34, 'credited artist'),
    (1, 35, 'credited artist'),
    (1, 36, 'credited artist'),
    (1, 37, 'credited artist');

-- AlbumGenreTags
INSERT INTO AlbumGenreTags (album_id, genre_tag)
VALUES
    (3, 'alternative rock'),
    (3, 'art rock'),
    (3, 'electronic'),
    (3, 'experimental rock'),
    (3, 'rock');

-- ==================== Album 4: Pablo Honey ====================

-- Albums
INSERT INTO Albums (album_id, title, release_date, primary_genre)
VALUES
    (4, 'Pablo Honey', '1993-02-22', 'alternative rock');

-- Songs
INSERT INTO Songs (song_id, title, duration_seconds)
VALUES
    (38, 'You', 209),
    (39, 'Creep', 236),
    (40, 'How Do You?', 132),
    (41, 'Stop Whispering', 326),
    (42, 'Thinking About You', 162),
    (43, 'Anyone Can Play Guitar', 218),
    (44, 'Ripcord', 190),
    (45, 'Vegetable', 193),
    (46, 'Prove Yourself', 145),
    (47, 'I Can’t', 253),
    (48, 'Lurgee', 188),
    (49, 'Blow Out', 280);

-- ArtistAlbums
INSERT INTO ArtistAlbums (artist_id, album_id, credit_type)
VALUES
    (1, 4, 'credited artist');

-- AlbumSongs
INSERT INTO AlbumSongs (album_id, song_id, track_number)
VALUES
    (4, 38, 1),
    (4, 39, 2),
    (4, 40, 3),
    (4, 41, 4),
    (4, 42, 5),
    (4, 43, 6),
    (4, 44, 7),
    (4, 45, 8),
    (4, 46, 9),
    (4, 47, 10),
    (4, 48, 11),
    (4, 49, 12);

-- Performs
INSERT INTO Performs (artist_id, song_id, credit_type)
VALUES
    (1, 38, 'credited artist'),
    (1, 39, 'credited artist'),
    (1, 40, 'credited artist'),
    (1, 41, 'credited artist'),
    (1, 42, 'credited artist'),
    (1, 43, 'credited artist'),
    (1, 44, 'credited artist'),
    (1, 45, 'credited artist'),
    (1, 46, 'credited artist'),
    (1, 47, 'credited artist'),
    (1, 48, 'credited artist'),
    (1, 49, 'credited artist');

-- AlbumGenreTags
INSERT INTO AlbumGenreTags (album_id, genre_tag)
VALUES
    (4, 'alternative rock'),
    (4, 'britpop'),
    (4, 'grunge'),
    (4, 'indie rock'),
    (4, 'pop'),
    (4, 'pop rock'),
    (4, 'rock');

-- ==================== Album 5: Kid A ====================

-- Albums
INSERT INTO Albums (album_id, title, release_date, primary_genre)
VALUES
    (5, 'Kid A', '2000-08-03', 'electronic');

-- Songs
INSERT INTO Songs (song_id, title, duration_seconds)
VALUES
    (50, 'Everything in Its Right Place', 251),
    (51, 'Kid A', 284),
    (52, 'The National Anthem', 352),
    (53, 'How to Disappear Completely', 356),
    (54, 'Treefingers', 223),
    (55, 'Optimistic', 316),
    (56, 'In Limbo', 211),
    (57, 'Idioteque', 309),
    (58, 'Morning Bell', 276),
    (59, 'Motion Picture Soundtrack', 419),
    (60, '[unknown]', 52);

-- ArtistAlbums
INSERT INTO ArtistAlbums (artist_id, album_id, credit_type)
VALUES
    (1, 5, 'credited artist');

-- AlbumSongs
INSERT INTO AlbumSongs (album_id, song_id, track_number)
VALUES
    (5, 50, 1),
    (5, 51, 2),
    (5, 52, 3),
    (5, 53, 4),
    (5, 54, 5),
    (5, 55, 6),
    (5, 56, 7),
    (5, 57, 8),
    (5, 58, 9),
    (5, 59, 10),
    (5, 60, 11);

-- Performs
INSERT INTO Performs (artist_id, song_id, credit_type)
VALUES
    (1, 50, 'credited artist'),
    (1, 51, 'credited artist'),
    (1, 52, 'credited artist'),
    (1, 53, 'credited artist'),
    (1, 54, 'credited artist'),
    (1, 55, 'credited artist'),
    (1, 56, 'credited artist'),
    (1, 57, 'credited artist'),
    (1, 58, 'credited artist'),
    (1, 59, 'credited artist'),
    (1, 60, 'credited artist');

-- AlbumGenreTags
INSERT INTO AlbumGenreTags (album_id, genre_tag)
VALUES
    (5, 'alternative rock'),
    (5, 'ambient'),
    (5, 'ambient pop'),
    (5, 'art pop'),
    (5, 'art rock'),
    (5, 'avant-garde'),
    (5, 'electronic'),
    (5, 'electronica'),
    (5, 'experimental rock'),
    (5, 'idm'),
    (5, 'indie rock'),
    (5, 'indietronica'),
    (5, 'leftfield'),
    (5, 'post-rock'),
    (5, 'rock');

-- ==================== Album 6: Third ====================

-- Artists
INSERT INTO Artists (artist_id, artist_name)
VALUES
    (2, 'Portishead');

-- Albums
INSERT INTO Albums (album_id, title, release_date, primary_genre)
VALUES
    (6, 'Third', '2008-04-08', 'trip hop');

-- Songs
INSERT INTO Songs (song_id, title, duration_seconds)
VALUES
    (61, 'Silence', 301),
    (62, 'Hunter', 239),
    (63, 'Nylon Smile', 200),
    (64, 'The Rip', 271),
    (65, 'Plastic', 211),
    (66, 'We Carry On', 388),
    (67, 'Deep Water', 93),
    (68, 'Machine Gun', 286),
    (69, 'Small', 407),
    (70, 'Magic Doors', 212),
    (71, 'Threads', 348);

-- ArtistAlbums
INSERT INTO ArtistAlbums (artist_id, album_id, credit_type)
VALUES
    (2, 6, 'credited artist');

-- AlbumSongs
INSERT INTO AlbumSongs (album_id, song_id, track_number)
VALUES
    (6, 61, 1),
    (6, 62, 2),
    (6, 63, 3),
    (6, 64, 4),
    (6, 65, 5),
    (6, 66, 6),
    (6, 67, 7),
    (6, 68, 8),
    (6, 69, 9),
    (6, 70, 10),
    (6, 71, 11);

-- Performs
INSERT INTO Performs (artist_id, song_id, credit_type)
VALUES
    (2, 61, 'credited artist'),
    (2, 62, 'credited artist'),
    (2, 63, 'credited artist'),
    (2, 64, 'credited artist'),
    (2, 65, 'credited artist'),
    (2, 66, 'credited artist'),
    (2, 67, 'credited artist'),
    (2, 68, 'credited artist'),
    (2, 69, 'credited artist'),
    (2, 70, 'credited artist'),
    (2, 71, 'credited artist');

-- AlbumGenreTags
INSERT INTO AlbumGenreTags (album_id, genre_tag)
VALUES
    (6, 'downtempo'),
    (6, 'electronic'),
    (6, 'experimental rock'),
    (6, 'folk rock'),
    (6, 'trip hop');

-- ==================== Album 7: Portishead ====================

-- Albums
INSERT INTO Albums (album_id, title, release_date, primary_genre)
VALUES
    (7, 'Portishead', '1997-09-29', 'trip hop');

-- Songs
INSERT INTO Songs (song_id, title, duration_seconds)
VALUES
    (72, 'Cowboys', 282),
    (73, 'All Mine', 242),
    (74, 'Undenied', 265),
    (75, 'Half Day Closing', 228),
    (76, 'Over', 241),
    (77, 'Humming', 364),
    (78, 'Mourning Air', 256),
    (79, 'Seven Months', 259),
    (80, 'Only You', 302),
    (81, 'Elysium', 357),
    (82, 'Western Eyes', 239);

-- ArtistAlbums
INSERT INTO ArtistAlbums (artist_id, album_id, credit_type)
VALUES
    (2, 7, 'credited artist');

-- AlbumSongs
INSERT INTO AlbumSongs (album_id, song_id, track_number)
VALUES
    (7, 72, 1),
    (7, 73, 2),
    (7, 74, 3),
    (7, 75, 4),
    (7, 76, 5),
    (7, 77, 6),
    (7, 78, 7),
    (7, 79, 8),
    (7, 80, 9),
    (7, 81, 10),
    (7, 82, 11);

-- Performs
INSERT INTO Performs (artist_id, song_id, credit_type)
VALUES
    (2, 72, 'credited artist'),
    (2, 73, 'credited artist'),
    (2, 74, 'credited artist'),
    (2, 75, 'credited artist'),
    (2, 76, 'credited artist'),
    (2, 77, 'credited artist'),
    (2, 78, 'credited artist'),
    (2, 79, 'credited artist'),
    (2, 80, 'credited artist'),
    (2, 81, 'credited artist'),
    (2, 82, 'credited artist');

-- AlbumGenreTags
INSERT INTO AlbumGenreTags (album_id, genre_tag)
VALUES
    (7, 'acid jazz'),
    (7, 'alternative rock'),
    (7, 'dark jazz'),
    (7, 'downtempo'),
    (7, 'electronic'),
    (7, 'rock'),
    (7, 'trip hop');

-- ==================== Album 8: Dummy ====================

-- Albums
INSERT INTO Albums (album_id, title, release_date, primary_genre)
VALUES
    (8, 'Dummy', '1994-08-22', 'trip hop');

-- Songs
INSERT INTO Songs (song_id, title, duration_seconds)
VALUES
    (83, 'Mysterons', 306),
    (84, 'Sour Times', 254),
    (85, 'Strangers', 238),
    (86, 'It Could Be Sweet', 260),
    (87, 'Wandering Star', 294),
    (88, 'It’s a Fire', 229),
    (89, 'Numb', 238),
    (90, 'Roads', 305),
    (91, 'Pedestal', 221),
    (92, 'Biscuit', 304),
    (93, 'Glory Box', 306);

-- ArtistAlbums
INSERT INTO ArtistAlbums (artist_id, album_id, credit_type)
VALUES
    (2, 8, 'credited artist');

-- AlbumSongs
INSERT INTO AlbumSongs (album_id, song_id, track_number)
VALUES
    (8, 83, 1),
    (8, 84, 2),
    (8, 85, 3),
    (8, 86, 4),
    (8, 87, 5),
    (8, 88, 6),
    (8, 89, 7),
    (8, 90, 8),
    (8, 91, 9),
    (8, 92, 10),
    (8, 93, 11);

-- Performs
INSERT INTO Performs (artist_id, song_id, credit_type)
VALUES
    (2, 83, 'credited artist'),
    (2, 84, 'credited artist'),
    (2, 85, 'credited artist'),
    (2, 86, 'credited artist'),
    (2, 87, 'credited artist'),
    (2, 88, 'credited artist'),
    (2, 89, 'credited artist'),
    (2, 90, 'credited artist'),
    (2, 91, 'credited artist'),
    (2, 92, 'credited artist'),
    (2, 93, 'credited artist');

-- AlbumGenreTags
INSERT INTO AlbumGenreTags (album_id, genre_tag)
VALUES
    (8, 'acid jazz'),
    (8, 'downtempo'),
    (8, 'electronic'),
    (8, 'trip hop');

-- ==================== Album 9: Glory Times ====================

-- Albums
INSERT INTO Albums (album_id, title, release_date, primary_genre)
VALUES
    (9, 'Glory Times', '1995-06-07', 'trip hop');

-- Songs
INSERT INTO Songs (song_id, title, duration_seconds)
VALUES
    (94, 'Sour Sour Times', 248),
    (95, 'Lot More', 262),
    (96, 'Sheared Times', 259),
    (97, 'Airbus Reconstruction', 310),
    (98, 'Theme From To Kill a Dead Man', 264),
    (99, 'Glory Box (edit)', 217),
    (100, 'Glory Box (Mudflap mix)', 334),
    (101, 'Scorn', 367),
    (102, 'Sheared Box', 210),
    (103, 'Toy Box', 344);

-- ArtistAlbums
INSERT INTO ArtistAlbums (artist_id, album_id, credit_type)
VALUES
    (2, 9, 'credited artist');

-- AlbumSongs
INSERT INTO AlbumSongs (album_id, song_id, track_number)
VALUES
    (9, 94, 1),
    (9, 95, 2),
    (9, 96, 3),
    (9, 97, 4),
    (9, 98, 5),
    (9, 99, 6),
    (9, 100, 7),
    (9, 101, 8),
    (9, 102, 9),
    (9, 103, 10);

-- Performs
INSERT INTO Performs (artist_id, song_id, credit_type)
VALUES
    (2, 94, 'credited artist'),
    (2, 95, 'credited artist'),
    (2, 96, 'credited artist'),
    (2, 97, 'credited artist'),
    (2, 98, 'credited artist'),
    (2, 99, 'credited artist'),
    (2, 100, 'credited artist'),
    (2, 101, 'credited artist'),
    (2, 102, 'credited artist'),
    (2, 103, 'credited artist');

-- AlbumGenreTags
INSERT INTO AlbumGenreTags (album_id, genre_tag)
VALUES
    (9, 'electronic'),
    (9, 'rock'),
    (9, 'trip hop');

-- ==================== Album 10: 2 for 1: Dummy + Portishead ====================

-- Partial source date: missing month/day set to 01

-- Albums
INSERT INTO Albums (album_id, title, release_date, primary_genre)
VALUES
    (10, '2 for 1: Dummy + Portishead', '2009-01-01', 'downtempo');

-- Songs
INSERT INTO Songs (song_id, title, duration_seconds)
VALUES
    (104, 'Strangers', 238),
    (105, 'Roads', 310);

-- ArtistAlbums
INSERT INTO ArtistAlbums (artist_id, album_id, credit_type)
VALUES
    (2, 10, 'credited artist');

-- AlbumSongs
INSERT INTO AlbumSongs (album_id, song_id, track_number)
VALUES
    (10, 83, 1),
    (10, 84, 2),
    (10, 104, 3),
    (10, 86, 4),
    (10, 87, 5),
    (10, 89, 6),
    (10, 105, 7),
    (10, 91, 8),
    (10, 92, 9),
    (10, 93, 10),
    (10, 72, 11),
    (10, 73, 12),
    (10, 74, 13),
    (10, 75, 14),
    (10, 76, 15),
    (10, 77, 16),
    (10, 78, 17),
    (10, 79, 18),
    (10, 80, 19),
    (10, 81, 20),
    (10, 82, 21);

-- Performs
INSERT INTO Performs (artist_id, song_id, credit_type)
VALUES
    (2, 104, 'credited artist'),
    (2, 105, 'credited artist');

-- AlbumGenreTags
INSERT INTO AlbumGenreTags (album_id, genre_tag)
VALUES
    (10, 'downtempo'),
    (10, 'electronic'),
    (10, 'trip hop');

-- ==================== Album 11: Heligoland ====================

-- Artists
INSERT INTO Artists (artist_id, artist_name)
VALUES
    (3, 'Massive Attack');

-- Albums
INSERT INTO Albums (album_id, title, release_date, primary_genre)
VALUES
    (11, 'Heligoland', '2010-02-03', 'downtempo');

-- Songs
INSERT INTO Songs (song_id, title, duration_seconds)
VALUES
    (106, 'Pray for Rain', 404),
    (107, 'Babel', 320),
    (108, 'Splitting the Atom', 317),
    (109, 'Girl I Love You', 327),
    (110, 'Psyche', 205),
    (111, 'Flat of the Blade', 330),
    (112, 'Paradise Circus', 298),
    (113, 'Rush Minute', 291),
    (114, 'Saturday Come Slow', 224),
    (115, 'Atlas Air', 473),
    (116, 'Fatalism (Ryuichi Sakamoto & Yukihrio Takahashi remix)', 293);

-- ArtistAlbums
INSERT INTO ArtistAlbums (artist_id, album_id, credit_type)
VALUES
    (3, 11, 'credited artist');

-- AlbumSongs
INSERT INTO AlbumSongs (album_id, song_id, track_number)
VALUES
    (11, 106, 1),
    (11, 107, 2),
    (11, 108, 3),
    (11, 109, 4),
    (11, 110, 5),
    (11, 111, 6),
    (11, 112, 7),
    (11, 113, 8),
    (11, 114, 9),
    (11, 115, 10),
    (11, 116, 11);

-- Performs
INSERT INTO Performs (artist_id, song_id, credit_type)
VALUES
    (3, 106, 'credited artist'),
    (3, 107, 'credited artist'),
    (3, 108, 'credited artist'),
    (3, 109, 'credited artist'),
    (3, 110, 'credited artist'),
    (3, 111, 'credited artist'),
    (3, 112, 'credited artist'),
    (3, 113, 'credited artist'),
    (3, 114, 'credited artist'),
    (3, 115, 'credited artist'),
    (3, 116, 'credited artist');

-- AlbumGenreTags
INSERT INTO AlbumGenreTags (album_id, genre_tag)
VALUES
    (11, 'art rock'),
    (11, 'downtempo'),
    (11, 'electronic'),
    (11, 'trip hop');

-- ==================== Album 12: Mezzanine ====================

-- Albums
INSERT INTO Albums (album_id, title, release_date, primary_genre)
VALUES
    (12, 'Mezzanine', '1998-04-17', 'trip hop');

-- Songs
INSERT INTO Songs (song_id, title, duration_seconds)
VALUES
    (117, 'Angel', 381),
    (118, 'Risingson', 299),
    (119, 'Teardrop', 331),
    (120, 'Inertia Creeps', 357),
    (121, 'Exchange', 251),
    (122, 'Dissolved Girl', 367),
    (123, 'Man Next Door', 356),
    (124, 'Black Milk', 382),
    (125, 'Mezzanine', 357),
    (126, 'Group Four', 492),
    (127, '(Exchange)', 250);

-- ArtistAlbums
INSERT INTO ArtistAlbums (artist_id, album_id, credit_type)
VALUES
    (3, 12, 'credited artist');

-- AlbumSongs
INSERT INTO AlbumSongs (album_id, song_id, track_number)
VALUES
    (12, 117, 1),
    (12, 118, 2),
    (12, 119, 3),
    (12, 120, 4),
    (12, 121, 5),
    (12, 122, 6),
    (12, 123, 7),
    (12, 124, 8),
    (12, 125, 9),
    (12, 126, 10),
    (12, 127, 11);

-- Performs
INSERT INTO Performs (artist_id, song_id, credit_type)
VALUES
    (3, 117, 'credited artist'),
    (3, 118, 'credited artist'),
    (3, 119, 'credited artist'),
    (3, 120, 'credited artist'),
    (3, 121, 'credited artist'),
    (3, 122, 'credited artist'),
    (3, 123, 'credited artist'),
    (3, 124, 'credited artist'),
    (3, 125, 'credited artist'),
    (3, 126, 'credited artist'),
    (3, 127, 'credited artist');

-- AlbumGenreTags
INSERT INTO AlbumGenreTags (album_id, genre_tag)
VALUES
    (12, 'art rock'),
    (12, 'downtempo'),
    (12, 'electronic'),
    (12, 'electronica'),
    (12, 'leftfield'),
    (12, 'trip hop');

-- ==================== Album 13: Blue Lines ====================

-- Albums
INSERT INTO Albums (album_id, title, release_date, primary_genre)
VALUES
    (13, 'Blue Lines', '1991-04-08', 'trip hop');

-- Songs
INSERT INTO Songs (song_id, title, duration_seconds)
VALUES
    (128, 'Safe From Harm', 319),
    (129, 'One Love', 289),
    (130, 'Blue Lines', 262),
    (131, 'Be Thankful for What You’ve Got', 250),
    (132, 'Five Man Army', 364),
    (133, 'Unfinished Sympathy', 308),
    (134, 'Daydreaming', 254),
    (135, 'Lately', 267),
    (136, 'Hymn of the Big Wheel', 396);

-- ArtistAlbums
INSERT INTO ArtistAlbums (artist_id, album_id, credit_type)
VALUES
    (3, 13, 'credited artist');

-- AlbumSongs
INSERT INTO AlbumSongs (album_id, song_id, track_number)
VALUES
    (13, 128, 1),
    (13, 129, 2),
    (13, 130, 3),
    (13, 131, 4),
    (13, 132, 5),
    (13, 133, 6),
    (13, 134, 7),
    (13, 135, 8),
    (13, 136, 9);

-- Performs
INSERT INTO Performs (artist_id, song_id, credit_type)
VALUES
    (3, 128, 'credited artist'),
    (3, 129, 'credited artist'),
    (3, 130, 'credited artist'),
    (3, 131, 'credited artist'),
    (3, 132, 'credited artist'),
    (3, 133, 'credited artist'),
    (3, 134, 'credited artist'),
    (3, 135, 'credited artist'),
    (3, 136, 'credited artist');

-- AlbumGenreTags
INSERT INTO AlbumGenreTags (album_id, genre_tag)
VALUES
    (13, 'acid jazz'),
    (13, 'alternative dance'),
    (13, 'alternative rock'),
    (13, 'dance'),
    (13, 'downtempo'),
    (13, 'dub'),
    (13, 'electronic'),
    (13, 'electronica'),
    (13, 'funk'),
    (13, 'hip hop'),
    (13, 'house'),
    (13, 'reggae'),
    (13, 'soul'),
    (13, 'trip hop');

-- ==================== Album 14: 100th Window ====================

-- Albums
INSERT INTO Albums (album_id, title, release_date, primary_genre)
VALUES
    (14, '100th Window', '2003-01-23', 'electronic');

-- Songs
INSERT INTO Songs (song_id, title, duration_seconds)
VALUES
    (137, 'Future Proof', 339),
    (138, 'What Your Soul Sings', 399),
    (139, 'Everywhen', 459),
    (140, 'Special Cases', 309),
    (141, 'Butterfly Caught', 455),
    (142, 'A Prayer for England', 349),
    (143, 'Small Time Shot Away', 479),
    (144, 'Name Taken', 469),
    (145, 'Antistar / LP4', 1179);

-- ArtistAlbums
INSERT INTO ArtistAlbums (artist_id, album_id, credit_type)
VALUES
    (3, 14, 'credited artist');

-- AlbumSongs
INSERT INTO AlbumSongs (album_id, song_id, track_number)
VALUES
    (14, 137, 1),
    (14, 138, 2),
    (14, 139, 3),
    (14, 140, 4),
    (14, 141, 5),
    (14, 142, 6),
    (14, 143, 7),
    (14, 144, 8),
    (14, 145, 9);

-- Performs
INSERT INTO Performs (artist_id, song_id, credit_type)
VALUES
    (3, 137, 'credited artist'),
    (3, 138, 'credited artist'),
    (3, 139, 'credited artist'),
    (3, 140, 'credited artist'),
    (3, 141, 'credited artist'),
    (3, 142, 'credited artist'),
    (3, 143, 'credited artist'),
    (3, 144, 'credited artist'),
    (3, 145, 'credited artist');

-- AlbumGenreTags
INSERT INTO AlbumGenreTags (album_id, genre_tag)
VALUES
    (14, 'ambient dub'),
    (14, 'ambient pop'),
    (14, 'ambient techno'),
    (14, 'downtempo'),
    (14, 'electronic'),
    (14, 'electronica'),
    (14, 'glitch pop'),
    (14, 'illbient'),
    (14, 'leftfield'),
    (14, 'trip hop');

-- ==================== Album 15: Protection ====================

-- Albums
INSERT INTO Albums (album_id, title, release_date, primary_genre)
VALUES
    (15, 'Protection', '1994-09-26', 'trip hop');

-- Songs
INSERT INTO Songs (song_id, title, duration_seconds)
VALUES
    (146, 'Protection', 471),
    (147, 'Karmacoma', 316),
    (148, 'Three', 229),
    (149, 'Weather Storm', 300),
    (150, 'Spying Glass', 321),
    (151, 'Better Things', 259),
    (152, 'Eurochild', 307),
    (153, 'Sly', 325),
    (154, 'Heat Miser', 219),
    (155, 'Light My Fire (live)', 195);

-- ArtistAlbums
INSERT INTO ArtistAlbums (artist_id, album_id, credit_type)
VALUES
    (3, 15, 'credited artist');

-- AlbumSongs
INSERT INTO AlbumSongs (album_id, song_id, track_number)
VALUES
    (15, 146, 1),
    (15, 147, 2),
    (15, 148, 3),
    (15, 149, 4),
    (15, 150, 5),
    (15, 151, 6),
    (15, 152, 7),
    (15, 153, 8),
    (15, 154, 9),
    (15, 155, 10);

-- Performs
INSERT INTO Performs (artist_id, song_id, credit_type)
VALUES
    (3, 146, 'credited artist'),
    (3, 147, 'credited artist'),
    (3, 148, 'credited artist'),
    (3, 149, 'credited artist'),
    (3, 150, 'credited artist'),
    (3, 151, 'credited artist'),
    (3, 152, 'credited artist'),
    (3, 153, 'credited artist'),
    (3, 154, 'credited artist'),
    (3, 155, 'credited artist');

-- AlbumGenreTags
INSERT INTO AlbumGenreTags (album_id, genre_tag)
VALUES
    (15, 'alternative dance'),
    (15, 'downtempo'),
    (15, 'dub'),
    (15, 'electronic'),
    (15, 'trip hop');

-- ==================== Album 16: Debut ====================

-- Artists
INSERT INTO Artists (artist_id, artist_name)
VALUES
    (4, 'Björk');

-- Albums
INSERT INTO Albums (album_id, title, release_date, primary_genre)
VALUES
    (16, 'Debut', '1993-07-12', 'electronic');

-- Songs
INSERT INTO Songs (song_id, title, duration_seconds)
VALUES
    (156, 'Human Behaviour', 251),
    (157, 'Crying', 292),
    (158, 'Venus as a Boy', 283),
    (159, 'There’s More to Life Than This (recorded live at the Milk Bar toilets)', 201),
    (160, 'Like Someone in Love', 273),
    (161, 'Big Time Sensuality', 237),
    (162, 'One Day', 324),
    (163, 'Aeroplane', 234),
    (164, 'Come to Me', 295),
    (165, 'Violently Happy', 299),
    (166, 'The Anchor Song', 212);

-- ArtistAlbums
INSERT INTO ArtistAlbums (artist_id, album_id, credit_type)
VALUES
    (4, 16, 'credited artist');

-- AlbumSongs
INSERT INTO AlbumSongs (album_id, song_id, track_number)
VALUES
    (16, 156, 1),
    (16, 157, 2),
    (16, 158, 3),
    (16, 159, 4),
    (16, 160, 5),
    (16, 161, 6),
    (16, 162, 7),
    (16, 163, 8),
    (16, 164, 9),
    (16, 165, 10),
    (16, 166, 11);

-- Performs
INSERT INTO Performs (artist_id, song_id, credit_type)
VALUES
    (4, 156, 'credited artist'),
    (4, 157, 'credited artist'),
    (4, 158, 'credited artist'),
    (4, 159, 'credited artist'),
    (4, 160, 'credited artist'),
    (4, 161, 'credited artist'),
    (4, 162, 'credited artist'),
    (4, 163, 'credited artist'),
    (4, 164, 'credited artist'),
    (4, 165, 'credited artist'),
    (4, 166, 'credited artist');

-- AlbumGenreTags
INSERT INTO AlbumGenreTags (album_id, genre_tag)
VALUES
    (16, 'alternative dance'),
    (16, 'art pop'),
    (16, 'dance-pop'),
    (16, 'deep house'),
    (16, 'diva house'),
    (16, 'downtempo'),
    (16, 'electro'),
    (16, 'electronic'),
    (16, 'experimental'),
    (16, 'house'),
    (16, 'idm'),
    (16, 'leftfield'),
    (16, 'pop'),
    (16, 'rock'),
    (16, 'synth-pop'),
    (16, 'tribal house'),
    (16, 'trip hop');

-- ==================== Album 17: Gling‐Gló ====================

-- Partial source date: missing month/day set to 01

-- Artists
INSERT INTO Artists (artist_id, artist_name)
VALUES
    (5, 'Tríó Guðmundar Ingólfssonar');

-- Albums
INSERT INTO Albums (album_id, title, release_date, primary_genre)
VALUES
    (17, 'Gling‐Gló', '1990-10-01', 'jazz');

-- Songs
INSERT INTO Songs (song_id, title, duration_seconds)
VALUES
    (167, 'Gling Gló', 162),
    (168, 'Luktar‐Gvendur', 243),
    (169, 'Kata rokkar', 179),
    (170, 'Pabbi minn', 163),
    (171, 'Brestir og brak', 201),
    (172, 'Ástartöfrar', 166),
    (173, 'Bella símamær', 160),
    (174, 'Litli tónlistarmaðurinn', 205),
    (175, 'Það sést ekki sætari mey', 243),
    (176, 'Bílavísur', 161),
    (177, 'Tondeleyo', 213),
    (178, 'Ég veit ei hvað skal segja', 186),
    (179, 'Í dansi með þér', 148),
    (180, 'Börnin við Tjörnina', 170),
    (181, 'Ruby Baby', 247),
    (182, 'I Can’t Help Loving That Man', 220);

-- ArtistAlbums
INSERT INTO ArtistAlbums (artist_id, album_id, credit_type)
VALUES
    (4, 17, 'credited artist'),
    (5, 17, 'credited artist');

-- AlbumSongs
INSERT INTO AlbumSongs (album_id, song_id, track_number)
VALUES
    (17, 167, 1),
    (17, 168, 2),
    (17, 169, 3),
    (17, 170, 4),
    (17, 171, 5),
    (17, 172, 6),
    (17, 173, 7),
    (17, 174, 8),
    (17, 175, 9),
    (17, 176, 10),
    (17, 177, 11),
    (17, 178, 12),
    (17, 179, 13),
    (17, 180, 14),
    (17, 181, 15),
    (17, 182, 16);

-- Performs
INSERT INTO Performs (artist_id, song_id, credit_type)
VALUES
    (4, 167, 'credited artist'),
    (5, 167, 'credited artist'),
    (4, 168, 'credited artist'),
    (5, 168, 'credited artist'),
    (4, 169, 'credited artist'),
    (5, 169, 'credited artist'),
    (4, 170, 'credited artist'),
    (5, 170, 'credited artist'),
    (4, 171, 'credited artist'),
    (5, 171, 'credited artist'),
    (4, 172, 'credited artist'),
    (5, 172, 'credited artist'),
    (4, 173, 'credited artist'),
    (5, 173, 'credited artist'),
    (4, 174, 'credited artist'),
    (5, 174, 'credited artist'),
    (4, 175, 'credited artist'),
    (5, 175, 'credited artist'),
    (4, 176, 'credited artist'),
    (5, 176, 'credited artist'),
    (4, 177, 'credited artist'),
    (5, 177, 'credited artist'),
    (4, 178, 'credited artist'),
    (5, 178, 'credited artist'),
    (4, 179, 'credited artist'),
    (5, 179, 'credited artist'),
    (4, 180, 'credited artist'),
    (5, 180, 'credited artist'),
    (4, 181, 'credited artist'),
    (5, 181, 'credited artist'),
    (4, 182, 'credited artist'),
    (5, 182, 'credited artist');

-- AlbumGenreTags
INSERT INTO AlbumGenreTags (album_id, genre_tag)
VALUES
    (17, 'contemporary jazz'),
    (17, 'jazz');

-- ==================== Album 18: Homogenic ====================

-- Albums
INSERT INTO Albums (album_id, title, release_date, primary_genre)
VALUES
    (18, 'Homogenic', '1997-09-20', 'electronic');

-- Songs
INSERT INTO Songs (song_id, title, duration_seconds)
VALUES
    (183, 'Hunter', 255),
    (184, 'Jóga', 305),
    (185, 'Unravel', 202),
    (186, 'Bachelorette', 313),
    (187, 'All Neon Like', 353),
    (188, '5 Years', 269),
    (189, 'Immature', 186),
    (190, 'Alarm Call', 260),
    (191, 'Pluto', 199),
    (192, 'All Is Full of Love', 332),
    (193, 'Jóga (Howie B. main mix)', 303),
    (194, 'Sod Off', 177),
    (195, 'Immature (Björk’s version)', 171),
    (196, 'So Broken', 361),
    (197, 'Nature Is Ancient', 219),
    (198, 'Jóga (Alec Empire mix)', 526);

-- ArtistAlbums
INSERT INTO ArtistAlbums (artist_id, album_id, credit_type)
VALUES
    (4, 18, 'credited artist');

-- AlbumSongs
INSERT INTO AlbumSongs (album_id, song_id, track_number)
VALUES
    (18, 183, 1),
    (18, 184, 2),
    (18, 185, 3),
    (18, 186, 4),
    (18, 187, 5),
    (18, 188, 6),
    (18, 189, 7),
    (18, 190, 8),
    (18, 191, 9),
    (18, 192, 10),
    (18, 193, 11),
    (18, 194, 12),
    (18, 195, 13),
    (18, 196, 14),
    (18, 197, 15),
    (18, 198, 16);

-- Performs
INSERT INTO Performs (artist_id, song_id, credit_type)
VALUES
    (4, 183, 'credited artist'),
    (4, 184, 'credited artist'),
    (4, 185, 'credited artist'),
    (4, 186, 'credited artist'),
    (4, 187, 'credited artist'),
    (4, 188, 'credited artist'),
    (4, 189, 'credited artist'),
    (4, 190, 'credited artist'),
    (4, 191, 'credited artist'),
    (4, 192, 'credited artist'),
    (4, 193, 'credited artist'),
    (4, 194, 'credited artist'),
    (4, 195, 'credited artist'),
    (4, 196, 'credited artist'),
    (4, 197, 'credited artist'),
    (4, 198, 'credited artist');

-- AlbumGenreTags
INSERT INTO AlbumGenreTags (album_id, genre_tag)
VALUES
    (18, 'art pop'),
    (18, 'downtempo'),
    (18, 'electro'),
    (18, 'electro-industrial'),
    (18, 'electronic'),
    (18, 'glitch pop'),
    (18, 'idm'),
    (18, 'industrial'),
    (18, 'trip hop');

-- ==================== Album 19: Post ====================

-- Albums
INSERT INTO Albums (album_id, title, release_date, primary_genre)
VALUES
    (19, 'Post', '1995-06-09', 'electronic');

-- Songs
INSERT INTO Songs (song_id, title, duration_seconds)
VALUES
    (199, 'Army of Me', 234),
    (200, 'Hyper‐Ballad', 322),
    (201, 'The Modern Things', 250),
    (202, 'It’s Oh So Quiet', 219),
    (203, 'Enjoy', 237),
    (204, 'You’ve Been Flirting Again', 150),
    (205, 'Isobel', 347),
    (206, 'Possibly Maybe', 307),
    (207, 'I Miss You', 244),
    (208, 'Cover Me', 126),
    (209, 'Headphones', 340);

-- ArtistAlbums
INSERT INTO ArtistAlbums (artist_id, album_id, credit_type)
VALUES
    (4, 19, 'credited artist');

-- AlbumSongs
INSERT INTO AlbumSongs (album_id, song_id, track_number)
VALUES
    (19, 199, 1),
    (19, 200, 2),
    (19, 201, 3),
    (19, 202, 4),
    (19, 203, 5),
    (19, 204, 6),
    (19, 205, 7),
    (19, 206, 8),
    (19, 207, 9),
    (19, 208, 10),
    (19, 209, 11);

-- Performs
INSERT INTO Performs (artist_id, song_id, credit_type)
VALUES
    (4, 199, 'credited artist'),
    (4, 200, 'credited artist'),
    (4, 201, 'credited artist'),
    (4, 202, 'credited artist'),
    (4, 203, 'credited artist'),
    (4, 204, 'credited artist'),
    (4, 205, 'credited artist'),
    (4, 206, 'credited artist'),
    (4, 207, 'credited artist'),
    (4, 208, 'credited artist'),
    (4, 209, 'credited artist');

-- AlbumGenreTags
INSERT INTO AlbumGenreTags (album_id, genre_tag)
VALUES
    (19, 'alternative dance'),
    (19, 'ambient'),
    (19, 'art pop'),
    (19, 'big band'),
    (19, 'big beat'),
    (19, 'downtempo'),
    (19, 'edm'),
    (19, 'electronic'),
    (19, 'house'),
    (19, 'idm'),
    (19, 'leftfield'),
    (19, 'pop'),
    (19, 'tribal house'),
    (19, 'trip hop');

-- ==================== Album 20: Björk ====================

-- Albums
INSERT INTO Albums (album_id, title, release_date, primary_genre)
VALUES
    (20, 'Björk', '1977-12-18', 'folk');

-- Songs
INSERT INTO Songs (song_id, title, duration_seconds)
VALUES
    (210, 'Arabadrengurinn', 326),
    (211, 'Búkolla', 210),
    (212, 'Alta Mira', 160),
    (213, 'Jóhannes Kjarval', 153),
    (214, 'Fúsi hreindýr', 224),
    (215, 'Himnaför', 161),
    (216, 'Óliver', 172),
    (217, 'Álfur út úr hól', 196),
    (218, 'Músastiginn', 175),
    (219, 'Bænin', 132);

-- ArtistAlbums
INSERT INTO ArtistAlbums (artist_id, album_id, credit_type)
VALUES
    (4, 20, 'credited artist');

-- AlbumSongs
INSERT INTO AlbumSongs (album_id, song_id, track_number)
VALUES
    (20, 210, 1),
    (20, 211, 2),
    (20, 212, 3),
    (20, 213, 4),
    (20, 214, 5),
    (20, 215, 6),
    (20, 216, 7),
    (20, 217, 8),
    (20, 218, 9),
    (20, 219, 10);

-- Performs
INSERT INTO Performs (artist_id, song_id, credit_type)
VALUES
    (4, 210, 'credited artist'),
    (4, 211, 'credited artist'),
    (4, 212, 'credited artist'),
    (4, 213, 'credited artist'),
    (4, 214, 'credited artist'),
    (4, 215, 'credited artist'),
    (4, 216, 'credited artist'),
    (4, 217, 'credited artist'),
    (4, 218, 'credited artist'),
    (4, 219, 'credited artist');

-- AlbumGenreTags
INSERT INTO AlbumGenreTags (album_id, genre_tag)
VALUES
    (20, 'folk'),
    (20, 'pop');

-- ==================== Album 21: Selected Ambient Works, Volume II ====================

-- Artists
INSERT INTO Artists (artist_id, artist_name)
VALUES
    (6, 'Aphex Twin');

-- Albums
INSERT INTO Albums (album_id, title, release_date, primary_genre)
VALUES
    (21, 'Selected Ambient Works, Volume II', '1994-03-07', 'ambient');

-- Songs
INSERT INTO Songs (song_id, title, duration_seconds)
VALUES
    (220, '[Cliffs]', 448),
    (221, '[Radiator]', 394),
    (222, '[Rhubarb]', 464),
    (223, '[Hankie]', 280),
    (224, '[Grass]', 535),
    (225, '[Mold]', 211),
    (226, '[Curtains]', 531),
    (227, '[Blur]', 308),
    (228, '[Weathered Stone]', 415),
    (229, '[Tree]', 598),
    (230, '[Domino]', 438),
    (231, '[White Blur 1]', 160),
    (232, 'Blue Calx', 440),
    (233, '[Parallel Stripes]', 481),
    (234, '[Shiny Metal Rods]', 334),
    (235, '[Grey Stripe]', 286),
    (236, '[Z Twig]', 125),
    (237, '[Windowsill]', 437),
    (238, '[Hexagon]', 358),
    (239, '[Lichen]', 255),
    (240, '[Spots]', 430),
    (241, '[Tassels]', 450),
    (242, '[White Blur 2]', 687),
    (243, '[Matchsticks]', 339);

-- ArtistAlbums
INSERT INTO ArtistAlbums (artist_id, album_id, credit_type)
VALUES
    (6, 21, 'credited artist');

-- AlbumSongs
INSERT INTO AlbumSongs (album_id, song_id, track_number)
VALUES
    (21, 220, 1),
    (21, 221, 2),
    (21, 222, 3),
    (21, 223, 4),
    (21, 224, 5),
    (21, 225, 6),
    (21, 226, 7),
    (21, 227, 8),
    (21, 228, 9),
    (21, 229, 10),
    (21, 230, 11),
    (21, 231, 12),
    (21, 232, 13),
    (21, 233, 14),
    (21, 234, 15),
    (21, 235, 16),
    (21, 236, 17),
    (21, 237, 18),
    (21, 238, 19),
    (21, 239, 20),
    (21, 240, 21),
    (21, 241, 22),
    (21, 242, 23),
    (21, 243, 24);

-- Performs
INSERT INTO Performs (artist_id, song_id, credit_type)
VALUES
    (6, 220, 'credited artist'),
    (6, 221, 'credited artist'),
    (6, 222, 'credited artist'),
    (6, 223, 'credited artist'),
    (6, 224, 'credited artist'),
    (6, 225, 'credited artist'),
    (6, 226, 'credited artist'),
    (6, 227, 'credited artist'),
    (6, 228, 'credited artist'),
    (6, 229, 'credited artist'),
    (6, 230, 'credited artist'),
    (6, 231, 'credited artist'),
    (6, 232, 'credited artist'),
    (6, 233, 'credited artist'),
    (6, 234, 'credited artist'),
    (6, 235, 'credited artist'),
    (6, 236, 'credited artist'),
    (6, 237, 'credited artist'),
    (6, 238, 'credited artist'),
    (6, 239, 'credited artist'),
    (6, 240, 'credited artist'),
    (6, 241, 'credited artist'),
    (6, 242, 'credited artist'),
    (6, 243, 'credited artist');

-- AlbumGenreTags
INSERT INTO AlbumGenreTags (album_id, genre_tag)
VALUES
    (21, 'ambient'),
    (21, 'drone'),
    (21, 'electronic'),
    (21, 'experimental'),
    (21, 'experimental electronic'),
    (21, 'idm'),
    (21, 'industrial');

-- ==================== Album 22: Selected Ambient Works 85–92 ====================

-- Albums
INSERT INTO Albums (album_id, title, release_date, primary_genre)
VALUES
    (22, 'Selected Ambient Works 85–92', '1992-11-01', 'ambient techno');

-- Songs
INSERT INTO Songs (song_id, title, duration_seconds)
VALUES
    (244, 'Xtal', 294),
    (245, 'Tha', 547),
    (246, 'Pulsewidth', 228),
    (247, 'Ageispolis', 323),
    (248, 'i', 77),
    (249, 'Green Calx', 365),
    (250, 'Heliosphan', 294),
    (251, 'We are the music makers', 464),
    (252, 'Schottkey 7th Path', 309),
    (253, 'Ptolemy', 434),
    (254, 'Hedphelym', 364),
    (255, 'Delphium', 329),
    (256, 'Actium', 456);

-- ArtistAlbums
INSERT INTO ArtistAlbums (artist_id, album_id, credit_type)
VALUES
    (6, 22, 'credited artist');

-- AlbumSongs
INSERT INTO AlbumSongs (album_id, song_id, track_number)
VALUES
    (22, 244, 1),
    (22, 245, 2),
    (22, 246, 3),
    (22, 247, 4),
    (22, 248, 5),
    (22, 249, 6),
    (22, 250, 7),
    (22, 251, 8),
    (22, 252, 9),
    (22, 253, 10),
    (22, 254, 11),
    (22, 255, 12),
    (22, 256, 13);

-- Performs
INSERT INTO Performs (artist_id, song_id, credit_type)
VALUES
    (6, 244, 'credited artist'),
    (6, 245, 'credited artist'),
    (6, 246, 'credited artist'),
    (6, 247, 'credited artist'),
    (6, 248, 'credited artist'),
    (6, 249, 'credited artist'),
    (6, 250, 'credited artist'),
    (6, 251, 'credited artist'),
    (6, 252, 'credited artist'),
    (6, 253, 'credited artist'),
    (6, 254, 'credited artist'),
    (6, 255, 'credited artist'),
    (6, 256, 'credited artist');

-- AlbumGenreTags
INSERT INTO AlbumGenreTags (album_id, genre_tag)
VALUES
    (22, 'acid techno'),
    (22, 'ambient'),
    (22, 'ambient techno'),
    (22, 'electronic'),
    (22, 'idm'),
    (22, 'techno');

-- ==================== Album 23: …I Care Because You Do ====================

-- Albums
INSERT INTO Albums (album_id, title, release_date, primary_genre)
VALUES
    (23, '…I Care Because You Do', '1995-04-24', 'idm');

-- Songs
INSERT INTO Songs (song_id, title, duration_seconds)
VALUES
    (257, 'Acrid Avid Jam Shred', 458),
    (258, 'The Waxen Pith', 290),
    (259, 'Wax the Nip', 259),
    (260, 'Icct Hedral (edit)', 367),
    (261, 'Ventolin (video version)', 269),
    (262, 'Come On You Slags!', 345),
    (263, 'Start as You Mean to Go On', 365),
    (264, 'Wet Tip Hen Ax', 317),
    (265, 'Mookid', 231),
    (266, 'Alberto Balsalm', 311),
    (267, 'Cow Cud Is a Twin', 334),
    (268, 'Next Heap With', 283);

-- ArtistAlbums
INSERT INTO ArtistAlbums (artist_id, album_id, credit_type)
VALUES
    (6, 23, 'credited artist');

-- AlbumSongs
INSERT INTO AlbumSongs (album_id, song_id, track_number)
VALUES
    (23, 257, 1),
    (23, 258, 2),
    (23, 259, 3),
    (23, 260, 4),
    (23, 261, 5),
    (23, 262, 6),
    (23, 263, 7),
    (23, 264, 8),
    (23, 265, 9),
    (23, 266, 10),
    (23, 267, 11),
    (23, 268, 12);

-- Performs
INSERT INTO Performs (artist_id, song_id, credit_type)
VALUES
    (6, 257, 'credited artist'),
    (6, 258, 'credited artist'),
    (6, 259, 'credited artist'),
    (6, 260, 'credited artist'),
    (6, 261, 'credited artist'),
    (6, 262, 'credited artist'),
    (6, 263, 'credited artist'),
    (6, 264, 'credited artist'),
    (6, 265, 'credited artist'),
    (6, 266, 'credited artist'),
    (6, 267, 'credited artist'),
    (6, 268, 'credited artist');

-- AlbumGenreTags
INSERT INTO AlbumGenreTags (album_id, genre_tag)
VALUES
    (23, 'acid techno'),
    (23, 'ambient techno'),
    (23, 'electronic'),
    (23, 'electronica'),
    (23, 'idm'),
    (23, 'techno');

-- ==================== Album 24: Richard D. James Album ====================

-- Albums
INSERT INTO Albums (album_id, title, release_date, primary_genre)
VALUES
    (24, 'Richard D. James Album', '1996-11-04', 'idm');

-- Songs
INSERT INTO Songs (song_id, title, duration_seconds)
VALUES
    (269, '4', 217),
    (270, 'Cornish Acid', 135),
    (271, 'Peek 824545201', 185),
    (272, 'Fingerbib', 229),
    (273, 'Carn Marth', 153),
    (274, 'To Cure a Weakling Child', 244),
    (275, 'Goon Gumpas', 122),
    (276, 'Yellow Calx', 185),
    (277, 'Girl/Boy Song', 293),
    (278, 'Logan Rock Witch', 214);

-- ArtistAlbums
INSERT INTO ArtistAlbums (artist_id, album_id, credit_type)
VALUES
    (6, 24, 'credited artist');

-- AlbumSongs
INSERT INTO AlbumSongs (album_id, song_id, track_number)
VALUES
    (24, 269, 1),
    (24, 270, 2),
    (24, 271, 3),
    (24, 272, 4),
    (24, 273, 5),
    (24, 274, 6),
    (24, 275, 7),
    (24, 276, 8),
    (24, 277, 9),
    (24, 278, 10);

-- Performs
INSERT INTO Performs (artist_id, song_id, credit_type)
VALUES
    (6, 269, 'credited artist'),
    (6, 270, 'credited artist'),
    (6, 271, 'credited artist'),
    (6, 272, 'credited artist'),
    (6, 273, 'credited artist'),
    (6, 274, 'credited artist'),
    (6, 275, 'credited artist'),
    (6, 276, 'credited artist'),
    (6, 277, 'credited artist'),
    (6, 278, 'credited artist');

-- AlbumGenreTags
INSERT INTO AlbumGenreTags (album_id, genre_tag)
VALUES
    (24, 'drill and bass'),
    (24, 'electronic'),
    (24, 'electronica'),
    (24, 'experimental'),
    (24, 'idm'),
    (24, 'instrumental'),
    (24, 'jungle'),
    (24, 'progressive');

-- ==================== Album 25: Drukqs ====================

-- Albums
INSERT INTO Albums (album_id, title, release_date, primary_genre)
VALUES
    (25, 'Drukqs', '2001-10-22', 'idm');

-- Songs
INSERT INTO Songs (song_id, title, duration_seconds)
VALUES
    (279, 'Jynweythek', 143),
    (280, 'Vordhosbn', 291),
    (281, 'Kladfvgbung Micshk', 126),
    (282, 'Strotha Tynhe', 132),
    (283, 'Omgyjya Switch7', 292),
    (284, 'Gwely Mernans', 308),
    (285, 'Cock/Ver10', 318),
    (286, 'Bbydhyonchord', 153),
    (287, 'Orban Eq Trx4', 95),
    (288, 'Mt Saint Michel Mix + St Michaels Mount', 490),
    (289, 'Beskhu3epnm', 130),
    (290, 'Aussois', 13),
    (291, 'Hy A Scullyas Lyf A Dhagrow', 134),
    (292, 'Kesson Daslef', 81),
    (293, 'Avril 14th', 125),
    (294, 'Gwarek2', 406),
    (295, '54 Cymru Beats', 366),
    (296, 'Btoum‐Roumada', 118),
    (297, 'Lornaderek', 31),
    (298, 'Penty Harmonium', 87),
    (299, 'Prep Gwarlek 3b', 79),
    (300, 'Father', 57),
    (301, 'Petiatil Cx Htdui', 131),
    (302, 'Meltphace 6', 384),
    (303, 'Bit4', 25),
    (304, 'Taking Control', 433),
    (305, 'Ruglen Holon', 109),
    (306, 'Afx237 V7', 263),
    (307, 'Ziggomatic V17', 515),
    (308, 'Nanou2', 205);

-- ArtistAlbums
INSERT INTO ArtistAlbums (artist_id, album_id, credit_type)
VALUES
    (6, 25, 'credited artist');

-- AlbumSongs
INSERT INTO AlbumSongs (album_id, song_id, track_number)
VALUES
    (25, 279, 1),
    (25, 280, 2),
    (25, 281, 3),
    (25, 282, 4),
    (25, 283, 5),
    (25, 284, 6),
    (25, 285, 7),
    (25, 286, 8),
    (25, 287, 9),
    (25, 288, 10),
    (25, 289, 11),
    (25, 290, 12),
    (25, 291, 13),
    (25, 292, 14),
    (25, 293, 15),
    (25, 294, 16),
    (25, 295, 17),
    (25, 296, 18),
    (25, 297, 19),
    (25, 298, 20),
    (25, 299, 21),
    (25, 300, 22),
    (25, 301, 23),
    (25, 302, 24),
    (25, 303, 25),
    (25, 304, 26),
    (25, 305, 27),
    (25, 306, 28),
    (25, 307, 29),
    (25, 308, 30);

-- Performs
INSERT INTO Performs (artist_id, song_id, credit_type)
VALUES
    (6, 279, 'credited artist'),
    (6, 280, 'credited artist'),
    (6, 281, 'credited artist'),
    (6, 282, 'credited artist'),
    (6, 283, 'credited artist'),
    (6, 284, 'credited artist'),
    (6, 285, 'credited artist'),
    (6, 286, 'credited artist'),
    (6, 287, 'credited artist'),
    (6, 288, 'credited artist'),
    (6, 289, 'credited artist'),
    (6, 290, 'credited artist'),
    (6, 291, 'credited artist'),
    (6, 292, 'credited artist'),
    (6, 293, 'credited artist'),
    (6, 294, 'credited artist'),
    (6, 295, 'credited artist'),
    (6, 296, 'credited artist'),
    (6, 297, 'credited artist'),
    (6, 298, 'credited artist'),
    (6, 299, 'credited artist'),
    (6, 300, 'credited artist'),
    (6, 301, 'credited artist'),
    (6, 302, 'credited artist'),
    (6, 303, 'credited artist'),
    (6, 304, 'credited artist'),
    (6, 305, 'credited artist'),
    (6, 306, 'credited artist'),
    (6, 307, 'credited artist'),
    (6, 308, 'credited artist');

-- AlbumGenreTags
INSERT INTO AlbumGenreTags (album_id, genre_tag)
VALUES
    (25, 'acid techno'),
    (25, 'breakcore'),
    (25, 'drill and bass'),
    (25, 'electroacoustic'),
    (25, 'idm'),
    (25, 'impressionism'),
    (25, 'modern classical');

COMMIT;
SET SESSION sql_mode = @previous_sql_mode;




-- show each album and how many songs it contains
SELECT
    a.album_id,
    a.title AS album,
    a.primary_genre AS genre,
    a.release_date,
    COUNT(s.song_id) AS songs
FROM Albums AS a
LEFT JOIN AlbumSongs AS s ON a.album_id = s.album_id
GROUP BY a.album_id, a.title, a.primary_genre, a.release_date
ORDER BY a.album_id;


-- show album 1
SELECT
    a.title AS album,
    als.track_number,
    s.song_id,
    s.title AS song,
    s.duration_seconds
FROM Albums AS a
JOIN AlbumSongs AS als ON a.album_id = als.album_id
JOIN Songs AS s ON als.song_id = s.song_id
WHERE a.album_id = 1
ORDER BY als.track_number;