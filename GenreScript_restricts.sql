
CREATE TABLE Genres (
    ID SERIAL PRIMARY KEY,
    GenreName VARCHAR(100) NOT NULL
);

CREATE TABLE Artists (
    ID SERIAL PRIMARY KEY,
    ArtistName VARCHAR(200) NOT NULL
);

CREATE TABLE Artist_Genres (
    ID SERIAL PRIMARY KEY,
    ArtistID INT NOT NULL REFERENCES Artists(ID),
    GenreID INT NOT NULL REFERENCES Genres(ID)
);

CREATE TABLE Albums (
    ID SERIAL PRIMARY KEY,
    AlbumTitle VARCHAR(200) NOT NULL,
    ReleaseYear INT NOT NULL CHECK (ReleaseYear >= 1900)
);

CREATE TABLE Album_Artists (
    ID SERIAL PRIMARY KEY,
    AlbumID INT NOT NULL REFERENCES Albums(ID),
    ArtistID INT NOT NULL REFERENCES Artists(ID)
);

CREATE TABLE Tracks (
    ID SERIAL PRIMARY KEY,
    AlbumID INT NOT NULL REFERENCES Albums(ID),
    TrackTitle VARCHAR(255) NOT NULL,
    Duration INT NOT NULL CHECK (Duration > 0)
);

CREATE TABLE Compilations (
    ID SERIAL PRIMARY KEY,
    CompilationTitle VARCHAR(200) NOT NULL,
    ReleaseYear INT NOT NULL CHECK (ReleaseYear >= 1900)
);


CREATE TABLE Compilation_Tracks (
    ID SERIAL PRIMARY KEY,
    CompilationID INT NOT NULL REFERENCES Compilations(ID),
    TrackID INT NOT NULL REFERENCES Tracks(ID)
);
