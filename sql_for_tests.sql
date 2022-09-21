use example_kafka_connect;
CREATE TABLE example_kafka_connect (id int, description varchar(255), created_at timestamp);

CREATE DATABASE tests_connect;
USE tests_connect;
CREATE TABLE new_products (id int, description varchar(255), created_at timestamp);

INSERT INTO example_kafka_connect.products (id, description, created_at) VALUES (1, 'Test', '2022-05-09 00:00:01');
SELECT * FROM tests_connect.new_products;

INSERT INTO example_kafka_connect.products (id, description, created_at) VALUES (2, 'Test novo', '2022-05-10 00:00:01');
SELECT * FROM tests_connect.new_products;

INSERT INTO example_kafka_connect.products (id, description, created_at) VALUES (3, 'Test wwwww', '2022-05-11 00:00:02');
SELECT * FROM tests_connect.new_products;
