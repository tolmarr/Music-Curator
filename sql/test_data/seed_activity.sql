USE music_curator;

-- run AFTER schema.sql, then AFTER seed_music.sql, BEFORE tests
-- requires fixed album IDs 1-25, song IDs 1-3 from that seed
-- all dates and IDs are fixed, the demo users have no login passwords

START TRANSACTION;


-- ========================== Users ==========================
-- 20 users: 6 rate albums, 
--      6 vote on reviews
--      8 demonstrate favourite matches
--
-- s2_user01 and s2_user03 are certified curators, all others are not

INSERT INTO Users (username, display_name, is_certified_curator) VALUES
    ('s2_user01', 'Rating User 1', 1),
    ('s2_user02', 'Rating User 2', 0),
    ('s2_user03', 'Rating User 3', 1),
    ('s2_user04', 'Rating User 4', 0),
    ('s2_user05', 'Rating User 5', 0),
    ('s2_user06', 'Rating User 6', 0),
    ('s2_voter01', 'Voter 1', 0),
    ('s2_voter02', 'Voter 2', 0),
    ('s2_voter03', 'Voter 3', 0),
    ('s2_voter04', 'Voter 4', 0),
    ('s2_voter05', 'Voter 5', 0),
    ('s2_voter06', 'Voter 6', 0),
    ('s2_target', 'Target', 0),
    ('s2_twin_a', 'Twin A', 0),
    ('s2_twin_b', 'Twin B', 0),
    ('s2_three_a', 'Three A', 0),
    ('s2_three_b', 'Three B', 0),
    ('s2_two', 'Two', 0),
    ('s2_zero', 'Zero', 0),
    ('s2_empty', 'Empty', 0);


-- ========================== Ratings and reviews ==========================
-- 67 ratings with sum 201, so AVG(Rates.rating) = 3.00


INSERT INTO Rates (username, album_id, rating, review, rated_at) VALUES
    ('s2_user01', 1, 5, 'Five helpful votes; newest tied review.', '2026-01-03 12:00:00'),
    ('s2_user02', 1, 5, 'Five helpful votes; username sorts before user03.', '2026-01-02 12:00:00'),
    ('s2_user03', 1, 5, 'Five helpful votes; same timestamp as user02.', '2026-01-02 12:00:00'),
    ('s2_user04', 1, 5, 'Four helpful votes; below the minimum count.', '2026-01-01 12:00:00'),
    ('s2_user05', 1, 5, 'Four of five helpful; exactly eighty percent.', '2026-01-01 12:00:00'),
    ('s2_user01', 2, 1, 'Written review with zero votes.', '2026-01-01 12:00:00'),
    ('s2_user02', 2, 1, NULL, '2026-01-01 12:00:00'),
    ('s2_user03', 2, 1, 'Five of six helpful; above eighty percent.', '2025-12-31 12:00:00'),
    ('s2_user04', 2, 1, NULL, '2026-01-01 12:00:00'),
    ('s2_user05', 2, 1, NULL, '2026-01-01 12:00:00'),
    ('s2_user01', 3, 4, NULL, '2026-01-01 12:00:00'),
    ('s2_user02', 3, 4, NULL, '2026-01-01 12:00:00'),
    ('s2_user03', 3, 4, NULL, '2026-01-01 12:00:00'),
    ('s2_user04', 3, 4, NULL, '2026-01-01 12:00:00'),
    ('s2_user05', 3, 4, NULL, '2026-01-01 12:00:00'),
    ('s2_user06', 3, 4, NULL, '2026-01-01 12:00:00'),
    ('s2_user01', 4, 2, NULL, '2026-01-01 12:00:00'),
    ('s2_user02', 4, 2, NULL, '2026-01-01 12:00:00'),
    ('s2_user03', 4, 2, NULL, '2026-01-01 12:00:00'),
    ('s2_user04', 4, 2, NULL, '2026-01-01 12:00:00'),
    ('s2_user05', 4, 2, NULL, '2026-01-01 12:00:00'),
    ('s2_user06', 4, 2, NULL, '2026-01-01 12:00:00'),
    ('s2_user01', 5, 4, NULL, '2026-01-01 12:00:00'),
    ('s2_user02', 5, 4, NULL, '2026-01-01 12:00:00'),
    ('s2_user03', 5, 4, NULL, '2026-01-01 12:00:00'),
    ('s2_user04', 5, 4, NULL, '2026-01-01 12:00:00'),
    ('s2_user05', 5, 4, NULL, '2026-01-01 12:00:00'),
    ('s2_user01', 6, 2, NULL, '2026-01-01 12:00:00'),
    ('s2_user02', 6, 2, NULL, '2026-01-01 12:00:00'),
    ('s2_user03', 6, 2, NULL, '2026-01-01 12:00:00'),
    ('s2_user04', 6, 2, NULL, '2026-01-01 12:00:00'),
    ('s2_user05', 6, 2, NULL, '2026-01-01 12:00:00'),
    ('s2_user01', 7, 3, NULL, '2026-01-01 12:00:00'),
    ('s2_user02', 7, 3, NULL, '2026-01-01 12:00:00'),
    ('s2_user03', 7, 3, NULL, '2026-01-01 12:00:00'),
    ('s2_user04', 7, 3, NULL, '2026-01-01 12:00:00'),
    ('s2_user05', 7, 3, NULL, '2026-01-01 12:00:00'),
    ('s2_user01', 8, 4, NULL, '2026-01-01 12:00:00'),
    ('s2_user02', 8, 4, NULL, '2026-01-01 12:00:00'),
    ('s2_user03', 8, 3, NULL, '2026-01-01 12:00:00'),
    ('s2_user04', 8, 4, NULL, '2026-01-01 12:00:00'),
    ('s2_user05', 8, 4, NULL, '2026-01-01 12:00:00'),
    ('s2_user06', 8, 3, NULL, '2026-01-01 12:00:00'),
    ('s2_user01', 9, 2, NULL, '2026-01-01 12:00:00'),
    ('s2_user02', 9, 2, NULL, '2026-01-01 12:00:00'),
    ('s2_user03', 9, 3, NULL, '2026-01-01 12:00:00'),
    ('s2_user04', 9, 2, NULL, '2026-01-01 12:00:00'),
    ('s2_user05', 9, 2, NULL, '2026-01-01 12:00:00'),
    ('s2_user06', 9, 3, NULL, '2026-01-01 12:00:00'),
    ('s2_user01', 10, 5, NULL, '2026-01-01 12:00:00'),
    ('s2_user02', 10, 5, NULL, '2026-01-01 12:00:00'),
    ('s2_user03', 10, 5, NULL, '2026-01-01 12:00:00'),
    ('s2_user04', 10, 5, NULL, '2026-01-01 12:00:00'),
    ('s2_user01', 11, 1, NULL, '2026-01-01 12:00:00'),
    ('s2_user02', 11, 1, NULL, '2026-01-01 12:00:00'),
    ('s2_user03', 11, 1, NULL, '2026-01-01 12:00:00'),
    ('s2_user04', 11, 1, NULL, '2026-01-01 12:00:00'),
    ('s2_user01', 12, 4, NULL, '2026-01-01 12:00:00'),
    ('s2_user02', 12, 4, NULL, '2026-01-01 12:00:00'),
    ('s2_user03', 12, 4, NULL, '2026-01-01 12:00:00'),
    ('s2_user04', 12, 4, NULL, '2026-01-01 12:00:00'),
    ('s2_user05', 12, 4, NULL, '2026-01-01 12:00:00'),
    ('s2_user01', 13, 2, NULL, '2026-01-01 12:00:00'),
    ('s2_user02', 13, 2, NULL, '2026-01-01 12:00:00'),
    ('s2_user03', 13, 2, NULL, '2026-01-01 12:00:00'),
    ('s2_user04', 13, 2, NULL, '2026-01-01 12:00:00'),
    ('s2_user05', 13, 2, NULL, '2026-01-01 12:00:00');


-- ========================== Review votes ==========================


INSERT INTO ReviewVotes (voter_username, reviewer_username, album_id, is_helpful) VALUES
    ('s2_voter01', 's2_user01', 1, 1),
    ('s2_voter02', 's2_user01', 1, 1),
    ('s2_voter03', 's2_user01', 1, 1),
    ('s2_voter04', 's2_user01', 1, 1),
    ('s2_voter05', 's2_user01', 1, 1),
    ('s2_voter01', 's2_user02', 1, 1),
    ('s2_voter02', 's2_user02', 1, 1),
    ('s2_voter03', 's2_user02', 1, 1),
    ('s2_voter04', 's2_user02', 1, 1),
    ('s2_voter05', 's2_user02', 1, 1),
    ('s2_voter02', 's2_user03', 1, 1),
    ('s2_voter03', 's2_user03', 1, 1),
    ('s2_voter04', 's2_user03', 1, 1),
    ('s2_voter05', 's2_user03', 1, 1),
    ('s2_voter06', 's2_user03', 1, 1),
    ('s2_voter01', 's2_user04', 1, 1),
    ('s2_voter02', 's2_user04', 1, 1),
    ('s2_voter03', 's2_user04', 1, 1),
    ('s2_voter04', 's2_user04', 1, 1),
    ('s2_voter01', 's2_user05', 1, 1),
    ('s2_voter02', 's2_user05', 1, 1),
    ('s2_voter03', 's2_user05', 1, 1),
    ('s2_voter04', 's2_user05', 1, 1),
    ('s2_voter05', 's2_user05', 1, 0),
    ('s2_voter01', 's2_user02', 2, 1),
    ('s2_voter02', 's2_user02', 2, 1),
    ('s2_voter03', 's2_user02', 2, 1),
    ('s2_voter04', 's2_user02', 2, 1),
    ('s2_voter05', 's2_user02', 2, 1),
    ('s2_voter01', 's2_user03', 2, 1),
    ('s2_voter02', 's2_user03', 2, 1),
    ('s2_voter03', 's2_user03', 2, 1),
    ('s2_voter04', 's2_user03', 2, 1),
    ('s2_voter05', 's2_user03', 2, 1),
    ('s2_voter06', 's2_user03', 2, 0);


-- ========================== Favourites ==========================


INSERT INTO Favourites (username, album_id) VALUES
    ('s2_target', 1),
    ('s2_target', 2),
    ('s2_target', 3),
    ('s2_target', 4),
    ('s2_target', 5),
    ('s2_twin_a', 1),
    ('s2_twin_a', 2),
    ('s2_twin_a', 3),
    ('s2_twin_a', 4),
    ('s2_twin_a', 5),
    ('s2_twin_a', 6),
    ('s2_twin_b', 1),
    ('s2_twin_b', 2),
    ('s2_twin_b', 3),
    ('s2_twin_b', 4),
    ('s2_twin_b', 5),
    ('s2_three_a', 1),
    ('s2_three_a', 2),
    ('s2_three_a', 3),
    ('s2_three_a', 7),
    ('s2_three_b', 1),
    ('s2_three_b', 2),
    ('s2_three_b', 3),
    ('s2_three_b', 8),
    ('s2_two', 1),
    ('s2_two', 2),
    ('s2_zero', 6),
    ('s2_zero', 7);


-- ========================== Lists and contents ==========================


INSERT INTO Lists (list_id, username, title, list_type, created_at, updated_at) VALUES
    (1, 's2_target', 'Favourite tracks', 'SONG', '2026-01-01 12:00:00', '2026-01-01 12:00:00'),
    (2, 's2_target', 'Favourite albums', 'ALBUM', '2026-01-01 12:00:00', '2026-01-01 12:00:00'),
    (3, 's2_target', 'Albums to revisit', 'ALBUM', '2026-01-01 12:00:00', '2026-01-01 12:00:00');

INSERT INTO SongLists (list_id) VALUES
    (1);

INSERT INTO AlbumLists (list_id) VALUES
    (2),
    (3);

INSERT INTO ListSongs (list_id, song_id, position) VALUES
    (1, 1, 1),
    (1, 2, 2),
    (1, 3, 3);

INSERT INTO ListAlbums (list_id, album_id, position) VALUES
    (2, 1, 1),
    (2, 2, 2),
    (3, 1, 1),
    (3, 3, 2);

COMMIT;






-- show user ratings, written reviews, votes, favourites and lists
SELECT
    u.username,
    u.is_certified_curator AS certified,
    (SELECT COUNT(*) FROM Rates         AS r WHERE r.username = u.username) AS ratings,
    (SELECT COUNT(*) FROM Rates         AS r WHERE r.username = u.username AND r.review IS NOT NULL) AS reviews,
    (SELECT COUNT(*) FROM ReviewVotes   AS v WHERE v.voter_username = u.username) AS votes_cast,
    (SELECT COUNT(*) FROM Favourites    AS f WHERE f.username = u.username) AS favourites,
    (SELECT COUNT(*) FROM Lists         AS l WHERE l.username = u.username) AS lists
FROM Users AS u
WHERE LEFT(u.username, 3) = 's2_'
ORDER BY u.username;
