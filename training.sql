--\d java_creator


INSERT INTO products VALUES (1, 'Mango', 12.5);
INSERT INTO products VALUES (2, 'BANANA', 10.5);
INSERT INTO products VALUES (3, 'Apple', 7.3);

DROP TABLE products;
DROP TABLE money;


CREATE TABLE products (
    id integer,
    name character varying (30)
);

CREATE TABLE money (
    amount integer,
    currency character varying (30),
    products_id integer
);





INSERT INTO products VALUES (1, 'Mango' );
INSERT INTO products VALUES (2, 'BANANA');


INSERT INTO products VALUES (2, 'Apple');

DROP TABLE products;

CREATE TABLE products (
    id integer PRIMARY KEY,
    name character varying (30)
);

--ERROR:  duplicate key value violates unique constraint "products_pkey"
--DETAIL:  Key (id)=(2) already exists.

SELECT * FROM money;


INSERT INTO money VALUES (21, 'MDL',1);
INSERT INTO money VALUES (13, 'MDL',2);

--ALTER
ALTER TABLE money
ADD CONSTRAINT money_products_fk
ADD FOREIGN KEY(products_id)
REFERENCES products (id);

java_creator=# INSERT INTO money VALUES (13, 'MDL',6);
ERROR:  insert or update on table "money" violates foreign key constraint "money_products_fk"
DETAIL:  Key (products_id)=(6) is not present in table "products".

DROP TABLE products;


CREATE TABLE products (
    id SERIAL,
    name character varying (30)
);

CREATE TABLE money (
    amount integer,
    currency character varying (30),
    products_id integer
);

INSERT INTO products (name) VALUES ( 'Mango' );
INSERT INTO products (name) VALUES ( 'BANANA');
INSERT INTO money VALUES (24, 'MDL',3);

--Temporary table in view 

SELECT products.name, products.id, money.amount, money.currency 
FROM products JOIN money 
ON money.products_id = products.id;

--Temporary table in view 

SELECT products.name, products.id, money.amount /19.32 AS "amount",'EUR' AS "currency" 
FROM products JOIN money 
ON money.products_id = products.id;

SELECT products.name, products.id, FLOOR(money.amount /19.32) AS "amount",'EUR' AS "currency" 
FROM products JOIN money 
ON money.products_id = products.id;


--DATA UPDATE

UPDATE money SET amount=amount 1.2 WHERE amount < 15;

--ADVANCED DELETE

DELETE FROM money WHERE id= 3;


DELETE FROM money
USING products
WHERE products.name = 'avocado';