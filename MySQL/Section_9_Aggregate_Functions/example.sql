USE book_shop;

-- inserting two empty rows in the books table
INSERT INTO books() VALUES ();
INSERT INTO books() VALUES ();

SELECT * FROM books;


-- to see number of rows(including empty rows) in the current table, we can use COUNT(*)
SELECT COUNT(*) FROM books;
-- here it gives count of those rows where data in the author_fname column is present, empty row is ignored
SELECT COUNT(author_fname) FROM books;

-- to count number of distinct author fnames
SELECT COUNT(DISTINCT author_fname) FROM books;
-- to count distinct number of released years
SELECT COUNT(DISTINCT released_year) FROM books;
-- how many titles contains the word 'the'?
SELECT title FROM books WHERE title LIKE '%the%';
-- to find the count of the rows where title contains the
SELECT COUNT(title) FROM books WHERE title LIKE '%the%';
-- it also works same as before
SELECT COUNT(*) FROM books WHERE title LIKE '%the%';




-- GROUP BY : summarizes or aggregates identical data into single rows
SELECT COUNT(*) FROM books
GROUP BY author_lname;
-- number of books written by each author grouped by author_lname
SELECT author_lname, COUNT(*) AS books_written FROM books
GROUP BY author_lname;
-- sort the data by most number of books written by each author
SELECT author_lname, COUNT(*) AS books_written FROM books
GROUP BY author_lname
ORDER BY books_written DESC;
-- find out number of books released by each year
SELECT released_year, COUNT(*) AS no_of_released_books FROM books
GROUP BY released_year;




-- find the earliest released year
SELECT MIN(released_year) FROM books;
-- find the books that contains most number of pages
SELECT MAX(pages) as no_of_page FROM books;
-- find the books that contains minimum number of pages
SELECT MIN(pages) as no_of_page FROM books;
-- find the author_fname that has minimum length
SELECT MIN(CHAR_LENGTH(author_fname)) FROM books;
-- find the author_fname that comes first and author_lname that comes last in lexicographically order
SELECT MIN(author_fname), MAX(author_lname) FROM books;


-- what if I want the title of the books that has maximum no of pages?
-- one way
SELECT title, pages FROM books
ORDER BY pages DESC
LIMIT 1;
-- but this is not correct sometimes. What if I have duplicate title with the same number of maximum pages


-- alternative way
-- we can use subquries
SELECT title, pages FROM books
WHERE pages = (
	SELECT MAX(pages) FROM books
);

-- find the titles of the books that was released earliest
SELECT title, released_year FROM books
WHERE released_year = (
	SELECT MIN(released_year) FROM books
);





-- grouping by multiple columns
SELECT author_fname, author_lname, COUNT(*) FROM books
GROUP BY author_fname, author_lname;

SELECT CONCAT(author_fname, ' ', author_lname) AS author, COUNT(*) FROM books
GROUP BY author;





-- find the year each author published their first book
SELECT CONCAT(author_fname, ' ', author_lname) AS author, MIN(released_year) AS first_book_released_year FROM books
GROUP BY author;

-- find the released year of each authors latest books
SELECT CONCAT(author_fname, ' ', author_lname) AS author, MAX(released_year) AS last_book_released_year FROM books
GROUP BY author;

-- 
SELECT 
	CONCAT(author_fname, ' ', author_lname) AS author,
    COUNT(*) AS books_written,
    MAX(released_year) AS latest_release,
    MIN(released_year) AS earliest_release,
    MAX(pages) AS max_page_count
FROM books 
GROUP BY author;




-- sum of total pages
SELECT SUM(pages) FROM books;
-- sum of total pages written by each author
SELECT CONCAT(author_fname, ' ', author_lname) AS author, SUM(pages) AS pages_written FROM books
GROUP BY author;

-- calculate the average no of pages across all books
SELECT AVG(pages) FROM books;
-- calculate the average stock quantity
SELECT AVG(stock_quantity) FROM books;
-- calculate average stock quantity in each year
SELECT released_year, AVG(stock_quantity) AS average_stock FROM books
GROUP BY released_year
ORDER BY released_year;



