----------------------------------------------------------------------> Joins Assignment <----------------------------------------------------------------------------- 

create database joins;
use joins;

CREATE table album (id int, artist_id int, name varchar(100), year int)

CREATE table song (id int, album_id int, name varchar(50), duration float(20))

CREATE table record_label (id int, name varchar(50))

CREATE table artist (id int, record_label_id int, name varchar(50))


INSERT INTO album (id, artist_id, name, year) VALUES(1,	1, 'Devils got a new disguise', 2006),
(2,1,'Keeps getting better',2008),
(3,	1,'Master of Puppets',1986),
(4,	2,'Endgame',2009),
(5,	2,'Icon',2012),
(6,3,'Story',2000),
(7,4,'Chapters',2003),
(8,4,'Riding with the King',2000),
(9,5,'Pieces of a Dream',2005),
(10,6,'Greatest Hits',2004),
(11,7,'All-Time Greatest Hits',1975),
(12,8,'Greatest Hits',1983),(13,9,'Ultimate Collection',2015);

INSERT INTO song (id, album_id, name, duration) VALUES(1,1,'Dream On',4.26),(2,1,'Back in the Saddle',4.40),
(3,2,'Genie in a Bottle',5.3),
(4,2,'Beautiful',5.29),
(5,3,'Master of Puppets',8.35),
(6,3,'Battery',5.13),
(7,4,'Dialectic Chaos',2.26),
(8,4,'Endgame',5.57),
(9,5,'Watching Airplanes',4.03),
(10,5,'Man to Man',3.41),
(11,6,'Balck Winter Day',3.48),
(12,6,'Against Widows',4.04),
(13,7,'Reptile',3.36),
(14,7,'Modern Girl',4.49),
(15,8,'Riding with the King',4.23),
(16,8,'Key to the Highway',3.39),
(17,9,'Im Outta Love',4.02),
(18,9,'Not That Kind',3.20),
(19,10,'Eruption',1.43),
(20,10,'Hot For Teacher',4.43),
(21,11,'Sweet Home Alabama',4.45),
(22,11,'Free Bird',14.23),
(23,12,'Thunderstruck',4.52),
(24,12,'T.N.T',3.35),
(25,13,'Sgt. Pepper''s Lonely Hearts Club Band',2.0333),
(26,13,'With a Little Help from My Friends',2.7333),
(27,13,'Lucy in the Sky with Diamonds',3.4666),
(28,13,'Getting Better',2.8),(29,13,'Fixing a Hole',2.6),
(30,13,'Shes Leaving Home',3.5833),
(31,13,'Being for the Benefit of Mr. Kite!',2.6166),
(32,13,'Within You Without You',5.066),
(33,13,'When I''m Sixty-Four',2.6166),
(34,13,'Lovely Rita',2.7),
(35,13,'Good Morning Good Morning',2.6833),
(36,13,'Sgt. Pepper''s Lonely Hearts Club Band (Reprise)',1.3166),
(37,13,'A Day in the Life',5.65)

INSERT INTO record_label (id, name) VALUES(1,'Blackened'),
(6,'Capitol'),
(5,'Elektra'),
(4,'MCA'),
(3,'Universal'),
(2,'Warner Bros')

INSERT INTO artist (id, record_label_id, name) VALUES(3,1,'Anthrax'),
(2,1,'Christina'),
(1,1,'Aerosmith'),
(4,2,'Eric Clapton'),
(6,2,'Amorphis'),
(5,2,'Gary Allan'),
(8,3,'AC/DC'),
(7,3,'Lynyrd Skynyrd'),
(9,6,'Anastacia')

Select * from album;
Select * from song;
Select * from record_label;
Select * from artist;

--===================================================================================================================================================================================================
select a.name , rl.name from artist a join record_label rl on a.record_label_id=rl.id order by a.name;

select rl.name from record_label rl left join artist a on  a.record_label_id=rl.id where  a.record_label_id is null;

select ar.name ,count(*) as 'Number_of_songs' from song s join album al on al.id=s.album_id join artist ar on ar.id=al.artist_id group by ar.name order by count(*) desc;

select top 1 ar.name ,count(*) as 'Number_of_songs' from song s join album al on al.id=s.album_id join artist ar on ar.id=al.artist_id group by ar.name order by count(*) desc;

select top 5 ar.name ,count(*) as 'Number_of_songs' from song s join album al on al.id=s.album_id join artist ar on ar.id=al.artist_id group by ar.name order by count(*) ;

select ar.name ,count(*) as 'Number_of_songs' from song s join album al on al.id=s.album_id join artist ar on ar.id=al.artist_id where s.duration >5 group by ar.name ;

select ar.name ,al.name,count(*) as 'Number_of_songs' from song s join album al on al.id=s.album_id join artist ar on ar.id=al.artist_id where s.duration <5 group by ar.name ,al.name;

select top 1 al.year ,count(*) as 'Number_of_songs' from song s join album al on al.id=s.album_id group by al.year order by count(*) desc;

select top 5 ar.name,al.name,s.name ,al.year,s.duration as 'Number_of_songs' from song s join album al on al.id=s.album_id join artist ar on ar.id=al.artist_id order by s.duration desc;

select year , count(name) as 'No of albums' from album group by year ; 

with temp as (select top 1 year , count(name) as 'No_of_albums' from album group by year order by count(name) desc) select No_of_albums as 'Max number of albums recorded' from temp;

with temp as (select top 1 year , count(name) as 'No_of_albums' from album group by year order by count(name) desc) select year,No_of_albums as 'Max number of albums recorded' from temp;

select ar.name ,sum(s.duration) as 'Total duration of songs' from song s join album al on al.id=s.album_id join artist ar on ar.id=al.artist_id group by ar.name order by sum(s.duration) desc;

select ar.name as 'Artist name',al.name as 'album name' from artist ar left join album al on ar.id=al.artist_id left join song s on al.id=s.album_id and duration <5 where s.name is null ;

select ar.name , al.name,s.name,s.duration from song s join album al on al.id=s.album_id join artist ar on ar.id=al.artist_id order by ar.name , al.name,s.name;

----18
select al.name 'Album Name',
case
when round( (sum(s.duration) -cast(sum(s.duration) as int)) ,2)>0.60 then cast(sum(s.duration) as int)+1 else cast(sum(s.duration) as int)
end as 'minutes',
case when round( (sum(s. duration) -cast (sum(s.duration) as int)), 2)>0.60
then (round((sum(s.duration)-cast(sum(s.duration) as int)),2)-0.60) *100
else (round((sum(s.duration) -cast(sum(s.duration) as int)),2))*100 end as  'seconds'
from album al join song s on s.album_id = al.id where al.name like
'Greatest%' group by al.name;

---19
select distinct ar.name from artist ar left join album a on ar.id=a.artist_id and a.year>=1980 and a.year<=1990 where year is null order by ar.name;

---20
select distinct ar.name from artist ar left join album a on ar.id=a.artist_id and a.year>=1980 and a.year<=1990 where year is not null order by ar.name;




