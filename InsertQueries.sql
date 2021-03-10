--Using the INSERT statement, add one of your favorite artists to the Artist table--
INSERT INTO Artist (ArtistName, YearEstablished) VALUES ('Nobuo Uematsu', 1985);

--Using the INSERT statement, add one, or more, albums by your artist to the Album table--
INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) VALUES ('Distant Worlds', '12/04/2007', 4501, 'Square Enix', 28, 10);

--Using the INSERT statement, add some songs that are on that album to the Song table--
INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('One-Winged Angel', 266, '08/15/2008', 10, 28, 23);