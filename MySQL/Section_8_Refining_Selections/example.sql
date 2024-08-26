-- select database bookshop
USE book_shop;
-- show all rows from books table
SELECT * FROM books;

-- inserting new data into books table
INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES	('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
		('fake_book', 'Freida', 'Harris', 2001, 287, 428),
		('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);
        
-- show last name of all of the author
SELECT author_lname FROM books;

-- let we want only distinct name, for this purpose we can use DISTINCT keyword
SELECT DISTINCT author_lname FROM books;

-- show only distinct released year
SELECT DISTINCT released_year FROM books;

-- show author full name
SELECT CONCAT(author_fname, ' ', author_lname) AS author FROM books;

-- let we want only distinct author name
SELECT DISTINCT (CONCAT(author_fname, ' ', author_lname)) AS author FROM books;

-- this will also do the same work as above command
-- it will give all distinct combination of author_fname and author_lname
SELECT DISTINCT author_fname, author_lname FROM books;




-- to sort our result, we can use ORDER BY
-- by default, ORDER BY sorts the data in ascending order 
-- by default, data is sorted in the order they inserted

-- let we want to sort our data based on author first name
SELECT book_id, author_fname, author_lname FROM books ORDER BY author_fname;

-- sort the data based on author last name
SELECT book_id, author_fname, author_lname FROM books ORDER BY author_lname;

-- to sort the data in descending order, we can use DESC keyword along with ORDER BY
-- to sort the data in ascending order, we can use ASC keyword, but it is unnecessary since the by default ORDER BY sorts the data in ascending order
-- sort data based on author fname in descending order
SELECT book_id, author_fname, author_lname FROM books ORDER BY author_fname DESC;


-- to sort the data based on pages
SELECT title, pages FROM books;

SELECT title, pages FROM books ORDER BY pages;

SELECT title, pages FROM books ORDER BY pages ASC;

SELECT title, pages FROM books ORDER BY pages DESC;

-- to sort the data based on released year
SELECT title FROM books ORDER BY released_year;

SELECT title, released_year FROM books ORDER BY released_year;

SELECT book_id, author_fname, author_lname, pages FROM books ORDER BY pages;

-- it will sort the data based on column number 4, here it is pages
SELECT book_id, author_fname, author_lname, pages FROM books ORDER BY 4;


-- order by can be used with multiple columns
SELECT author_lname, released_year, title FROM books ORDER BY author_lname;
-- this will sort the data based on author_lname first, then will sort based on released_year
SELECT author_lname, released_year, title FROM books ORDER BY author_lname, released_year;

-- sort the data based on author lname, then sort it in descending order based on released year
SELECT author_lname, released_year, title FROM books ORDER BY author_lname, released_year DESC;


SELECT CONCAT(author_fname,' ' ,author_lname) AS author FROM books ORDER BY author;






-- LIMIT is used for number of result/rows we want to show for a query
-- ONLY 1 rows with all the columns
SELECT * FROM books LIMIT 1;

-- only FIRST 5 rows
SELECT title, pages FROM books 
LIMIT 5; 

-- first 5 books that has minimum number of pages
SELECT title, pages FROM books 
ORDER BY pages 
LIMIT 5;
-- first 5 books that has maximum number of pages
SELECT title, pages FROM books 
ORDER BY pages DESC 
LIMIT 5;

-- first 3 released books
SELECT title, released_year FROM books 
ORDER BY released_year 
LIMIT 3;

-- most recent 3 released books
SELECT title, released_year FROM books 
ORDER BY released_year DESC 
LIMIT 3;

-- we can also use LIMIT s, n    // s = starting row , n = number of rows starting from position s
-- THE below query sorts the data based on released year then gives 5 rows starting from 2
-- indexing of s starts from 0
SELECT title, released_year FROM books
ORDER BY released_year
LIMIT 2, 5;

-- what if we limit to a high number but we don't have that much data?
-- it won't generate error, instead it will print as much data as present
SELECT title FROM books
LIMIT 20000000000000;






-- LIKE is used for better searching
SELECT title, author_fname FROM books
WHERE author_fname = 'Dave';

-- what if I don't remember the actual name of the author? I am confused, is it david, dave or dan?
SELECT title, author_fname FROM books
WHERE author_fname LIKE '%da%';  
-- here '%...%' is known as wildcards, it includes any number of characters [0 to n] with given string
-- % includes any number of characters

SELECT title, author_fname FROM books
WHERE author_fname LIKE '%';

-- find all the books whose title name consists colon(:)
SELECT title FROM books
WHERE title LIKE '%:%';

-- another wildcard is underscore(_), it means exactly one characters
-- find all the books whose author fname consists 4 characters
SELECT title, author_fname FROM books
WHERE author_fname LIKE '____';
-- we used 4 underscore to indicates 4 characters

-- find all distinct authors name where author fname is length 4, 2nd character is a
SELECT DISTINCT author_fname FROM books
WHERE author_fname LIKE '_a__';

-- find all the authors whose fname ends with n
SELECT * FROM books
WHERE author_fname LIKE '%n';



-- escaping wildcards
-- maybe i'm searching for a book with a '%' or '_' in it
-- how to escape wildcards? use backslash (\)

-- find the title of the books that contains '%'
SELECT * FROM books
WHERE title LIKE '%%%';
-- Above command just prints all the data

SELECT * FROM books
WHERE title LIKE '%\%%';

-- list the title of the books that contains '_'
SELECT * FROM books
WHERE title LIKE '%\_%';


