-- How movie genre affects movie rating? (Are some genres of movie rated higher overall?)

-- Crime
-- Drama
-- Action
-- Adventure
-- Sci-Fi
-- Romance
-- Mystery
-- Thriller
-- Fantasy
-- History
-- Biography
-- Comedy
-- Family
-- Horror
-- Music
-- Sport
-- Animation
-- Western & War (less than 50 movie counts)

create view movieGenreAllAgeRangeRating as

(select 'Crime' as category, count(*), 
                    avg(allAge) as all_age_rating, avg(under18) as under18,
                    avg(from18to30) as from18to30, avg(from30to45) as from30to45,
                    avg(above45) as above45
from movie join rating using(mid)
where genre like '%Crime%')

union

(select 'Drama' as category, count(*), 
                    avg(allAge) as all_age_rating, avg(under18) as under18,
                    avg(from18to30) as from18to30, avg(from30to45) as from30to45,
                    avg(above45) as above45
from movie join rating using(mid)
where genre like '%Drama%')

union

(select 'Action' as category, count(*), 
                    avg(allAge) as all_age_rating, avg(under18) as under18,
                    avg(from18to30) as from18to30, avg(from30to45) as from30to45,
                    avg(above45) as above45
from movie join rating using(mid)
where genre like '%Action%')

union

(select 'Adventure' as category, count(*), 
                    avg(allAge) as all_age_rating, avg(under18) as under18,
                    avg(from18to30) as from18to30, avg(from30to45) as from30to45,
                    avg(above45) as above45
from movie join rating using(mid)
where genre like '%Adventure%')

union

(select 'Sci-Fi' as category, count(*), 
                    avg(allAge) as all_age_rating, avg(under18) as under18,
                    avg(from18to30) as from18to30, avg(from30to45) as from30to45,
                    avg(above45) as above45
from movie join rating using(mid)
where genre like '%Sci-Fi%')

union

(select 'Romance' as category, count(*), 
                    avg(allAge) as all_age_rating, avg(under18) as under18,
                    avg(from18to30) as from18to30, avg(from30to45) as from30to45,
                    avg(above45) as above45
from movie join rating using(mid)
where genre like '%Romance%')

union

(select 'Mystery' as category, count(*), 
                    avg(allAge) as all_age_rating, avg(under18) as under18,
                    avg(from18to30) as from18to30, avg(from30to45) as from30to45,
                    avg(above45) as above45
from movie join rating using(mid)
where genre like '%Mystery%')

-- union

-- (select 'Western' as category, count(*), 
--                     avg(allAge) as all_age_rating, avg(under18) as under18,
--                     avg(from18to30) as from18to30, avg(from30to45) as from30to45,
--                     avg(above45) as above45
-- from movie join rating using(mid)
-- where genre like '%Western%')

union

(select 'Thriller' as category, count(*), 
                    avg(allAge) as all_age_rating, avg(under18) as under18,
                    avg(from18to30) as from18to30, avg(from30to45) as from30to45,
                    avg(above45) as above45
from movie join rating using(mid)
where genre like '%Thriller%')

-- union

-- (select 'War' as category, count(*), 
--                     avg(allAge) as all_age_rating, avg(under18) as under18,
--                     avg(from18to30) as from18to30, avg(from30to45) as from30to45,
--                     avg(above45) as above45
-- from movie join rating using(mid)
-- where genre like '%War%')

union

(select 'Fantasy' as category, count(*), 
                    avg(allAge) as all_age_rating, avg(under18) as under18,
                    avg(from18to30) as from18to30, avg(from30to45) as from30to45,
                    avg(above45) as above45
from movie join rating using(mid)
where genre like '%Fantasy%')

union

(select 'History' as category, count(*), 
                    avg(allAge) as all_age_rating, avg(under18) as under18,
                    avg(from18to30) as from18to30, avg(from30to45) as from30to45,
                    avg(above45) as above45
from movie join rating using(mid)
where genre like '%History%')

union

(select 'Biography' as category, count(*), 
                    avg(allAge) as all_age_rating, avg(under18) as under18,
                    avg(from18to30) as from18to30, avg(from30to45) as from30to45,
                    avg(above45) as above45
from movie join rating using(mid)
where genre like '%Biography%')

union

(select 'Comedy' as category, count(*), 
                    avg(allAge) as all_age_rating, avg(under18) as under18,
                    avg(from18to30) as from18to30, avg(from30to45) as from30to45,
                    avg(above45) as above45
from movie join rating using(mid)
where genre like '%Comedy%')

union

(select 'Family' as category, count(*), 
                    avg(allAge) as all_age_rating, avg(under18) as under18,
                    avg(from18to30) as from18to30, avg(from30to45) as from30to45,
                    avg(above45) as above45
from movie join rating using(mid)
where genre like '%Family%')

union

(select 'Horror' as category, count(*), 
                    avg(allAge) as all_age_rating, avg(under18) as under18,
                    avg(from18to30) as from18to30, avg(from30to45) as from30to45,
                    avg(above45) as above45
from movie join rating using(mid)
where genre like '%Horror%')

union

(select 'Music' as category, count(*), 
                    avg(allAge) as all_age_rating, avg(under18) as under18,
                    avg(from18to30) as from18to30, avg(from30to45) as from30to45,
                    avg(above45) as above45
from movie join rating using(mid)
where genre like '%Music%')

union

(select 'Sport' as category, count(*), 
                    avg(allAge) as all_age_rating, avg(under18) as under18,
                    avg(from18to30) as from18to30, avg(from30to45) as from30to45,
                    avg(above45) as above45
from movie join rating using(mid)
where genre like '%Sport%')

union

(select 'Animation' as category, count(*), 
                    avg(allAge) as all_age_rating, avg(under18) as under18,
                    avg(from18to30) as from18to30, avg(from30to45) as from30to45,
                    avg(above45) as above45
from movie join rating using(mid)
where genre like '%Animation%')

order by all_age_rating desc;

-- select * from movieGenreAllAgeRangeRating;



-- Q3 follow-up question: What's the movie genre that each age group rated highest and rated lowest?

(select * from
    (select 'under18' as ageRange, category as rated_highest, under18 as H_rating
    from movieGenreAllAgeRangeRating
    where under18 = (select max(under18) from movieGenreAllAgeRangeRating)) highest
    natural join
    (select 'under18' as ageRange, category as rated_lowest, under18 as L_rating
    from movieGenreAllAgeRangeRating
    where under18 = (select min(under18) from movieGenreAllAgeRangeRating)) lowest
)
union
(select * from
    (select 'from18to30' as ageRange, category as rated_highest, from18to30 as H_rating
    from movieGenreAllAgeRangeRating
    where from18to30 = (select max(from18to30) from movieGenreAllAgeRangeRating)) highest
    natural join
    (select 'from18to30' as ageRange, category as rated_lowest, from18to30 as L_rating
    from movieGenreAllAgeRangeRating
    where from18to30 = (select min(from18to30) from movieGenreAllAgeRangeRating)) lowest
)
union
(select * from
    (select 'from30to45' as ageRange, category as rated_highest, from30to45 as H_rating
    from movieGenreAllAgeRangeRating
    where from30to45 = (select max(from30to45) from movieGenreAllAgeRangeRating)) highest
    natural join
    (select 'from30to45' as ageRange, category as rated_lowest, from30to45 as L_rating
    from movieGenreAllAgeRangeRating
    where from30to45 = (select min(from30to45) from movieGenreAllAgeRangeRating)) lowest
)
union
(select * from
    (select 'above45' as ageRange, category as rated_highest, above45 as H_rating
    from movieGenreAllAgeRangeRating
    where above45 = (select max(above45) from movieGenreAllAgeRangeRating)) highest
    natural join
    (select 'above45' as ageRange, category as rated_lowest, above45 as L_rating
    from movieGenreAllAgeRangeRating
    where above45 = (select min(above45) from movieGenreAllAgeRangeRating)) lowest
) 
order by ageRange;