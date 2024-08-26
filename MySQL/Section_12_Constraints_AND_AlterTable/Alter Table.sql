CREATE TABLE companies (
	name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    CONSTRAINT name_address UNIQUE(name, address)
);

-- 1. Add a new column to an existing table
ALTER TABLE companies
ADD COLUMN phone_no INT(11);

ALTER TABLE companies
ADD COLUMN count INT NOT NULL;

DESC companies;


-- 2. How to drop a column from an existing table
ALTER TABLE companies
DROP COLUMN count;

DESC companies;


-- 3. RENAMING TABLES 
RENAME TABLE companies TO suppliers;

SELECT * FROM companies;

SELECT * FROM suppliers;

-- 3.2. RENAMING COLUMNS
ALTER TABLE suppliers 
RENAME COLUMN phone_no TO contact;

DESC suppliers;


-- 4. Modifying an existing columns type
ALTER TABLE suppliers
MODIFY COLUMN contact VARCHAR(100) NOT NULL DEFAULT 'unknown';

DESC suppliers;

-- 5. To rename a column and at the same time to change the definition use CHANGE
ALTER TABLE suppliers
CHANGE COLUMN address home VARCHAR(50);  -- address column replaced by home and definition also changed

DESC suppliers;


















