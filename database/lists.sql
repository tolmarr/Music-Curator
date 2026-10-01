CREATE TABLE lists (
    list_id INT AUTO_INCREMENT PRIMARY KEY, -- unique identifier (pk)
    title VARCHAR(255) NOT NULL,
    list_type ENUM('song', 'album') NOT NULL, -- WILL BE SONG OR ALBUM
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP -- last modification time
        ON UPDATE CURRENT_TIMESTAMP,
    username VARCHAR(50) NOT NULL,

    FOREIGN KEY (username)
        REFERENCES users(username)
);

CREATE TABLE contains_song (
    list_id INT NOT NULL,
    song_id INT NOT NULL,
    position INT NOT NULL,

    PRIMARY KEY (list_id, song_id), -- composite pk
    UNIQUE (list_id, position), -- prevent songs in same list having same position
    CHECK (position > 0),

    FOREIGN KEY (list_id) -- foreign key list_id references list_id in the lists table
        REFERENCES lists(list_id),

    FOREIGN KEY (song_id) -- foreign key song_id references song_id in the songs table
        REFERENCES songs(song_id)

);

CREATE TABLE contains_album (
    list_id INT NOT NULL,
    album_id INT NOT NULL,
    position INT NOT NULL,
    
    PRIMARY KEY (list_id, album_id),
    UNIQUE (list_id, position),
    CHECK (position > 0),
    
    FOREIGN KEY (list_id) -- foreign key list_id references list_id in the lists table
        REFERENCES lists(list_id),

    FOREIGN KEY (album_id) -- foreign key album_id references album_id in the albums table
        REFERENCES albums(album_id)


);
