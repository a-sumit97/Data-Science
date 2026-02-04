CREATE DATABASE IF NOT EXISTS campusx;

USE campusx;

DROP DATABASE IF EXISTS campusx; 

CREATE TABLE users(
	user_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    pass VARCHAR(255) NOT NULL
);

INSERT INTO users (name,email,pass) VALUES('sumit','abc','adf');
INSERT INTO users (name,email,pass) VALUES('ashu','daf','afd');

SELECT * FROM users;

TRUNCATE TABLE users;

DROP TABLE IF EXISTS users;

CREATE TABLE students(
	student_id INTEGER PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL,
    age INTEGER CHECK(age > 6 AND age < 25),
    
    CONSTRAINT student_age_check CHECK(age > 6 and age < 25)
);

INSERT INTO students (name,age) VALUES('sumit',30);


CREATE TABLE ticket(
	ticket_id INTEGER PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    travel_date DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO ticket (ticket_id,name) VALUES (1,'sumit');

SELECT * FROM ticket;


CREATE TABLE customer(
	customer_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(355) NOT NULL UNIQUE
);

INSERT INTO customer VALUES(1,'sumit','abc');
INSERT INTO customer VALUES(2,'ashu','abcd');

SELECT * FROM customer;

DELETE FROM customer WHERE customer_id = 1;

CREATE TABLE orders(
	order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    date DATETIME NOT NULL DEFAULT current_timestamp,
    
    CONSTRAINT order_fk FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
    ON DELETE CASCADE 
    ON UPDATE CASCADE
);

ALTER TABLE customer ADD COLUMN password VARCHAR(255) NOT NULL;
ALTER TABLE customer DROP COLUMN password;

SELECT * FROM customer;

ALTER TABLE customer MODIFY COLUMN customer_id INT AUTO_INCREMENT;

ALTER TABLE customer ADD COLUMN age INT NOT NULL;

ALTER TABLE customer DROP CONSTRAINT customer_age_check;

SELECT * FROM customer;

INSERT INTO customer VALUES(1,'sumit','ada',15);


ALTER TABLE customer ADD CONSTRAINT customer_age_check CHECK(age>0 and age<30);


INSERT INTO orders (order_id,customer_id) VALUES(1,1);
INSERT INTO orders (order_id,customer_id) VALUES(2,1);
INSERT INTO orders (order_id,customer_id) VALUES(3,2);

SELECT * FROM orders;

DELETE FROM orders WHERE order_id = 3;

DROP TABLE customer;

DROP TABLE orders; 

CREATE TABLE orders(
	order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    date DATETIME NOT NULL DEFAULT current_timestamp,
    
    CONSTRAINT order_fk FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
    ON DELETE SET NULL 
    ON UPDATE SET NULL
);