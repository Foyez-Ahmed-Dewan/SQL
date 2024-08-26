-- HAVING
-- all the movie that has been rated more than once
SELECT 
	title, 
    AVG(rating) AS avg_rating,
    COUNT(rating) AS review_count
FROM full_reviews
GROUP BY title HAVING review_count > 1
ORDER BY avg_rating;

-- WITH ROLLUP
SELECT title, AVG(rating) FROM full_reviews 
GROUP BY title WITH ROLLUP;

SELECT title, COUNT(rating) FROM full_reviews
GROUP BY title WITH ROLLUP;

SELECT released_year, genre, AVG(rating) FROM full_reviews 
GROUP BY released_year, genre WITH ROLLUP;


-- SQL MODES
-- there are a lot of types of modes: global and session
-- viewing modes
SELECT @@GLOBAL.sql_mode;
SELECT @@SESSION.sql_mode;

-- SET GLOBAL sql_mode = 'modes'; 
-- SET SESSION sql_mode = 'modes';




