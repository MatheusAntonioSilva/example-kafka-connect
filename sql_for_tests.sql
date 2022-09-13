use fullcycle;
CREATE TABLE products (id int, description varchar(255));
INSERT INTO fullcycle.products (id, description) VALUES (1, 'Test');

CREATE DATABASE tests_connect;
USE tests_connect;
CREATE TABLE new_products (id int, description varchar(255));

USE fullcycle;
INSERT INTO fullcycle.products (id, description) VALUES (2, 'Test novo');
USE tests_connect;
SELECT * FROM tests_connect.new_products;

INSERT INTO fullcycle.products (id, description) VALUES (2, 'Test novo');
