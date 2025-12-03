CREATE table newest AS
  SELECT title, year from titles order by year desc limit 10;


CREATE table dog_movies AS 
  SELECT title, character from titles as a, principals as b
  where a.tconst = b.tconst and b.character like "%dog%";


CREATE table leads AS 
  SELECT name, count(*) as lead_roles from principals as a, names as b
  where a.ordering = 1 and a.nconst = b.nconst
  group by name
  having count(*) > 10;


CREATE table long_movies AS 
  SELECT concat(floor(year/10*10), "s") as decade, count(*) as count from titles
  where runtime > 180
  group by decade
  order by decade;

