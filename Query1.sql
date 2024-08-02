-- 1) List all data about Customers
SELECT *
FROM customers;
-- 2) List IDs, Names and Prices of all items
SELECT prod_id, prod_name, prod_price
FROM products;
-- 3) List all data related to salesmen with commission above 13%
SELECT * 
FROM salesmen
WHERE commission < 0.13;
-- 4) List the names of salesman residing in Rome
SELECT sname
FROM salesmen
WHERE city = "Rome";
-- 5) List names of customers residing either in New York or in London
SELECT cust_name
FROM customers
WHERE city = "New York" OR city = "London";
-- 6) List Ids of salesman with commission between 12% and 13% inclusive
SELECT salesman_id
FROM salesmen
WHERE commission <= 0.13 AND  commission >= 0.12;
-- other way
SELECT salesman_id
FROM salesmen
WHERE commission BETWEEN 0.12 AND 0.13;
-- 7) List Id and price of all products having the word drive in their names
SELECT prod_id, prod_price
FROM products
WHERE prod_name LIKE "%drive%";
-- 8) List data of customers whose name starts with Brad
SELECT *
FROM customers
WHERE cust_name LIKE "Brad%";
-- 9) Prepare a list of item Ids along with their original price and a proposed new price = original*1.25
SELECT prod_id, prod_price, prod_price * 1.25 AS NewPrice
FROM products;
-- 10) List the Ids and names of the customers who are not in New York
SELECT customer_id, cust_name
FROM customers
WHERE city <> "New York";