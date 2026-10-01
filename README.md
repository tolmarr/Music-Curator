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
- Add songs to curated lists
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
- Lists
    - Song lists
    - Abum lists

## Important Rules

- Ratings apply only to albums.
- Ratings are on a scale of 1-5 stars.
- Songs cannot be rated or favourited.
- Songs can be added to curated lists.
- Albums can be explicitly favourited.
- A song may appear on multiple albums.
- The same song can appear in multiple song lists.
- The same album can appear in multiple album lists.
- Songs have their own artist relationship.
- Albums have their own artist relationship.
- Lists are only either Song lists or Album lists