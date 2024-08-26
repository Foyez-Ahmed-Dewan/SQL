USE book_shop;

SHOW tables;

DESC books;

-- Reverse and uppercase the following sentence: "Why does my cat look at me with such hatred?"
SELECT UCASE(REVERSE('Why does my cat look at me with such hatred?'));

-- 
SELECT REPLACE(CONCAT('I', ' ', 'like', ' ', 'cats'), ' ', '-');

-- replace spaces in titles with `->`
SELECT REPLACE(title, ' ', '->') FROM books;

-- print a tables with forwards and backwards column where
-- forwards contains author last name
-- backwards contains reverse of author last name
SELECT author_lname AS forwards, REVERSE(author_lname) AS backwards FROM books;

-- print author full name in uppercase
SELECT UCASE(CONCAT(author_fname, ' ', author_lname)) AS 'full name in caps' FROM books;

-- print a tables with one column names blurb that contains 
-- title + was released in + released year
SELECT CONCAT(title, ' was released in ', released_year) AS blurb FROM books;

-- print the books titles and length of each title
SELECT title, CHAR_LENGTH(title) AS 'character count' FROM books;

-- generate a table with 3 columns as below:
-- 'short title' contains first 10 characters from each title concatenated by '...'
-- author  is concatenated as (author_lname, ',', author_fname)
-- quantity is number of quantity in stock concatenated by 'in stock'

SELECT CONCAT(author_fname, '...') AS 'short title',
	   CONCAT(author_lname, ',', author_fname) AS author,
       CONCAT(stock_quantity, ' in stock') AS quantity 
       FROM books;
