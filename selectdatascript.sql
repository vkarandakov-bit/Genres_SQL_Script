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