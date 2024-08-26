USE book_shop;

SHOW tables;

SELECT * FROM books;

-- query 1 : select all the books title that contains 'stories' word
SELECT title FROM books
WHERE title LIKE '%stories%';

-- query 2 : find the book that has maximum number of pages, display title and page count
SELECT title, pages FROM books
ORDER BY pages DESC
LIMIT 1;

-- query 3: print a summary containing the title - released_year for the 3 most recent books
SELECT CONCAT(title, ' - ', released_year) AS summary FROM books
ORDER BY released_year DESC
LIMIT 3;

-- query 4: find all books with an author_lname that contains a space(" ")
SELECT title, author_lname FROM books
WHERE author_lname LIKE '% %';

-- query 5: find the 3 books with the lowest stock
SELECT title, released_year, stock_quantity FROM books
ORDER BY stock_quantity, released_year DESC
LIMIT 3;

-- query 6: print title and author_lname, sorted first by author_lname and then by title
SELECT title, author_lname FROM books
ORDER BY author_lname, title;

-- query 7: 
SELECT CONCAT(UPPER(CONCAT('MY FAVORITE AUTHOR IS', ' ', CONCAT(author_fname, ' ', author_lname))),'!') AS yell FROM books
ORDER BY author_lname;





