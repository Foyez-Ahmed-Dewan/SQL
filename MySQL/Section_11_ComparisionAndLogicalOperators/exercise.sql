SELECT 10 != 10;

SELECT 15 > 14 AND 99 - 5 <= 94;

SELECT 1 IN (5, 3) OR 9 BETWEEN 8 AND 10;

USE book_shop;
-- select all books written before 1980 (non inclusive)
SELECT * FROM books
WHERE released_year < 1980;

-- select all books written by eggers or chabon
SELECT * FROM books
WHERE author_lname IN ('eggers', 'chabon');

-- select all books written by lahiri published after 2000
SELECT * FROM books
WHERE author_lname = 'Lahiri' && released_year > 2000;

-- select all books with page counts between 100 and 200
SELECT * FROM books
WHERE pages BETWEEN 100 AND 200;

-- select all books where author_lname starts with a 'c' or a 's'
SELECT * FROM books
WHERE author_lname LIKE 'C%' OR 'S%';

-- ADD a column named Type 
-- if title contains 'stories' -> short stories
-- if title contains 'kids' and 'a heartbreaking work' -> memories
-- else novel

SELECT title, author_lname, 
	CASE
		WHEN title LIKE '%stories%' THEN 'short stories'
        WHEN title LIKE '%kids%' OR title LIKE '%a heartbreaking work%' THEN 'memories'
        ELSE 'novel'
    END AS Type
FROM books;


-- 
SELECT author_fname, author_lname, 
	CASE
		WHEN COUNT(*) = 1 THEN '1 book'
        ELSE CONCAT(COUNT(*), ' books')
    END AS COUNT 
FROM books
WHERE author_lname IS NOT NULL
GROUP BY author_fname, author_lname;

