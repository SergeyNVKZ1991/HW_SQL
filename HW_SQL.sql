CREATE TABLE IF NOT EXISTS Genre(
	Id SERIAL PRIMARY KEY,
	Genre VARCHAR(60) NOT NULL
);

INSERT INTO Genre(Genre) 
VALUES('pop'), 
      ('Hip-Hop'),
      ('dance'),
      ('retro'),
      ('rock');

CREATE table if not exists Performers (
	Id SERIAL PRIMARY KEY,
	Performers_name VARCHAR(60) NOT NULL
);
INSERT INTO Performers(Performers_name) 
VALUES('Юрий Шатунов'),
      ('Король и Шут'),
      ('Asti'),
      ('MiyaGi'),
      ('Баста'),
      ('Клава Кока'),
      ('Филипп Киркоров'),
      ('Егор Крид'),
      ('Хабиб');


CREATE table if not exists Genre_Performers (
	     genre_Id INTEGER REFERENCES Genre(id),
	Performers_Id INTEGER REFERENCES Performers(id),
		          CONSTRAINT Genre_Performers_pk 
		          PRIMARY KEY (genre_Id, Performers_Id)
);
INSERT INTO Genre_Performers 
VALUES(1, 1), (1, 3), (1, 6),(1, 7), (1, 8), (1, 9), (2, 4), 
      (2, 5), (2, 8), (3, 1), (3, 3), (3, 5), (3, 8), (3, 9), 
      (4, 1), (4, 7), (5, 2);

CREATE table if not exists Albums (
	     Id SERIAL PRIMARY KEY,
	    album_name VARCHAR(60) PRIMARY key NOT null,
	Yers_of_releas VARCHAR(60) NOT null
);
INSERT INTO Albums(album_name, Yers_of_releas) 
VALUES('Розовый вечер', '1989'),
      ('YAMAKASI', '2020'),
      ('Баста+', '2013'),
      ('Феникс', '2018'),
      ('Грустинка', '2021'),
      ('Холостяк', '2015'),
      ('Мертвый анархист', '2003'),
      ('Не плачь', '1991');

CREATE table if not exists Performers_Albums (
	Performers_Id INTEGER REFERENCES Performers(id),	
	    Albums_Id INTEGER REFERENCES Albums(id),
	        CONSTRAINT Performers_Albums_pk 
	        PRIMARY KEY (Performers_Id, Albums_Id)
);
INSERT INTO Performers_Albums
VALUES(1, 1), (1, 3), (2, 6), (2, 7), (3, 8), (3, 1), 
      (4, 4), (4, 5), (5, 8), (5, 1), (6, 3), (7, 5), 
      (7, 8), (8, 1), (8, 2), (4, 6), (8, 3);

--drop table Songs;
     
CREATE table if not exists Songs (
	id SERIAL PRIMARY KEY,
	 duration TIME        NOT null,
   collection VARCHAR(60) NOT null,
	albums_id INTEGER     NOT null REFERENCES albums(id),
	song_name VARCHAR(60) NOT null
);

INSERT INTO Songs(duration, collection, albums_id, song_name) 
VALUES('03:02:10.00000', 'Сборник1', 1, 'Седая ночь'),
      ('03:02:10.00000', 'Сборник1', 2, 'Прятки'), 
      ('02:02:10.00000', 'Сборник1', 3, 'Игра'), 
      ('02:02:10.00000', 'Сборник2', 3, 'Игра'), 
      ('02:02:10.00000', 'Сборник2', 4, 'Хобби'), 
      ('01:02:10.00000', 'Сборник2', 5, 'Ягодка малинка'), 
      ('01:02:10.00000', 'Сборник3', 5, 'Ягодка малинка'), 
      ('01:02:10.00000', 'Сборник3', 6, 'Сердцеедка'), 
      ('03:02:10.00000', 'Сборник3', 7, 'Странник'), 
      ('03:02:10.00000', 'Сборник4', 7, 'Странник'), 
      ('03:02:10.00000', 'Сборник4', 8, 'Съешь калачь'),
      ('02:02:10.00000', 'Сборник4', 1, 'детство'),
      ('02:02:10.00000', 'Сборник5', 1, 'детство'),
      ('02:02:10.00000', 'Сборник5', 2, 'Искать не буду'),
      ('03:02:10.00000', 'Сборник5', 3, 'Твоя игра'),
      ('03:02:10.00000', 'Сборник6', 3, 'Твоя игра'),
      ('03:02:10.00000', 'Сборник6', 4, 'Истеричка'),
      ('02:02:10.00000', 'Сборник6', 4, 'Девочка танцуй'),
      ('02:02:10.00000', 'Сборник7', 4, 'Девочка танцуй'),
      ('03:02:10.00000', 'Сборник7', 5, 'На четвертом этаже'),
      ('03:02:10.00000', 'Сборник7', 6, 'Холостяк'),
      ('03:02:10.00000', 'Сборник8', 6, 'Холостяк'),
      ('03:02:10.00000', 'Сборник8', 7, 'Цвет настроения синий'),
      ('03:02:10.00000', 'Сборник8', 5, 'На четвертом этаже');

--drop table collections;
     
CREATE table if not exists collections (
	       id SERIAL PRIMARY KEY,
	            year VARCHAR(4) NOT null,
	collections_name VARCHAR(60) NOT null
);

INSERT INTO collections (year, collections_name) 
VALUES('2013', 'Сборник1'),
      ('2014', 'Сборник2'),
      ('2015', 'Сборник3'),
      ('2016', 'Сборник4'),
      ('2017', 'Сборник5'),
      ('2019', 'Сборник7'),
      ('2020', 'Сборник8');

CREATE table if not exists Songs_Collections (
	Collections_Id INTEGER REFERENCES Collections(id),	
	Songs_Id INTEGER REFERENCES Songs(id),	
	CONSTRAINT Songs_Collections_pk PRIMARY KEY (Collections_Id, Songs_Id)
);

INSERT INTO Songs_Collections
VALUES(1, 1), (1, 2), (1, 3), (2, 4), (2, 5), (2, 6), (3, 7), (3, 8), 
      (3, 9), (4, 10), (4, 11), (4, 12), (5, 13), (5, 14), (5, 15), (6, 16), (6, 17), 
      (6, 18), (7, 18), (7, 19), (7, 20), (1, 21), (2, 22), (3, 23);

-- Select-запросы
     
--1. название и год выхода альбомов, вышедших в 2018 году;

select album_name, Yers_of_releas from albums
where Yers_of_releas = '2018'

--2. название и продолжительность самого длительного трека;

select song_name, duration from songs
where duration = (SELECT MAX(duration) FROM songs)

--3. название треков, продолжительность которых не менее 3,5 минуты;

select song_name, duration from songs
where duration >= '03:00'

--4. названия сборников, вышедших в период с 2018 по 2020 год включительно;

select collections_name from collections
where year between '2018' and '2020'

--5. исполнители, чье имя состоит из 1 слова;

select Performers_name from Performers
WHERE LENGTH(Performers_name)=5

--6. название треков, которые содержат слово "мой"/"my".

select song_name from songs
WHERE song_name like '%На%';



