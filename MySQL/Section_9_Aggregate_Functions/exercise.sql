USE book_shop;

SELECT * FROM books;

-- query 1: print number of books in the database
SELECT COUNT(released_year) AS no_of_books FROM books;

-- query 2: print how many books were released in each year?
SELECT released_year, COUNT(*) AS 'no of books' FROM books
GROUP BY released_year;

-- query 3: print total number of books in stock
SELECT SUM(stock_quantity) AS total_books FROM books;

-- query 4: find the average released_year for each author
SELECT CONCAT(author_fname, ' ', author_lname) AS author, 
	AVG(released_year) AS average_released_year FROM books
GROUP BY author;

-- query 5: Find the full name of the author who wrote the longest book
SELECT CONCAT(author_fname, ' ', author_lname) AS author, pages FROM books
WHERE pages = (
	SELECT max(pages) FROM books
);

-- another way
SELECT CONCAT(author_fname, ' ', author_lname) AS author, pages FROM books
ORDER BY pages DESC
LIMIT 1;

-- query 6: released_year, no of books that is released in this year, average page of this books
SELECT 
	released_year, 
    COUNT(*) AS 'no of books', 
	AVG(pages) AS 'avg pages' 
FROM books
GROUP BY released_year
ORDER BY released_year;











