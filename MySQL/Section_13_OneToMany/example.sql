-- one to many : each row of the first table can have relation with single/multiple row of the second table
CREATE DATABASE relation;

USE relation;

CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50)
);

CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016-02-10', 99.99, 1),
       ('2017-11-11', 35.50, 1),
       ('2014-12-12', 800.67, 2),
       ('2015-01-03', 12.50, 2),
       ('1999-04-11', 450.25, 5);      
       
       
SELECT * FROM customers;
SELECT * FROM orders; 


-- -- -- --
-- find all the orders made by customer george  
-- one way
-- find out the customer id of george
SELECT id FROM customers WHERE last_name = 'George';
-- select all the order made by this customer id
SELECT * FROM orders WHERE customer_id = 1;

-- CROSS JOINS : this will result all possible combination , not useful
SELECT * FROM customers, orders;

-- INNER JOINS: 
SELECT * FROM customers
JOIN orders ON customers.id = orders.customer_id;
       
SELECT first_name, last_name, order_date, amount FROM customers
INNER JOIN orders ON customers.id = orders.customer_id;
       
-- 
SELECT first_name, last_name, SUM(amount) AS total FROM customers
INNER JOIN orders ON customers.id = orders.customer_id
GROUP BY first_name, last_name
ORDER BY total;
       


-- LEFT JOIN : select everything from A, along with any matching records in B
SELECT first_name, last_name, order_date, amount FROM customers
LEFT JOIN orders ON customers.id = orders.customer_id;

SELECT first_name, last_name, order_date, amount FROM orders
LEFT JOIN customers ON customers.id = orders.customer_id;
       
SELECT first_name, last_name, IFNULL(SUM(amount), 0) AS money_spent FROM customers
LEFT JOIN orders ON customers.id = orders.customer_id
GROUP BY first_name, last_name;      
       

-- RIGHT JOIN: select everything from B, along with any matching records in A
SELECT first_name, last_name, order_date, amount FROM customers
RIGHT JOIN orders ON customers.id = orders.customer_id;
       
SELECT first_name, last_name, order_date, amount FROM orders
RIGHT JOIN customers ON customers.id = orders.customer_id;




-- ON DELETE CASCADE : 

CREATE TABLE customers2 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50)
);

CREATE TABLE orders2 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE
);

-- it means if any row is deleted in customers table, delete corresponding rows from
-- orders tables also

INSERT INTO customers2 (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
INSERT INTO orders2 (order_date, amount, customer_id)
VALUES ('2016-02-10', 99.99, 1),
       ('2017-11-11', 35.50, 1),
       ('2014-12-12', 800.67, 2),
       ('2015-01-03', 12.50, 2),
       ('1999-04-11', 450.25, 5);

DELETE FROM customers2 WHERE last_name = 'george';

SELECT * FROM orders2;





       
       