# Music-Curator
Music curation database system

# Requirements

## Concept

A Letterbox'd-style music curation platform focused primarily on albums.

Users can:
- Rate albums
- Favourite albums
- Create curated song lists
- Create curated album lists
- Add songs to song lists and albums to album lists
- Browse artists, albums, and songs

Users cannot:
- Rate individual songs
- Favourite individual songs
- Log listening history

## Core Data

- Users
- Artists
- Albums
- Songs
- Lists (each list is either a song list or an album list)

## Important Rules

- Ratings apply only to albums.
- Ratings are on a scale of 1-5 stars, one rating per user per album.
- Songs cannot be rated or favourited.
- Albums can be explicitly favourited, once per user.
- A song may appear on multiple albums, but only once per album.
- Track numbers are positive and unique within an album. Multi-disc albums just continue the numbering.
- Songs and albums can each have multiple credited artists, each with a credit type (e.g. primary, feature, collaboration).
- Lists are either song lists or album lists (`list_type` is 'SONG' or 'ALBUM').
- Song lists only contain songs and album lists only contain albums. This is not enforced by the schema, so inserts must check `list_type`.
- Items in a list are ordered by a position that is positive and unique within the list.
- The same song can appear in multiple song lists, and the same album in multiple album lists.

# Schema

The schema is in `sql/schema.sql`.

| ERD relationship | Table |
|---|---|
| CREATES | `Lists.username` (foreign key) |
| RATES | `rates` |
| FAVOURITES | `Favourites` |
| CONTAINS_SONG | `ListSongs` |
| CONTAINS_ALBUM | `ListAlbums` |
| APPEARS_ON | `AlbumSongs` |
| PERFORMS | `Performs` |
| CREDITED_ON | `ArtistAlbums` |
