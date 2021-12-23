-- Do movies directed by renowned and award-winningdirectors 
-- tend to have better ratings?

-- Find pid of all nominated directors
create view nominatedDirector as 
select distinct pid
from award
where outcome = 'Nominated';

-- Find pid of all awarded directors
create view awardedDirector as 
select distinct pid
from award
where outcome = 'Won';

-- Find mid of all movies directed by a nominated director
create view moviesWithNominatedDirector as
select distinct mid
from job
where jobCategory = 'director' and 
        pid in (select * from nominatedDirector);

-- Find mid of all movies directed by an awarded director
create view moviesWithAwardedDirector as
select distinct mid
from job
where jobCategory = 'director' and 
        pid in (select * from awardedDirector);
    
-- Find average rating of all movies directed by a nominated director
create view ratingWithNominatedDirector as
select 'With Nominated Director' as category, 
        avg(allAge) as average_movie_rating
from moviesWithNominatedDirector join rating using(mid);

-- Find average rating of all movies directed by an awarded director
create view ratingWithAwardedDirector as
select 'With Awarded Director' as category, 
        avg(allAge) as average_movie_rating
from moviesWithAwardedDirector join rating using(mid);

-- Find average rating of all movies
create view ratingAllMovies as
select 'All Movies' as category, 
        avg(allAge) as average_movie_rating
from rating;

-- Combine results
-- (select * from ratingWithNominatedDirector)
-- union
-- (select * from ratingWithAwardedDirector)
-- union
-- (select * from ratingAllMovies)
-- order by average_movie_rating;



-- Q1 follow-up question: what about avg rating of the movies directed by directors who won
-- any movie award for more than 30 times? Would the avg rating be significantly higher?

-- Find pid of all directors who won awards for more than 30 times
create view excellentAwardedDirector as 
select pid 
from Award 
where outcome = 'Won' 
group by pid 
having count(*) >= 30;

-- Find mid of all movies directed by an director who won awards for more than 30 times
create view moviesWithExcellentAwardedDirector as
select distinct mid
from job
where jobCategory = 'director' and 
        pid in (select * from excellentAwardedDirector);

-- Find average rating of all movies directed by an director who won awards for more than 30 times
create view ratingWithExcellentAwardedDirector as
select 'With Excellent Awarded Director(won any awards for more than 30 times)' as category, 
        avg(allAge) as average_movie_rating
from moviesWithExcellentAwardedDirector join rating using(mid);

-- Combine results
(select * from ratingWithNominatedDirector)
union
(select * from ratingWithAwardedDirector)
union
(select * from ratingWithExcellentAwardedDirector)
union
(select * from ratingAllMovies)
order by average_movie_rating;
