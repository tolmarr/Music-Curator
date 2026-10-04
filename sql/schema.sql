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
-- todo: force immutability
-- username varchar(50)       [pk, not null, note: 'Unique and immutable username/handle']
-- display_name varchar(100)  [not null]

CREATE TABLE Users (
    username VARCHAR(50) NOT NULL PRIMARY KEY, 
    display_name varchar(100) NOT NULL

);


-- ============================================================
-- ARTISTS
-- Chris
-- add attributes
-- ============================================================

CREATE TABLE Artists (
	artist_id INT PRIMARY KEY AUTO_INCREMENT,
    artist_name VARCHAR(255) NOT NULL
    );


-- ============================================================
-- ALBUMS
-- Cooper
-- add attributes
-- primary_genre required
-- related to ListAlbums
-- ============================================================
-- album_id int               [pk, increment]
-- title varchar(255)         [not null]
-- release_date date          [not null]
-- primary_genre varchar(100) [not null]

CREATE TABLE Albums (
    album_id INT AUTO_INCREMENT PRIMARY KEY ,
    title VARCHAR(255) NOT NULL,
    release_date DATE NOT NULL,
    primary_genre VARCHAR(100) NOT NULL
);


-- ============================================================
-- SONGS
-- Chris
-- add attributes
-- related to ListSongs
-- ============================================================

CREATE TABLE Songs (
	song_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    duration_seconds INT NOT NULL CHECK (duration_seconds > 0)
);


-- ============================================================
-- LISTS
-- Aga + Tola
-- list_type is 'SONG' or 'ALBUM'
-- a SONG list may only contain songs (ListSongs) and an ALBUM
-- list may only contain albums (ListAlbums); not enforced by
-- the schema
-- ============================================================

CREATE TABLE Lists (
    list_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    title VARCHAR(100) NOT NULL,
    list_type VARCHAR(10) NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CHECK (list_type IN ('SONG', 'ALBUM')),

    FOREIGN KEY (username)
        REFERENCES Users(username)
);


-- ============================================================
-- LIST SONGS
-- Aga + Tola
-- connects Lists and Songs (SONG lists only)
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
        REFERENCES Lists(list_id),

    FOREIGN KEY (song_id)
        REFERENCES Songs(song_id)
);


-- ============================================================
-- LIST ALBUMS
-- Aga + Tola
-- connects Lists and Albums (ALBUM lists only)
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
        REFERENCES Lists(list_id),

    FOREIGN KEY (album_id)
        REFERENCES Albums(album_id)
);


-- ============================================================
-- ALBUM RATINGS
-- Cooper
-- Users rate Albums
-- rating is 1-5 whole stars
-- ============================================================
-- Users rate albums only,
-- Ratings are whole-number values from 1 through 5,
-- A user may have at most one current rating per album

CREATE TABLE Rates (
    username VARCHAR(50) NOT NULL,
    album_id INT NOT NULL,
    rating INT NOT NULL CHECK (rating >= 1 AND rating <=5),

    PRIMARY KEY (username, album_id),

    FOREIGN KEY (username) 
        REFERENCES Users(username),

    FOREIGN KEY (album_id) 
        REFERENCES Albums(album_id)
);


-- ============================================================
-- FAVOURITE ALBUMS
-- Cooper
-- connects Users and Albums
-- ============================================================
-- Note: Users may favourite albums,
-- Songs cannot currently be favourited,
-- A user may favourite a particular album at most once

CREATE TABLE Favourites (
    username VARCHAR(50) NOT NULL,
    album_id INT NOT NULL,

    PRIMARY KEY (username, album_id),

    FOREIGN KEY (username) 
        REFERENCES Users(username),

    FOREIGN KEY (album_id) 
        REFERENCES Albums(album_id)
);


-- ============================================================
-- ALBUM SONGS
-- Cooper + Chris
-- connects Albums and Songs
-- track_number required
-- positive and unique within an Album
-- ============================================================
-- A song may appear on multiple albums, but at most once per album

CREATE TABLE AlbumSongs (
    album_id INT NOT NULL,
    song_id INT NOT NULL,
    track_number INT NOT NULL,

    PRIMARY KEY (album_id, song_id),

    UNIQUE (album_id, track_number),

    CHECK (track_number > 0),

    FOREIGN KEY (album_id)
        REFERENCES Albums(album_id),

    FOREIGN KEY (song_id)
        REFERENCES Songs(song_id)
);


-- ============================================================
-- ARTIST SONGS
-- Chris
-- connects Artists and Songs
-- credit_type required
-- ============================================================

CREATE TABLE Performs (
	artist_id INT, song_id INT,
    credit_type VARCHAR (50) NOT NULL, PRIMARY KEY (artist_id, song_id),
	FOREIGN KEY (artist_id) REFERENCES Artists(artist_id),
	FOREIGN KEY (song_id) REFERENCES Songs(song_id)
);


-- ============================================================
-- ARTIST ALBUMS
-- Chris + Cooper
-- connects Artists and Albums
-- credit_type required
-- ============================================================

CREATE TABLE ArtistAlbums (
    artist_id INT NOT NULL,
    album_id INT NOT NULL,
    credit_type VARCHAR(50) NOT NULL,

    PRIMARY KEY (artist_id, album_id),

    FOREIGN KEY (artist_id)
        REFERENCES Artists(artist_id),

    FOREIGN KEY (album_id)
        REFERENCES Albums(album_id)
);


-- ============================================================
-- CURRENT TABLES / ATTRIBUTES
-- ============================================================

-- Users
--   username
--   display_name
--
-- Artists
--   artist_id
--   artist_name
--
-- Albums
--   album_id
--   title
--   release_date
--   primary_genre
--
-- Songs
--   song_id
--   title
--   duration_seconds
--
-- Lists
--   list_id
--   username
--   title
--   list_type
--   created_at
--   updated_at
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
--
-- rates
--   username
--   album_id
--   rating
--
-- Favourites
--   username
--   album_id
--
-- AlbumSongs
--   album_id
--   song_id
--   track_number
--
-- Performs
--   artist_id
--   song_id
--   credit_type
--
-- ArtistAlbums
--   artist_id
--   album_id
--   credit_type


-- ============================================================
-- RELATIONSHIPS
-- ============================================================

-- Users -> Lists
--
-- Lists <-> Songs
--   ListSongs
--
-- Lists <-> Albums
--   ListAlbums
--
-- Users <-> Albums
--   rates
--
-- Users <-> Albums
--   Favourites
--
-- Albums <-> Songs
--   AlbumSongs
--
-- Artists <-> Songs
--   Performs
--
-- Artists <-> Albums
--   ArtistAlbums