-- ЗАДАНИЕ 2

-- 1. Название и продолжительность самого длительного трека
SELECT TrackTitle, Duration
FROM Tracks
ORDER BY Duration DESC
LIMIT 1;

-- 2. Название треков, продолжительность которых не менее 3,5 минут
SELECT TrackTitle
FROM Tracks
WHERE Duration >= 210;

-- 3. Названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT CompilationTitle
FROM Compilations
WHERE ReleaseYear BETWEEN 2018 AND 2020;

-- 4. Исполнители, чьё имя состоит из одного слова
SELECT ArtistName
FROM Artists
WHERE ArtistName NOT LIKE '% %';

-- 5. Название треков, которые содержат слово «мой» или «my»
SELECT TrackTitle
FROM Tracks
WHERE TrackTitle ILIKE '%мой%' 
   OR TrackTitle ILIKE '%my%';

--ЗАДАНИЕ 3 

---- 1. Количество исполнителей в каждом жанре
SELECT 
    g.GenreName, 
    COUNT(ag.ArtistID) AS artists_count
FROM Genres g
LEFT JOIN Artist_Genres ag ON g.ID = ag.GenreID
GROUP BY g.GenreName
ORDER BY artists_count DESC;

-- 2. Количество треков, вошедших в альбомы 2019–2020 годов
SELECT 
    COUNT(t.ID) AS tracks_count
FROM Tracks t
JOIN Albums a ON t.AlbumID = a.ID
WHERE a.ReleaseYear BETWEEN 2019 AND 2020;

-- 3. Средняя продолжительность треков по каждому альбому
SELECT 
    a.AlbumTitle, 
    ROUND(AVG(t.Duration), 2) AS avg_duration_sec
FROM Albums a
JOIN Tracks t ON a.ID = t.AlbumID
GROUP BY a.ID, a.AlbumTitle
ORDER BY a.AlbumTitle;

-- 4. Все исполнители, которые не выпустили альбомы в 2020 году
SELECT ArtistName
FROM Artists
WHERE ID NOT IN (
    SELECT aa.ArtistID
    FROM Album_Artists aa
    JOIN Albums a ON aa.AlbumID = a.ID
    WHERE a.ReleaseYear = 2020
);

-- 5. Названия сборников, в которых присутствует конкретный исполнитель (Louis Armstrong)
SELECT DISTINCT c.CompilationTitle
FROM Compilations c
JOIN Compilation_Tracks ct ON c.ID = ct.CompilationID
JOIN Tracks t ON ct.TrackID = t.ID
JOIN Albums a ON t.AlbumID = a.ID
JOIN Album_Artists aa ON a.ID = aa.AlbumID
JOIN Artists ar ON aa.ArtistID = ar.ID
WHERE ar.ArtistName = 'Louis Armstrong';

-- ЗАДАНИЕ 4

-- 1. Названия альбомов, в которых присутствуют исполнители более чем одного жанра
SELECT a.AlbumTitle
FROM Albums a
JOIN Album_Artists aa ON a.ID = aa.AlbumID
JOIN Artist_Genres ag ON aa.ArtistID = ag.ArtistID
GROUP BY a.ID, a.AlbumTitle
HAVING COUNT(DISTINCT ag.GenreID) > 1;

-- 2. Наименования треков, которые не входят в сборники
SELECT t.TrackTitle
FROM Tracks t
LEFT JOIN Compilation_Tracks ct ON t.ID = ct.TrackID
WHERE ct.CompilationID IS NULL;

-- 3. Исполнитель(и), записавший самый короткий трек
SELECT DISTINCT ar.ArtistName
FROM Artists ar
JOIN Album_Artists aa ON ar.ID = aa.ArtistID
JOIN Tracks t ON aa.AlbumID = t.AlbumID
WHERE t.Duration = (SELECT MIN(Duration) FROM Tracks);

-- 4. Названия альбомов, содержащих наименьшее количество треков
SELECT a.AlbumTitle
FROM Albums a
LEFT JOIN Tracks t ON a.ID = t.AlbumID
GROUP BY a.ID, a.AlbumTitle
HAVING COUNT(t.ID) = (
    SELECT MIN(track_cnt)
    FROM (
        SELECT COUNT(t2.ID) AS track_cnt
        FROM Albums a2
        LEFT JOIN Tracks t2 ON a2.ID = t2.AlbumID
        GROUP BY a2.ID
    ) AS counts
);