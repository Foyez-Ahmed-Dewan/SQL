-- documentation: https://dev.mysql.com/doc/refman/8.0/en/data-types.html
-- CHAR vs VARCHAR
-- INT, TINYINT, SMALLINT, MEDIUMINT, BIGINT
-- NUMERIC, DECIMAL
-- FLOAT, DOUBLE
-- DATE, TIME, DATETIME, TIMESTAMP

-- creating new table
CREATE TABLE people(
	name VARCHAR(100),
    birthdate DATE,
    birthtime TIME,
    birthdt DATETIME
);

DESC people;

INSERT INTO people(name, birthdate, birthtime, birthdt)
VALUES ('Elton', '2000-12-25', '11:00:00', '2000-12-25 11:00:00');

INSERT INTO people(name, birthdate, birthtime, birthdt)
VALUES ('Lulu', '1985-04-11', '9:45:10', '1985-04-11 9:45:10');

INSERT INTO people(name, birthdate, birthtime, birthdt)
VALUES ('Juan', '2020-08-15', '23:59:00', '2020-08-15 23:59:00');


SELECT * FROM people;

-- CURDATE -> current date, CURTIME -> current time , NOW -> current timestamp
SELECT CURTIME();
SELECT CURRENT_TIME();

SELECT CURDATE();
SELECT CURRENT_DATE();

SELECT NOW();
SELECT CURRENT_TIMESTAMP();

INSERT INTO people(name, birthdate, birthtime, birthdt)
VALUES ('Foyez', CURDATE(), CURTIME(), NOW());

SELECT * FROM people;

-- useful date functions
-- to extract day from data
SELECT birthdate, DAY(birthdate) FROM people;

SELECT birthdate, DAY(birthdate), DAYOFWEEK(birthdate) FROM people;

SELECT birthdate, DAY(birthdate), DAYOFWEEK(birthdate), DAYOFYEAR(birthdate) FROM people;

SELECT birthdate, MONTHNAME(birthdate) FROM people;

SELECT birthdate, WEEK(birthdate) FROM people;

SELECT name, birthdt, YEAR(birthdt), MONTHNAME(birthdt) FROM people;

-- time functions

SELECT name, birthtime, HOUR(birthtime) FROM people;

SELECT name, birthtime, MINUTE(birthtime) FROM people;

SELECT name, birthtime, SECOND(birthtime) FROM people;

SELECT birthdt, DATE(birthdt), TIME(birthdt) FROM people;

-- by default format: yyyy-mm-dd
SELECT birthdate, DATE_FORMAT(birthdate, '%b') FROM people;

SELECT birthdate, DATE_FORMAT(birthdate, '%M') FROM people;

-- we can change the format as we want: day-month-date
SELECT birthdate, DATE_FORMAT(birthdate, '%a %M %D') FROM people;

SELECT birthdt, DATE_FORMAT(birthdt, '%H:%i') FROM people;

SELECT birthdt, DATE_FORMAT(birthdt, '%r') FROM people;


-- DATE MATH
-- DATEDIFF (exp1, exp2) -> exp1 - exp2 : number of days, this function works only with date
SELECT DATEDIFF(CURDATE(), birthdate) FROM people;

-- 
SELECT DATE_ADD(CURDATE(), INTERVAL 1 YEAR);
SELECT DATE_ADD(CURDATE(), INTERVAL 1 MONTH);
SELECT DATE_ADD(CURDATE(), INTERVAL 1 DAY);

--

SELECT DATE_SUB(CURDATE(), INTERVAL 1 YEAR);
SELECT DATE_SUB(CURDATE(), INTERVAL 1 MONTH);
SELECT DATE_SUB(CURDATE(), INTERVAL 1 DAY);

--
SELECT birthdate, DATE_ADD(birthdate, INTERVAL 18 YEAR) FROM people;

--
SELECT TIMEDIFF(CURTIME(), '8:00:00');

SELECT NOW() - INTERVAL 22 YEAR;

-- by default timestamp

CREATE TABLE captions(
	text VARCHAR(150),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
);

INSERT INTO captions (text) VALUE ('just me');

INSERT INTO captions (text) VALUE ('beutiful weather');

SELECT * FROM captions;

-- ON UPDATE TIMESTAMP
CREATE TABLE captions2(
	text VARCHAR(150),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO captions2 (text) VALUE ('just me');
INSERT INTO captions2 (text) VALUE ('beutiful weather');

SELECT * FROM captions2;

UPDATE captions2 SET text = 'hello world';

SELECT * FROM captions2;

-- What is the difference?
-- default -> uses the time when the data is inserted
-- on updated -> everytime the data of any row is changed, this column value also changed







