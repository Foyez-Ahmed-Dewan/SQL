-- documentation: https://dev.mysql.com/doc/refman/8.0/en/string-functions.html
-- use book_shop databases
USE book_shop;

-- show tables of book_shop database
SHOW tables;

-- *** CONCAT -> Returns the string that results from concatenating the arguments. May have one or more arguments.
SELECT CONCAT('hello', ' ', 'World');
SELECT CONCAT(2, 5);

-- combining author f_name and author_lname to get author full name
SELECT CONCAT(author_fname,' ' ,author_lname) AS author_name FROM books;

-- *** CONCAT_WS -> The first argument is the separator for the rest of the arguments. The separator is added between the strings to be concatenated.
SELECT CONCAT_WS('_', 'hi', 'bye', 'hello');
-- combining author_fname, and author_lname to get author full_name
SELECT CONCAT_WS(' ', author_fname, author_lname) AS author_fname FROM books;


-- *** SUBSTRING --> works with parts of string
-- SUBSTRING(str, pos) returns the substring from position 'pos'
-- indexed from 1, 'pos' in inclusive
SELECT SUBSTRING('Quadratically',5);

SELECT SUBSTRING('foobarbar' FROM 4);

-- SUBSTRING(str, pos, len) returns the substring position 'pos' of length 6
SELECT SUBSTRING('Quadratically',5,6);
SELECT SUBSTRING('Quadratically' FROM 5 FOR 6);
     
SELECT SUBSTRING('Sakila', -3);
   
SELECT SUBSTRING('Sakila', -5, 3);
      
SELECT SUBSTRING('Sakila' FROM -4 FOR 2);

-- to find the last character of a string
SELECT SUBSTRING('FOYEZ', -1);
     
-- *** SUBSTR is same as SUBSTRING

-- Display only first 15 characters of each book title
SELECT SUBSTRING(title FROM 1 FOR 15) FROM books;
SELECT SUBSTRING(title, 1, 15) FROM books;

-- Display all the title name as short title with first 10 characters concatenated with '...'
SELECT 
	CONCAT(
		SUBSTR(title, 1, 10), 
        '...'
        ) AS 'short title' 
FROM books;

-- display first_character of author f_name.first_character of author_lname
-- ex: Foyez Ahmed = F.A
SELECT 
	CONCAT_WS('.', 
		SUBSTR(author_fname, 1, 1),
		SUBSTR(author_lname, 1, 1)
	) AS 'short name'
FROM books;


-- ***REPLACE(str, from, to) : replaces all the occurrence of 'from' of string 'str' into 'to'
SELECT REPLACE('HELLO', 'L', 'WW');
SELECT REPLACE('FOYEZ', 'FOY', 'YOYOYO');
SELECT REPLACE('cheese bread coffee milk', ' ', ' and ');

-- replace all spaces with dash in title
SELECT REPLACE(title, ' ', '-') FROM books;




-- ***REVERSE : reverse the string
SELECT REVERSE('ABCDE');
SELECT REVERSE(NULL);
SELECT REVERSE('NULL');

-- PRINT author_fname + rev(author_fname)
SELECT
	CONCAT(
		author_fname,
        REVERSE(author_fname)
    ) AS palindrome
FROM books;

-- ***CHAR_LENGTH : Number of characters in a given string
SELECT CHAR_LENGTH('HELLO WORLD');
-- ***LENGTH: Number of Bytes
SELECT LENGTH('HELLO WORLD'); -- each character is of 1 byte

-- LENGTH AND CHAR_LENGTH ARE NOT SAME

-- length of title
SELECT CHAR_LENGTH(title) AS title_length FROM books;

-- ***UPPER, UCASE : converts to upper case, LOWER, LCASE: converts to lower case
SELECT UPPER('Helooo');
SELECT UCASE('Helooo');

SELECT LOWER('Helooo');
SELECT LCASE('Helooo');

-- uppercase the title from books
SELECT UPPER(title) FROM books;

-- print title as given format: I LOVE ucase(title) !!!
SELECT 
	CONCAT_WS(' ',
		'I LOVE',
		UPPER(title),
		'!!!'
    ) AS formatted
FROM books;

-- ***RIGHT(str, len) : return the rightmost len characters from str
-- ***LEFT (str, len) : return the leftmost len characters from str
SELECT RIGHT('HELLO WORLD', 4);
SELECT LEFT('HELLO WORLD', 4);

-- ***LTRIM(str) : returns the string str with leading space characters removed
-- ***RTRIM(str) : returns the string str with ending space characters removed
-- *** TRIM(str) : return the string str with removing leading and ending spaces
SELECT LTRIM('    HELLO WORLD    ');
SELECT RTRIM('    HELLO WORLD    ');
SELECT TRIM('    HELLO WORLD    ');

-- *** INSTR (str, substr): returns the position of the first occurence of substring substr
SELECT INSTR ('HELLO WORLD', 'LO W');

-- *** INSERT (str, pos, len, newstr) : insert new_str at position pos BY REPLACING next `len` characters
SELECT INSERT('Quadratic', 3, 0, 'What');
SELECT INSERT('Quadratic', 3, 2, 'What');
SELECT INSERT('Quadratic', 3, 4, 'What');

SELECT INSERT('Quadratic', -1, 0, 'What');

SELECT INSERT('Quadratic', 3, 100, 'What');








