-- Does high financial investment on a movie necessarily increase the rating and is thehigh gross also linked to a high rating?
-- For example, is it possible for a movie to havea relatively low budget and a low revenue, but have a very good rating?

create view lowBudget_lowRevenue as
select distinct mid 
from finance 
where budget < 10000000 and usaRevenue < 10000000 and revenue < 20000000;

create view low_budget_low_revenue_high_rating_movies as
select mid, title as low_budget_low_revenue_high_rating_movies, Myear, allAge as avg_rating
from lowBudget_lowRevenue join rating using(mid) 
                            join movie using(mid)
where allAge > 8.0;

-- select * from low_budget_low_revenue_high_rating_movies;

create view low_budget_low_revenue_low_rating_movies as
select mid, title as low_budget_low_revenue_low_rating_movies, Myear, allAge as avg_rating
from lowBudget_lowRevenue join rating using(mid) 
                            join movie using(mid)
where allAge < 6.5;

-- select * from low_budget_low_revenue_low_rating_movies;

create view highBudget_highRevenue as
select distinct mid 
from finance 
where budget > 90000000 and usaRevenue > 150000000 and revenue > 300000000;

create view high_budget_high_revenue_high_rating_movies as
select mid, title as high_budget_high_revenue_high_rating_movies, Myear, allAge as avg_rating
from highBudget_highRevenue join rating using(mid) 
                            join movie using(mid)
where allAge > 8.0;

-- select * from high_budget_high_revenue_high_rating_movies;

create view high_budget_high_revenue_low_rating_movies as
select mid, title as high_budget_high_revenue_low_rating_movies, Myear, allAge as avg_rating
from highBudget_highRevenue join rating using(mid) 
                            join movie using(mid)
where allAge < 6.5;

-- select * from high_budget_high_revenue_low_rating_movies;

-- Combine results:
-- (select 'low_budget_low_revenue_high_rating' as category, count(*) from low_budget_low_revenue_high_rating_movies)
-- union
-- (select 'low_budget_low_revenue_low_rating' as category, count(*) from low_budget_low_revenue_low_rating_movies)
-- union
-- (select 'high_budget_high_revenue_high_rating' as category, count(*) from high_budget_high_revenue_high_rating_movies)
-- union
-- (select 'high_budget_high_revenue_low_rating' as category, count(*) from high_budget_high_revenue_low_rating_movies)
-- order by category;


-- Q2 follow-up question: considering year range?
-- select * from low_budget_low_revenue_high_rating_movies where Myear > 2000;
-- select * from low_budget_low_revenue_low_rating_movies where Myear > 2000;

-- Combine results:
(select 'low_budget_low_revenue_high_rating' as category, count(*) from low_budget_low_revenue_high_rating_movies)
union
(select 'low_budget_low_revenue_low_rating' as category, count(*) from low_budget_low_revenue_low_rating_movies)
union
(select 'low_budget_low_revenue_high_rating_after2000' as category, count(*) from low_budget_low_revenue_high_rating_movies where Myear > 2000)
union
(select 'low_budget_low_revenue_low_rating_after2000' as category, count(*) from low_budget_low_revenue_low_rating_movies where Myear > 2000)
union
(select 'high_budget_high_revenue_high_rating' as category, count(*) from high_budget_high_revenue_high_rating_movies)
union
(select 'high_budget_high_revenue_low_rating' as category, count(*) from high_budget_high_revenue_low_rating_movies)
order by category;