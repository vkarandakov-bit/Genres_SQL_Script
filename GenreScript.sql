CREATE TABLE Genres (
    ID INTEGER PRIMARY KEY,
    Name TEXT
);


CREATE TABLE Artists (
    ID INTEGER PRIMARY KEY,
    Name TEXT
);


CREATE TABLE ArtistGenres (
    ID INTEGER PRIMARY KEY,
    ArtistID INTEGER,
    GenreID INTEGER,
    FOREIGN KEY (ArtistID) REFERENCES Artists(ID),
    FOREIGN KEY (GenreID) REFERENCES Genres(ID)
);


CREATE TABLE Albums (
    ID INTEG…le TEXT,
    Duration INTEGER,
    FOREIGN KEY (AlbumID) REFERENCES Albums(ID)
);


CREATE TABLE Collections (
    ID INTEGER PRIMARY KEY,
    Title TEXT,
    ReleaseYear INTEGER
);


CREATE TABLE CollectionTracks (
    ID INTEGER PRIMARY KEY,
    CollectionID INTEGER,
    TrackID INTEGER,
    FOREIGN KEY (CollectionID) REFERENCES Collections(ID),
    FOREIGN KEY (TrackID) REFERENCES Tracks(ID)
);