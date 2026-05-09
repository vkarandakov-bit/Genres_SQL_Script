INSERT INTO Genres (GenreName) VALUES
('Рок'),
('Поп'),
('Джаз'),
('Хип-хоп');

INSERT INTO Artists (ArtistName) VALUES
('The Beatles'),
('Michael Jackson'),
('Louis Armstrong'),
('Eminem');

INSERT INTO Artist_Genres (ArtistID, GenreID) VALUES
(1, 1),  -- The Beatles - Рок
(1, 2),  -- The Beatles - Поп
(2, 2),  -- Michael Jackson - Поп
(3, 3),  -- Louis Armstrong - Джаз
(4, 4);  -- Eminem - Хип-хоп

INSERT INTO Albums (AlbumTitle, ReleaseYear) VALUES
('Abbey Road', 1969),
('Thriller', 1982),
('Hello, Dolly!', 1964),
('The Eminem Show', 2002),
('Modern Jazz Collection', 2019),
('New Era Hits', 2020),
('Jazz & Rock Fusion', 2021);

-- 5. Связь: Альбомы ↔ Исполнители
INSERT INTO Album_Artists (AlbumID, ArtistID) VALUES
(1, 1),  -- Abbey Road - The Beatles
(2, 2),  -- Thriller - Michael Jackson
(3, 3),  -- Hello, Dolly! - Louis Armstrong
(4, 4),  -- The Eminem Show - Eminem
(5, 3),  -- Modern Jazz Collection -> Louis Armstrong
(6, 4),  -- New Era Hits -> Eminem
(7, 1), (7, 3); -- The Beatles (Рок/Поп) + Louis Armstrong (Джаз)

INSERT INTO Tracks (AlbumID, TrackTitle, Duration) VALUES
(1, 'Come Together', 259),
(1, 'Something', 182),
(2, 'Billie Jean', 294),
(2, 'Beat It', 258),
(3, 'Hello, Dolly!', 145),
(3, 'It''s a Wonderful World', 198),
(4, 'Without Me', 290),
(4, 'Cleanin'' Out My Closet', 298),
(5, 'Smooth Evening', 245),
(5, 'City Lights', 310),
(6, 'Top Line', 220),
(6, 'Night Drive', 198),
(7, 'Fusion Jam', 210);

INSERT INTO Compilations (CompilationTitle, ReleaseYear) VALUES
('Лучшие хиты 60-х', 2020),
('Лучшее из поп-музыки', 2021),
('Джазовая классика', 2019),
('Ultimate Collection', 2022);

INSERT INTO Compilation_Tracks (CompilationID, TrackID) VALUES
(1, 1),  -- Лучшие хиты 60-х - Come Together
(1, 2),  -- Лучшие хиты 60-х - Something
(1, 5),  -- Лучшие хиты 60-х - Hello, Dolly!
(2, 3),  -- Лучшее из поп-музыки - Billie Jean
(2, 4),  -- Лучшее из поп-музыки - Beat It
(3, 5),  -- Джазовая классика - Hello, Dolly!
(3, 6),  -- Джазовая классика - It's a Wonderful World
(4, 1),  -- Ultimate Collection - Come Together
(4, 3),  -- Ultimate Collection - Billie Jean
(4, 7),  -- Ultimate Collection - Without Me
(1, 9),  -- Лучшие хиты 60-х - Smooth Evening
(2, 11), -- Лучшее из поп-музыки - Top Line
(3, 10), -- Джазовая классика - City Lights
(4, 12), -- Ultimate Collection - Night Drive
(4, 13); -- Ultimate Collection - Fusion Jam