-- https://dev.mysql.com/doc/refman/8.4/en/views.html
-- Views are stored queries that when invoked produce a result set. 
-- A view acts as a virtual table.
SELECT 
    title, released_year, genre, rating, first_name, last_name
FROM reviews
JOIN series ON series.id = reviews.series_id
JOIN reviewers ON reviewers.id = reviews.reviewer_id;
    
-- create a view
CREATE VIEW full_reviews AS 
SELECT 
    title, released_year, genre, rating, first_name, last_name
FROM reviews
JOIN series ON series.id = reviews.series_id
JOIN reviewers ON reviewers.id = reviews.reviewer_id;
    

SELECT * FROM full_reviews;

SELECT genre, AVG(rating) AS avg_rating FROM full_reviews 
GROUP BY genre;
    
    
-- updateable views
DELETE FROM full_reviews WHERE released_year = 2010; -- not updateable

-- when we can't update view ? : https://dev.mysql.com/doc/refman/8.4/en/view-updatability.html

CREATE VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year;

SELECT * FROM ordered_series;

INSERT INTO ordered_series (title, released_year, genre)
VALUES('the great', 2020, 'comedy');

DELETE FROM ordered_series WHERE title = 'the great';

-- replacing views
CREATE OR REPLACE VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year DESC;
    
SELECT * FROM ordered_series;  

-- another way
ALTER VIEW ordered_series AS 
SELECT * FROM series ORDER BY released_year;  
    
SELECT * FROM ordered_series;

-- delete a view
DROP VIEW ordered_series;
    
    
    
    
    
    
    
    
    
    
    
    
    