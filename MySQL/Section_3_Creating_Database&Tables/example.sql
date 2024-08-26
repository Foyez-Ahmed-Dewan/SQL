-- to show all the database
SHOW databases;

-- to create a database
CREATE DATABASE soap_store;

-- to drop a database
DROP DATABASE soap_store;

-- to use a database
USE soap_store;

-- to create a tables
CREATE TABLE cats (
    name VARCHAR(50),
    age INT
);
 
CREATE TABLE dogs (
    name VARCHAR(50),
    breed VARCHAR(50),
    age INT
);

-- to show all the tables in current database
SHOW tables;

-- to show details of a specific tables
DESC cats;

SHOW COLUMNS FROM cats;

-- to drop a table
DROP TABLE cats;










