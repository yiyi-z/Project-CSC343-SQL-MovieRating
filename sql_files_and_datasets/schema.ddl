drop schema if exists MovieRating cascade;
create schema MovieRating;
set search_path to MovieRating;

-- Comment for table Movie:
-- A tuple in this relation represents a movie. 
-- Mid is the unique ID of the movie, and primary key of the table,
-- we use type text for this because Mid is originally from IMBd movie id, and that includes characters and numbers.
-- title is the movie title;
-- Myear is the year when the movie was released; we check if the year is less than the current year.
-- genre is the movie genre. 
-- duration is the movie duration in minutes; 
-- country is the movie producing country; 
-- language is the main language the movie uses; 
-- all attributes are not null.

create table Movie(
    Mid text,
    title text not null,
    Myear int not null check (Myear <= EXTRACT(YEAR FROM CURRENT_TIMESTAMP)),
    genre text not null,
    duration int not null, 
    country text not null,
    language text not null,
    primary key (Mid)
);

-- Comment for table Finance:
-- A tuple in this relation represents finance information of a movie.
-- Mid is the unique ID of the movie, and primary key of the table; it references to Mid in Movie table.
-- Budget is the budget of producing the movie;  
-- usaRevenue is the movie's total revenue within USA.
-- Revenue is the movie's total revenue in the world.
-- all attributes are not null.
create table Finance(
    Mid text,
    budget BIGINT not null,
    usaRevenue BIGINT not null,
    revenue BIGINT not null,
    primary key (Mid),
    foreign key (Mid) references Movie(mid)
);

-- Comment for table Rating:
-- A tuple in this relation represents average movie rating of a movie across various audience ages.
-- Mid is the unique ID of the movie, and primary key of the table; it references to Mid in Movie table.
-- allAge is the movie average rating for all ages;
-- under18 is the movie average rating for age 0-18;
-- from18to30 is the movie average rating for age 18-30;
-- from30to45 is the movie average rating for age 30-45;
-- above45 is the movie average rating for age above 45;
-- all attributes are not null.
create table Rating(
    Mid text,
    allAge float not null check(allAge >= 0 and allAge <= 10),
    under18 float not null check(under18 >= 0 and under18 <= 10), 
    from18to30 float not null check(from18to30 >= 0 and from18to30 <= 10), 
    from30to45 float not null check(from30to45 >= 0 and from30to45 <= 10), 
    above45 float not null check(above45 >= 0 and above45 <= 10),
    primary key (Mid),
    foreign key (Mid) references Movie(Mid)
);

-- Comment for table Person:
-- A tuple in this relation represents a person,
-- Pid is the unique ID of the person, and primary key of the table, 
-- we use type text for this because Mid is originally from IMBd person id, and that includes characters and numbers.
-- name is the full name of the person; 
-- birthDate is the birthdate of the person; 
-- birthPlace is the birthplace of the person.
-- all attributes are not null.
create table Person(
    Pid text,
    name text not null,
    birthDate date not null check (birthDate <= CURRENT_DATE),
    birthPlace text not null,
    primary key (Pid)
);

-- Comment for table Job:
-- A tuple in this relation represents a job related to a movie. 
-- Mid is the unique ID of the movie, it references to Mid in Movie table.
-- Pid is the unique ID of the person, it references to Pid in Person table.
-- Mid, Pid, jobCategory all together form the primary key;
-- jobCategory is the person’s specific job in this movie production.
-- all attributes are not null.
create table Job(
    Mid text,
    Pid text,
    jobCategory text not null,
    primary key (Mid, Pid, jobCategory),
    foreign key (Mid) references Movie(Mid),
    foreign key (Pid) references Person(Pid)
);

-- Comment for table Award:
-- A tuple in this relation represents a director award. 
-- Pid is the unique ID of the person, it references to Pid in Person table.
-- awardName is the name of an award for a director.
-- Ayear is the year when the person won the award or got nominated; 
-- outcome is whether the person actually won the award or just got nominated.
-- Pid, awardName, Ayear, outcome all together form the primary key;
-- all attributes are not null.
create table Award(
    Pid text,
    awardName text,
    Ayear int,
    outcome text,
    primary key (Pid, awardName, Ayear, outcome),
    foreign key (Pid) references Person(Pid)
);
