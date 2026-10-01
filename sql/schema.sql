DROP DATABASE IF EXISTS music_curator;
CREATE DATABASE music_curator;
USE music_curator;


-- ============================================================
-- CSC 370 - MUSIC CURATOR
--
-- Aga + Tola : GitHub / Lists
-- Cooper     : Users + Albums
-- Chris      : Artists + Songs
-- ============================================================


-- ============================================================
-- USERS
-- Cooper
-- add attributes
-- related to Lists
-- ============================================================

CREATE TABLE Users (
    username VARCHAR(50) PRIMARY KEY
);


-- ============================================================
-- ARTISTS
-- Chris
-- add attributes
-- ============================================================

CREATE TABLE Artists (
    artist_id INT PRIMARY KEY
);


-- ============================================================
-- ALBUMS
-- Cooper
-- add attributes
-- primary_genre required
-- related to ListAlbums
-- ============================================================

CREATE TABLE Albums (
    album_id INT PRIMARY KEY
);


-- ============================================================
-- SONGS
-- Chris
-- add attributes
-- related to ListSongs
-- ============================================================

CREATE TABLE Songs (
    song_id INT PRIMARY KEY
);


-- ============================================================
-- LISTS
-- Aga + Tola
-- ============================================================

CREATE TABLE Lists (
    list_id INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    list_name VARCHAR(100) NOT NULL,
    description VARCHAR(500),

    FOREIGN KEY (username)
        REFERENCES Users(username)
);


-- ============================================================
-- SONG LISTS
-- Aga + Tola
-- subtype of Lists
-- ============================================================

CREATE TABLE SongLists (
    list_id INT PRIMARY KEY,

    FOREIGN KEY (list_id)
        REFERENCES Lists(list_id)
);


-- ============================================================
-- ALBUM LISTS
-- Aga + Tola
-- subtype of Lists
-- ============================================================

CREATE TABLE AlbumLists (
    list_id INT PRIMARY KEY,

    FOREIGN KEY (list_id)
        REFERENCES Lists(list_id)
);


-- ============================================================
-- LIST SONGS
-- Aga + Tola
-- connects SongLists and Songs
-- position is positive and unique within a list
-- ============================================================

CREATE TABLE ListSongs (
    list_id INT NOT NULL,
    song_id INT NOT NULL,
    position INT NOT NULL,

    PRIMARY KEY (list_id, song_id),

    UNIQUE (list_id, position),

    CHECK (position > 0),

    FOREIGN KEY (list_id)
        REFERENCES SongLists(list_id),

    FOREIGN KEY (song_id)
        REFERENCES Songs(song_id)
);


-- ============================================================
-- LIST ALBUMS
-- Aga + Tola
-- connects AlbumLists and Albums
-- position is positive and unique within a list
-- ============================================================

CREATE TABLE ListAlbums (
    list_id INT NOT NULL,
    album_id INT NOT NULL,
    position INT NOT NULL,

    PRIMARY KEY (list_id, album_id),

    UNIQUE (list_id, position),

    CHECK (position > 0),

    FOREIGN KEY (list_id)
        REFERENCES AlbumLists(list_id),

    FOREIGN KEY (album_id)
        REFERENCES Albums(album_id)
);


-- ============================================================
-- ALBUM RATINGS
-- Cooper
-- Users rate Albums
-- rating is 1-5 whole stars
-- ============================================================

-- TODO


-- ============================================================
-- FAVOURITE ALBUMS
-- Cooper
-- connects Users and Albums
-- ============================================================

-- TODO


-- ============================================================
-- ALBUM SONGS
-- Cooper + Chris
-- connects Albums and Songs
-- track_number required
-- positive and unique within an Album
-- ============================================================

-- TODO


-- ============================================================
-- ARTIST SONGS
-- Chris
-- connects Artists and Songs
-- credit_type required
-- ============================================================

-- TODO


-- ============================================================
-- ARTIST ALBUMS
-- Chris + Cooper
-- connects Artists and Albums
-- credit_type required
-- ============================================================

-- TODO


-- ============================================================
-- CURRENT TABLES / ATTRIBUTES
-- ============================================================

-- Users
--   username
--
-- Artists
--   artist_id
--
-- Albums
--   album_id
--
-- Songs
--   song_id
--
-- Lists
--   list_id
--   username
--   list_name
--   description
--
-- SongLists
--   list_id
--
-- AlbumLists
--   list_id
--
-- ListSongs
--   list_id
--   song_id
--   position
--
-- ListAlbums
--   list_id
--   album_id
--   position


-- ============================================================
-- RELATIONSHIPS
-- ============================================================

-- Users -> Lists
--
-- Lists -> SongLists
--
-- Lists -> AlbumLists
--
-- SongLists <-> Songs
--   ListSongs
--
-- AlbumLists <-> Albums
--   ListAlbums
--
-- Users <-> Albums
--   AlbumRatings
--
-- Users <-> Albums
--   FavouriteAlbums
--
-- Albums <-> Songs
--   AlbumSongs
--
-- Artists <-> Songs
--   ArtistSongs
--
-- Artists <-> Albums
--   ArtistAlbums