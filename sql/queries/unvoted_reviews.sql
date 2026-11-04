-- Written reviews that a given user has not voted on yet.
-- The user's own reviews are left out, since they cannot vote on them.
-- Set @voter_username to the user to check before running.
SET @voter_username = 'some_username';

SELECT
    r.username AS reviewer_username,
    r.album_id,
    r.rated_at,
    r.review
FROM Rates AS r
WHERE r.review IS NOT NULL
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
