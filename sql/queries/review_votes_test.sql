USE music_curator;

-- Tests for ReviewVotes and the three review-helpfulness queries.
-- Run on a freshly built schema (the hv_ users must not exist yet).
-- The [INVALID] statements fail on purpose: run each one separately,
-- or run the whole file with `mysql --force` so it doesn't stop at
-- the first error.
--
-- Order matters: the queries are checked against the fixed dataset
-- first, then the constraint tests run inside a transaction that is
-- rolled back, so they leave the dataset unchanged.
--
-- The query copies below are the same as the files in sql/queries/,
-- limited to the two test albums so other test data can't affect them.


-- =========================== Test Data ===========================

INSERT INTO Users (username, display_name) VALUES
    ('hv_ana', 'Ana'),
    ('hv_ben', 'Ben'),
    ('hv_cal', 'Cal'),
    ('hv_dee', 'Dee'),
    ('hv_eli', 'Eli'),
    ('hv_fay', 'Fay'),
    ('hv_gus', 'Gus');

INSERT INTO Albums (title, release_date, primary_genre)
VALUES ('Helpfulness Test Album 1', '2026-01-01', 'Rock');
SET @a1 = LAST_INSERT_ID();

INSERT INTO Albums (title, release_date, primary_genre)
VALUES ('Helpfulness Test Album 2', '2026-01-01', 'Pop');
SET @a2 = LAST_INSERT_ID();

SELECT @a1 AS a1, @a2 AS a2;

-- hv_dee rates A1 without review text; hv_eli's review gets no votes
INSERT INTO Rates (username, album_id, rating, review, rated_at) VALUES
    ('hv_ana', @a1, 5, 'Ana on album 1', '2026-01-01 12:00:00'),
    ('hv_ben', @a1, 4, 'Ben on album 1', '2026-01-02 12:00:00'),
    ('hv_cal', @a1, 4, 'Cal on album 1', '2026-01-03 12:00:00'),
    ('hv_dee', @a1, 3, NULL,             '2026-01-04 12:00:00'),
    ('hv_eli', @a1, 2, 'Eli on album 1', '2026-01-05 12:00:00'),
    ('hv_ana', @a2, 5, 'Ana on album 2', '2026-01-06 12:00:00');

INSERT INTO ReviewVotes (voter_username, reviewer_username, album_id, is_helpful) VALUES
    -- hv_ana / A1: 6 of 6 helpful
    ('hv_ben', 'hv_ana', @a1, TRUE),
    ('hv_cal', 'hv_ana', @a1, TRUE),
    ('hv_dee', 'hv_ana', @a1, TRUE),
    ('hv_eli', 'hv_ana', @a1, TRUE),
    ('hv_fay', 'hv_ana', @a1, TRUE),
    ('hv_gus', 'hv_ana', @a1, TRUE),
    -- hv_ana / A2: 6 of 6 helpful
    ('hv_ben', 'hv_ana', @a2, TRUE),
    ('hv_cal', 'hv_ana', @a2, TRUE),
    ('hv_dee', 'hv_ana', @a2, TRUE),
    ('hv_eli', 'hv_ana', @a2, TRUE),
    ('hv_fay', 'hv_ana', @a2, TRUE),
    ('hv_gus', 'hv_ana', @a2, TRUE),
    -- hv_ben / A1: 4 of 5 helpful (ratio exactly 0.8)
    ('hv_ana', 'hv_ben', @a1, TRUE),
    ('hv_cal', 'hv_ben', @a1, TRUE),
    ('hv_dee', 'hv_ben', @a1, TRUE),
    ('hv_eli', 'hv_ben', @a1, TRUE),
    ('hv_fay', 'hv_ben', @a1, FALSE),
    -- hv_cal / A1: 4 of 4 helpful
    ('hv_ana', 'hv_cal', @a1, TRUE),
    ('hv_ben', 'hv_cal', @a1, TRUE),
    ('hv_dee', 'hv_cal', @a1, TRUE),
    ('hv_eli', 'hv_cal', @a1, TRUE),
    -- hv_dee / A1 has no review text: 5 of 5 helpful, ignored by every query
    ('hv_ana', 'hv_dee', @a1, TRUE),
    ('hv_ben', 'hv_dee', @a1, TRUE),
    ('hv_cal', 'hv_dee', @a1, TRUE),
    ('hv_eli', 'hv_dee', @a1, TRUE),
    ('hv_fay', 'hv_dee', @a1, TRUE);


-- =========================== [1] review_helpfulness ===========================

-- Expected (2 rows):
--   hv_ana | A2 | 2026-01-06 | helpful 6 | total 6 | ratio 1.0000
--   hv_ana | A1 | 2026-01-01 | helpful 6 | total 6 | ratio 1.0000
-- (tied on helpful count, so the newer A2 review comes first)
-- Excluded: hv_ben (4/5 = 0.8 is not above 0.8), hv_cal (only 4 votes),
--           hv_dee (no review text), hv_eli (no votes)

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
WHERE r.review IS NOT NULL
  AND r.album_id IN (@a1, @a2)
GROUP BY r.username, r.album_id, r.rated_at
HAVING COUNT(*) >= 5
   AND 5 * SUM(v.is_helpful) > 4 * COUNT(*)
ORDER BY
    helpful_count DESC,
    r.rated_at DESC,
    r.username ASC,
    r.album_id ASC;


-- =========================== [2] unvoted_reviews ===========================

-- Expected for hv_gus (3 rows, newest first):
--   hv_eli | A1 | 2026-01-05
--   hv_cal | A1 | 2026-01-03
--   hv_ben | A1 | 2026-01-02
-- (gus already voted on both of hv_ana's reviews; hv_dee has no review text)

SET @voter_username = 'hv_gus';

SELECT
    r.username AS reviewer_username,
    r.album_id,
    r.rated_at,
    r.review
FROM Rates AS r
WHERE r.review IS NOT NULL
  AND r.album_id IN (@a1, @a2)
  AND r.username <> @voter_username
  AND NOT EXISTS (
      SELECT 1
      FROM ReviewVotes AS v
      WHERE v.voter_username = @voter_username
        AND v.reviewer_username = r.username
        AND v.album_id = r.album_id
  )
ORDER BY
    r.rated_at DESC,
    r.username ASC,
    r.album_id ASC;


-- =========================== [3] reviews_above_album_average ===========================

-- Expected (3 rows, all A1):
--   hv_ana | A1 | 6
--   hv_ben | A1 | 4
--   hv_cal | A1 | 4
-- A1 written reviews: ana 6, ben 4, cal 4, eli 0 -> average 3.5
-- A2 has one review (6), which is not above its own average, so no A2 rows

WITH helpful_counts AS (
    SELECT
        r.username,
        r.album_id,
        r.rated_at,
        COALESCE(SUM(v.is_helpful), 0) AS helpful_count
    FROM Rates AS r
    LEFT JOIN ReviewVotes AS v
        ON v.reviewer_username = r.username
       AND v.album_id = r.album_id
    WHERE r.review IS NOT NULL
      AND r.album_id IN (@a1, @a2)
    GROUP BY r.username, r.album_id, r.rated_at
)
SELECT
    hc.username AS reviewer_username,
    hc.album_id,
    hc.helpful_count
FROM helpful_counts AS hc
WHERE hc.helpful_count > (
    SELECT AVG(h2.helpful_count)
    FROM helpful_counts AS h2
    WHERE h2.album_id = hc.album_id
)
ORDER BY
    hc.album_id ASC,
    hc.helpful_count DESC,
    hc.username ASC;


-- =========================== [4] Constraint tests ===========================

-- Everything in this section is rolled back at the end.
START TRANSACTION;

-- ------------------------- run valid -------------------------

-- [VALID] Normal vote. It is on hv_dee's rating, which has no review
-- text: the schema accepts it, and every query ignores it, so the
-- results above are unaffected.
INSERT INTO ReviewVotes (voter_username, reviewer_username, album_id, is_helpful)
VALUES ('hv_gus', 'hv_dee', @a1, TRUE);

-- show output
SELECT * FROM ReviewVotes
WHERE voter_username = 'hv_gus' AND reviewer_username = 'hv_dee' AND album_id = @a1;


-- ------------------------- run invalid -------------------------

-- [INVALID] Duplicate vote: hv_ben already voted on hv_ana / A1
-- Expected: ERROR 1062 Duplicate entry (PRIMARY KEY)
INSERT INTO ReviewVotes (voter_username, reviewer_username, album_id, is_helpful)
VALUES ('hv_ben', 'hv_ana', @a1, FALSE);

-- [INVALID] Self-vote: hv_ana voting on their own review
-- Expected: ERROR 3819 Check constraint violated (voter_username <> reviewer_username)
INSERT INTO ReviewVotes (voter_username, reviewer_username, album_id, is_helpful)
VALUES ('hv_ana', 'hv_ana', @a1, TRUE);

-- [INVALID] Voter does not exist
-- Expected: ERROR 1452 Cannot add or update a child row (FOREIGN KEY to Users)
INSERT INTO ReviewVotes (voter_username, reviewer_username, album_id, is_helpful)
VALUES ('hv_nobody', 'hv_ana', @a1, TRUE);

-- [INVALID] Vote on a rating that doesn't exist: hv_fay never rated A1
-- Expected: ERROR 1452 Cannot add or update a child row (FOREIGN KEY to Rates)
INSERT INTO ReviewVotes (voter_username, reviewer_username, album_id, is_helpful)
VALUES ('hv_gus', 'hv_fay', @a1, TRUE);

-- [INVALID] Missing is_helpful
-- Expected: ERROR 1048 Column 'is_helpful' cannot be null (NOT NULL)
INSERT INTO ReviewVotes (voter_username, reviewer_username, album_id, is_helpful)
VALUES ('hv_gus', 'hv_cal', @a1, NULL);

-- [INVALID] is_helpful outside 0/1
-- Expected: ERROR 3819 Check constraint violated (is_helpful IN (0, 1))
INSERT INTO ReviewVotes (voter_username, reviewer_username, album_id, is_helpful)
VALUES ('hv_gus', 'hv_ben', @a1, 2);

ROLLBACK;

-- The valid test vote is gone again; expected: empty result
SELECT * FROM ReviewVotes
WHERE voter_username = 'hv_gus' AND reviewer_username = 'hv_dee' AND album_id = @a1;


-- =========================== [5] No stored vote counts ===========================

-- Neither definition should contain a count/total column;
-- helpful counts only exist in query results
SHOW CREATE TABLE Rates;
SHOW CREATE TABLE ReviewVotes;
