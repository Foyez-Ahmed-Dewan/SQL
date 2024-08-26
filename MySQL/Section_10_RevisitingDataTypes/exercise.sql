-- : print out the current time
SELECT CURTIME();

-- : print out the current date without time
SELECT DAY(CURTIME());

-- : print out the current day of the week
SELECT DAYOFWEEK(CURDATE());

-- : print out the current day and time using this format: mm/dd/yyyy
SELECT DATE_FORMAT(CURDATE(), '%m / %d / %Y');

-- : print out the current day and time using this format: January 2nd at 3:15
SELECT DATE_FORMAT(NOW(), '%M %D at %H:%i');

-- : create a tweets table that stores:
	-- the tweet content
    -- a username
    -- time it was created
    
CREATE TABLE tweets (
	content VARCHAR(100),
    username VARCHAR(30),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO tweets (content, username) VALUES
	('this is yo', 'hi dio');
    
SELECT * FROM tweets;

INSERT INTO tweets (content, username) VALUES('this is my second tweet', 'coltscat');

SELECT * FROM tweets;

    