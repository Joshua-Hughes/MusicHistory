--Query all of the entries in the Genre table--
SELECT
	Id,
	Label
FROM Genre

--Query all the entries in the Artist table and order by the artist's name.--
SELECT
	Id,
	ArtistName,
	YearEstablished
FROM Artist
ORDER BY ArtistName;

--Write a SELECT query that lists all the songs in the Song table and include the Artist name--
SELECT s.Title,
		a.ArtistName
	FROM Song s
		JOIN Artist a on s.ArtistId = a.id;

--Write a SELECT query that lists all the Artists that have a Pop Album--
Select DISTINCT
	a.ArtistName
FROM Album
JOIN Artist a on ArtistId = a.id
JOIN Genre g on GenreId = g.id
WHERE g.id = 7;

--Write a SELECT query that lists all the Artists that have a Jazz or Rock Album--
select DISTINCT
	a.ArtistName
FROM Album
JOIN Artist a on ArtistId = a.id
JOIN Genre g on GenreId = g.id
WHERE g.id = 4 OR g.id = 2;

--Write a SELECT statement that lists the Albums with no songs--
SELECT a.Title
FROM Album a
LEFT JOIN Song s
ON s.AlbumId = a.Id
WHERE s.Title is Null;

--Write a SELECT query that provides the song titles, album title, and artist name for all of the data
--you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword
--to filter the results to the album and artist you added--
SELECT s.Title, al.Title, ar.ArtistName
FROM Song s
LEFT JOIN Album al ON s.AlbumId = al.id
LEFT JOIN Artist ar ON s.ArtistId = ar.id
WHERE ar.ArtistName = 'Nobuo Uematsu';

--Write a SELECT statement to display how many songs exist for each album--
SELECT COUNT(s.Title), al.Title
FROM Song s
JOIN Album al ON s.AlbumId = al.id
GROUP BY al.Title;

--Write a SELECT statement to display how many songs exist for each artist--
SELECT COUNT(s.Title), ar.ArtistName
FROM Song s
JOIN Artist ar ON s.ArtistId = ar.id
GROUP BY ar.ArtistName;

--Write a SELECT statement to display how many songs exist for each genre--
SELECT COUNT(s.Title), g.Label
FROM Song s
JOIN Genre g ON s.GenreId = g.id
GROUP BY g.Label;

--Write a SELECT query that lists the Artists that have put out records on more than one record label--
SELECT COUNT(DISTINCT al.Label), ar.ArtistName
FROM Artist ar JOIN Album al on ar.id = al.ArtistId
GROUP BY ar.ArtistName
HAVING COUNT(DISTINCT al.Label) > 1;

--Using MAX() function, write a select statement to find the album with the longest duration--
SELECT s.Title, s.SongLength
FROM Song s
WHERE s.SongLength = (
	SELECT MAX(s.SongLength)
	FROM Song s
);
SELECT TOP 1 s.Title, s.SongLength
FROM Song s
ORDER BY s.SongLength DESC;

--Modify the previous query to also display the title of the album.--
SELECT TOP 1 s.Title, s.SongLength, al.Title
FROM song s JOIN Album al ON s.AlbumId = al.id
ORDER BY s.SongLength DESC;