-- : NOT EQUAL != 
-- select all the books that were not published in 2017
SELECT title FROM books 
WHERE released_year != 2017;

-- Select all the books except the author whose last name is Lahiri
SELECT title, author_lname FROM books
WHERE author_lname != 'Lahiri';

-- : NOT LIKE
-- select all the books that does not contain any space
SELECT title FROM books 
WHERE title NOT LIKE '% %';

-- select all the books where author_fname doesn't contains 'da'
SELECT title, author_fname FROM books
WHERE author_fname NOT LIKE '%da%';

-- select all the books whose title name does not contain letter 'e'
SELECT title FROM books
WHERE title NOT LIKE '%e%';

-- select books with titles that doesn't start with 'A'
SELECT title FROM books
WHERE title NOT LIKE 'a%';


-- greater than : >
-- greater than or equal to : >=
-- less than : <
-- less than or equal to : <=
-- select books released after the year 2000
SELECT title, released_year FROM books
WHERE released_year > 2000;

-- select books with pages more than or equal to 500
SELECT title, pages FROM books
WHERE pages >= 500;

--
SELECT 99 > 1;
SELECT 1 > NULL;

-- find books with pages less than 200
SELECT title, pages FROM books
WHERE pages < 200;

-- find books that released in 2010 and after
SELECT title, released_year FROM books
WHERE released_year >= 2010;

-- : logical and : && = AND
-- : logical or  : || = OR

-- select all the books written by Dave Eggers published after the year 2010
SELECT title, CONCAT(author_fname, ' ', author_lname) AS author, released_year FROM books
WHERE (author_fname = 'Dave' && author_lname = 'Eggers' && released_year > 2010);

-- select all the books written by eggers , released after the year 2010 and title name has novel keyword
SELECT title, author_lname, released_year FROM books
WHERE author_lname = 'eggers' && released_year > 2010 && 
title LIKE '%novel%';

-- show all the books that has more than 500 pages and the title length is 30+
SELECT title, pages FROM books
WHERE pages > 500 && CHAR_LENGTH(title) > 30;

-- BETWEEN x AND y
-- NOT BETWEEN x AND y
-- select all the books published between 2004 and 2015
SELECT title, released_year FROM books
WHERE released_year >= 2004 && released_year <= 2015;

-- another way
SELECT title, released_year FROM books
WHERE released_year BETWEEN 2004 AND 2015;

-- select all books that has page more than 200 but less than 300
SELECT title, pages FROM books
WHERE pages BETWEEN 200 AND 300;

-- all the books that has pages not in between 200-500.
SELECT title, pages FROM books
WHERE pages NOT BETWEEN 200 AND 500;

-- comparing dates: 
-- all people who borns before 2005
SELECT * FROM people
WHERE YEAR(birthdate) < 2005;

-- who borns after 9 in the morning
SELECT * FROM people
WHERE HOUR(birthtime) > 9;

-- CAST : convert one datatype to another
SELECT CAST('09:00:00' AS TIME);

-- IN : 
-- NOT IN
-- select all books written by carver or lahiri or smith
-- one way
SELECT title, author_lname FROM books
WHERE author_lname = 'Carver' OR author_lname = 'Lahiri' OR author_lname = 'Smith';

-- IN works like a loop
SELECT title, author_lname FROM books
WHERE author_lname IN ('Carver', 'Lahiri', 'Smith');

-- all the books excepts written carver, lahiri, smith
SELECT title, author_lname FROM books
WHERE author_lname NOT IN ('Carver', 'Lahiri', 'Smith');

-- modulo : %
-- select all the books released in even years
SELECT * FROM books
WHERE released_year % 2 = 0
ORDER BY released_year;

-- CASE : 
-- print all the books by adding an extra column 'genre' that contains
-- 'Modern Lit' if a book released after 2000, 
-- '20th century lit' if a book released before 2000;
SELECT title, released_year,
	CASE
		WHEN released_year >= 2000 THEN 'Modern Lit'
        ELSE '20th Century Lit'
    END AS genre
FROM books;

SELECT title, released_year,
	CASE
		WHEN released_year >= 2000 && released_year <= 2010 THEN 'Modern Lit'
        WHEN released_year > 2010 THEN 'Extra Modern'
        ELSE '20th Century Lit'
    END AS GENRE
FROM books;

-- when stock quantity between 0 and 50 marks as *
-- when stock quantity between 51 and 100 marks as **
-- otherwise ***
SELECT title, stock_quantity,
	CASE
		WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
        ELSE '***'
    END AS stock
FROM books;

-- IS NULL : to detect null values
SELECT * FROM books WHERE author_lname IS NULL;











