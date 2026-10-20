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
-- Cooper + Chris
-- username is meant to be immutable; not enforced by the schema
-- password_hash stores a password hash, never a plaintext password
-- certification is assigned from an authorized process and cannot
-- be freely chosen by users; the boolean field does not enforce
-- this permission check
-- ============================================================

CREATE TABLE Users (
    username VARCHAR(50) NOT NULL PRIMARY KEY, 
    display_name varchar(100) NOT NULL,
    is_certified_curator boolean NOT NULL DEFAULT FALSE,
    password_hash VARCHAR(255)
);


-- ============================================================
-- ARTISTS
-- Chris
-- ============================================================

CREATE TABLE Artists (
	artist_id INT PRIMARY KEY AUTO_INCREMENT,
    artist_name VARCHAR(255) NOT NULL
    );


-- ============================================================
-- ALBUMS
-- Cooper
-- primary_genre is the album's one main genre (required);
-- additional genres go in AlbumGenreTags
-- ============================================================

CREATE TABLE Albums (
    album_id INT AUTO_INCREMENT PRIMARY KEY ,
    title VARCHAR(255) NOT NULL,
    release_date DATE NOT NULL,
    primary_genre VARCHAR(100) NOT NULL
);


-- ============================================================
-- SONGS
-- Chris
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
-- supertype of SongLists and AlbumLists
-- every list must also be inserted into the subtype matching
-- its list_type; not enforced by the schema
-- ============================================================

CREATE TABLE Lists (
    list_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    title VARCHAR(100) NOT NULL,
    list_type VARCHAR(10) NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
    ON UPDATE CURRENT_TIMESTAMP,
    CHECK (created_at <= updated_at),

    CHECK (list_type IN ('SONG', 'ALBUM')),

    UNIQUE (list_id, list_type),

    FOREIGN KEY (username)
        REFERENCES Users(username)
);


-- ============================================================
-- SONG LISTS
-- Aga + Tola
-- subtype of Lists
-- list_type is fixed to 'SONG' so a SONG list can't also be
-- an AlbumList, and Lists.list_type can't disagree
-- ============================================================
-- CONSTRAINTS (T04)
-- Let S be the set of list_id values in SongLists
-- Let L be the set of list_id values in Lists
-- Every ID in SongLists must also be in Lists
-- project (list_id) from (SongLists) (subset of) project (list_id) from (Lists)

CREATE TABLE SongLists (
    list_id INT PRIMARY KEY,
    list_type VARCHAR(10) NOT NULL DEFAULT 'SONG',

    CHECK (list_type = 'SONG'),

    FOREIGN KEY (list_id)
        REFERENCES Lists(list_id),

    FOREIGN KEY (list_id, list_type)
        REFERENCES Lists(list_id, list_type)
);


-- ============================================================
-- ALBUM LISTS
-- Aga + Tola
-- subtype of Lists
-- list_type is fixed to 'ALBUM' so an ALBUM list can't also be
-- a SongList, and Lists.list_type can't disagree
-- ============================================================
-- CONSTRAINTS (T04)
-- Let S be the set of list_id values in AlbumLists
-- Let L be the set of list_id values in Lists
-- Every ID in AlbumLists must also be in Lists
-- project (list_id) from (AlbumLists) (subset of) project (list_id) from (Lists)

CREATE TABLE AlbumLists (
    list_id INT PRIMARY KEY,
    list_type VARCHAR(10) NOT NULL DEFAULT 'ALBUM',

    CHECK (list_type = 'ALBUM'),

    FOREIGN KEY (list_id)
        REFERENCES Lists(list_id),

    FOREIGN KEY (list_id, list_type)
        REFERENCES Lists(list_id, list_type)
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
-- users rate albums only (songs cannot be rated)
-- rating is 1-5 whole stars, at most one rating per user per album
-- review is optional (NULL = no written review); blank or
-- whitespace-only reviews are rejected, store NULL instead
-- rated_at records when the rating was made; used to order reviews
-- ============================================================
-- CONSTRAINTS (T04)
-- valid row:   (review IS NULL)     (OR)  (review contains a non-whitespace character)
-- invalid row: (review is NOT NULL) (AND) (review is empty or only whitespace) 
-- there should be no such invalid rows, ie the set containing all rows meeting the invalid condition must be empty
--
-- Let W+ be the set of whitespace strings of length >= 1
-- Let B (blank strings) = { s is a string s.t |s|=0 OR s is a member of W+ }
-- select (review is a member of B) from (Rates) = empty set

CREATE TABLE Rates (
    username VARCHAR(50) NOT NULL,
    album_id INT NOT NULL,
    rating INT NOT NULL CHECK (rating >= 1 AND rating <=5),
    review TEXT,
    rated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CHECK (review IS NULL OR review REGEXP '[^[:space:]]'),

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
-- users favourite albums only (songs cannot be favourited)
-- a user may favourite a particular album at most once
-- ============================================================

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
-- a song may appear on multiple albums, but at most once per album
-- track_number is required, positive, and unique within an album
-- ============================================================

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
-- ALBUM GENRE TAGS
-- Aga
-- an album can have many genre tags, each at most once
-- tags are separate from primary_genre, which may or may not
-- also be a tag
-- album_id ->> genre_tag independently of an album's credited
-- artists, so tags are kept out of ArtistAlbums (4NF)
-- ============================================================

CREATE TABLE AlbumGenreTags (
    album_id INT NOT NULL,
    genre_tag VARCHAR(100) NOT NULL,

    PRIMARY KEY (album_id, genre_tag),

    FOREIGN KEY (album_id)
        REFERENCES Albums(album_id)
);


-- ============================================================
-- CURRENT TABLES / ATTRIBUTES
-- ============================================================

-- Users
--   username
--   display_name
--   is_certified_curator
--   password_hash
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
-- SongLists
--   list_id
--   list_type
--
-- AlbumLists
--   list_id
--   list_type
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
-- Rates
--   username
--   album_id
--   rating
--   review
--   rated_at
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
--
-- AlbumGenreTags
--   album_id
--   genre_tag


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
--   Rates
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
--
-- Albums -> genre tags (multivalued)
--   AlbumGenreTags