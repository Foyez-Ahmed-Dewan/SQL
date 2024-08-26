-- CONSTRAINTS
-- 1. UNIQUE
CREATE TABLE contacts (
	name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE
    -- phone number must be unique
);

INSERT INTO contacts (name, phone)
VALUES('billybob', '8781213455');

-- this below command result an error
-- why?
-- because phone is UNIQUE, hence we can use only one phone numbers for one entry
INSERT INTO contacts (name, phone)
VALUES('timmytimtim', '8781213455');

-- this is ok
INSERT INTO contacts (name, phone)
VALUES('billybob', '8781213456');




-- 2. CHECK
CREATE TABLE partiers (
	name VARCHAR(50),
    age INT CHECK (age > 18)
    -- age must be greater than 18 
);

INSERT INTO partiers (name, age)
VALUES('tin tin', 22);

SELECT * FROM partiers;

-- error since age is less than 12
INSERT INTO partiers (name, age)
VALUES('tin tin', 12);

--
CREATE TABLE palindromes (
	word VARCHAR(100) CHECK(word = REVERSE(word))
);

INSERT INTO palindromes(word) VALUES ('racecar');
INSERT INTO palindromes(word) VALUES ('hello'); -- error since hello is not a palindrome word




-- 3. NAMING CONSTRAINTS : we can provide a name for the constraint

CREATE TABLE partiers2 (
	name VARCHAR(50),
    age INT,
    CONSTRAINT age_over_18 CHECK (age > 18) 
);

INSERT INTO partiers2 (name, age)
VALUES('tin tin', 22);


INSERT INTO partiers2 (name, age)
VALUES('tin tin', 12);




-- 4. MULTIPLE column constraints
CREATE TABLE houses (
  purchase_price INT NOT NULL,
  sale_price INT NOT NULL,
  CONSTRAINT sprice_gt_pprice CHECK(sale_price >= purchase_price)
);

INSERT INTO houses (purchase_price, sale_price) VALUES (100, 200);

INSERT INTO houses (purchase_price, sale_price) VALUES (100, 50);

























