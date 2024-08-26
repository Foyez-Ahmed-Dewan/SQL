USE soap_store;

CREATE TABLE cats (
    name VARCHAR(50),
    age INT
);

-- inserting data into tables
INSERT INTO cats (name, age) 
VALUES ('Blue Steele', 5);

INSERT INTO cats (name, age) 
VALUES ('Jenkins', 7);

INSERT INTO cats (age, name) 
VALUES 
  (2, 'Beth');

-- to see the data of a specific tables
SELECT * FROM cats;

-- multiple value insert
INSERT INTO cats (name, age) 
VALUES 
  ('Meatball', 5), 
  ('Turkey', 1), 
  ('Potato Face', 15);
  
DESC cats;

-- not null is used so that during insertion, this value must be given
CREATE TABLE cats2 (
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL
);
  
-- if no value is provided, we can use a default value

  CREATE TABLE cats3  (    
    name VARCHAR(20) DEFAULT 'no name provided',    
    age INT DEFAULT 99  
);

DESC cats;

INSERT INTO cats3(age) VALUES(13);
  
INSERT INTO cats3() VALUES();

SELECT * FROM cats3;
  
  
-- combining not null and default
CREATE TABLE cats4  (    
    name VARCHAR(20) NOT NULL DEFAULT 'unnamed',    
    age INT NOT NULL DEFAULT 99 
);

-- specifying primary key
CREATE TABLE unique_cats (
	cat_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL
);

CREATE TABLE unique_cats2 (
	cat_id INT,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    PRIMARY KEY (cat_id)
);

-- using auto_increment to automatically increse the value of this column
CREATE TABLE unique_cats3 (
    cat_id INT AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    PRIMARY KEY (cat_id)
);





  
  
  
  
  
  
  
  



