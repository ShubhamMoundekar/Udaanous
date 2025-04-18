Create Database Practice;
Use Practice;
Select * From netflix1;
-- List all unique ratings available in the dataset.

Select distinct(rating) From netflix1;

-- Find the number of Movies vs TV Shows in the dataset.

Select Type, Count(type) As Count_type From netflix1
group by type;

-- Retrieve all shows that were added in the year 2021.

Select * From netflix1
where date_added like "%2021" and type = "Movie";

-- Count how many titles each director has directed. Show the top 10.

Select Director, count(title) as Count_title From netflix1
where Director is not null and Director != "Not GIven"
group by Director
order by Count_title desc
limit 10;

-- Find the average duration of Movies (in minutes).

Select type, Avg(duration) as Avg_Time From Netflix1
where Type = "Movie"
group by type;

-- List all TV Shows with the duration listed as "1 Season".

Select Type, Duration From netflix1
where Type = "TV Show" And Duration = "1 Season";

-- Find all shows listed under the category "Documentaries".

Select Type, Listed_in From Netflix1
where Listed_in = "Documentaries";

-- Write a query to find the most common combination of genres in the listed_in column.

Select listed_in, count(*) as Genres_count From Netflix1
group by listed_in
order by genres_count desc
limit 1;

-- Get the number of titles released each year (use release_year) and order it from most to least.

Select Title, release_year from netflix1
order by release_year desc;

-- Which countries have produced titles in every year from 2010 to 2021?

Select Country, Title, Release_year From Netflix1
Where Release_Year between 2010 and 2021;
