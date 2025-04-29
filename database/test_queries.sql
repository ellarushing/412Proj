
-- 1) CREATE: insert a test playlists
INSERT INTO playlists (id, name, owner, track_count)
    VALUES ('test_pl','Test Playlists','Tester',0);

-- Verify insertion:
SELECT * FROM playlists WHERE id='test_pl';

-- 2) READ ALL: list all playlists
SELECT * FROM playlists;

-- 3) READ ONE: fetch a single playlists by id
SELECT * FROM playlists
    WHERE id='test_pl';


-- 4) UPDATE: change the name of that playlists
UPDATE playlists
    SET name = 'Renamed Playlists'
    WHERE id = 'test_pl';


SELECT * FROM playlists WHERE id='test_pl';

-- 5) DELETE: remove the test playlists
DELETE FROM playlists
    WHERE id = 'test_pl';

SELECT * FROM playlists WHERE id='test_pl';

-- 6) SEARCH: simple case-insensitive track lookup
-- (Assumes you have some tracks with “love” in the title.)
SELECT *
    FROM tracks
    WHERE name ILIKE '%love%';


-- 7) AGGREGATION: average popularity per playlists
SELECT
    playlist_id,
    ROUND(AVG(popularity)::numeric,2) AS avg_popularity
    FROM tracks
    GROUP BY playlist_id;


-- 8) WINDOW FUNCTION: Top 3 tracks per playlist
SELECT
    playlist_id,
    name,
    artist,
    popularity
FROM (
    SELECT
        playlist_id,
        name,
        artist,
        popularity,
        ROW_NUMBER() OVER (
            PARTITION BY playlist_id
            ORDER BY popularity DESC
    ) AS rn
    FROM tracks
) sub
WHERE rn <= 3
ORDER BY playlist_id, popularity DESC;


SELECT *
FROM (
    SELECT
        playlist_id,
        name,
        duration_ms,
        SUM(duration_ms) OVER (
            PARTITION BY playlist_id
            ORDER BY duration_ms DESC
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS running_total_ms,
    ROW_NUMBER() OVER (
        PARTITION BY playlist_id
        ORDER BY duration_ms DESC
    ) AS rn
    FROM tracks
    WHERE duration_ms > 300000
) t
WHERE t.rn <= 10
ORDER BY playlist_id, duration_ms DESC;