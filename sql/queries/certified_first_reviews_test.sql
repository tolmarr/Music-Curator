USE music_curator;



-- Here we're showing the review order
-- Certified reviewers first <
-- newest reviews within each group <
-- then in alphabetical order of usernames if timestamps match <
-- Expected: 
-- Z, A, B, regular reviewer; NULL reviews excluded 


-- =========================== Test Data ===========================

-- Add 5 users and 1 album to test review ordering
INSERT INTO Users (username, display_name, is_certified_curator)
VALUES
    ('review_test_z', 'Test Z', TRUE),
    ('review_test_a', 'Test A', TRUE),
    ('review_test_b', 'Test B', TRUE),
    ('review_test_regular', 'Test Regular', FALSE),
    ('review_test_none', 'Test No Review', TRUE);

INSERT INTO Albums (title, release_date, primary_genre)
VALUES ('Review Test Album', '2026-01-01', 'Rock');

SET @review_album = LAST_INSERT_ID();

INSERT INTO Rates (username, album_id, rating, review, rated_at)
VALUES
    ('review_test_z', @review_album, 4,
     'Newer certified review', '2026-01-02 12:00:00'),
    ('review_test_a', @review_album, 5,
     'Older certified review A', '2026-01-01 12:00:00'),
    ('review_test_b', @review_album, 4,
     'Older certified review B', '2026-01-01 12:00:00'),
    ('review_test_regular', @review_album, 3,
     'Newest written review', '2026-01-03 12:00:00'),
    ('review_test_none', @review_album, 5,
     NULL, '2026-01-04 12:00:00');


-- ====================================================================



-- Display album reviews with certified curators first.
-- Reviewers with the same certification status are sorted
-- alphabetically by username.
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
    u.username ASC; -- if multiple reviewers have the same certification status, sort them alphabetically by username