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


-- Users rate albums only,
-- Ratings are whole-number values from 1 through 5,
-- A user may have at most one current rating per album
CREATE TABLE rates (
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

-- TODO


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