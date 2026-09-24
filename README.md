# Music-Curator
Music curation database system

# Requirements

## Concept

A Letterbox'd-style music curation platform focused primarily on albums.

Users can:
- Rate albums
- Favourite albums
- Favourite songs
- Create curated song lists
- Add songs to curated lists
- Browse artists, albums, and songs

Users cannot:
- Rate individual songs
- Log listening history

## Core Data

- Users
- Artists
- Albums
- Songs
- Curated Lists

## Important Rules

- Ratings apply only to albums.
- Songs cannot be rated.
- Songs can be added to curated lists.
- Songs can be explicitly favourited.
- Albums can be explicitly favourited.
- A song may appear on multiple albums.
- Songs have their own artist relationship.

## Schema Outline

USER
├── rates ───────────────> ALBUM\
│\
├── favourites ──────────> ALBUM\
│\
├── favourites ──────────> SONG\
│\
└── creates ─────────────> CURATED LIST\
                                  │\
                                  │ contains\
                                  ▼\
                                SONG\
\
ARTIST\
   │\
   ├── associated with ──> ALBUM\
   │\
   └── associated with ──> SONG\
\
ALBUM\
   │\
   └── contains ─────────> SONG\