/* Opgave 4 */
SELECT * 
FROM customers
WHERE country = 'France';

/* Opgave 5 */
SELECT firstname, lastname 
FROM employees
WHERE jobtitle = 'Sales Rep';

/* Opgave 6 */
SELECT * FROM products
WHERE productline = 'Motorcycles' AND buyprice BETWEEN 50 AND 100;

/* Opgave 7 */
SELECT customernumber 
FROM orders
WHERE status = 'Cancelled';

/* Opgave 8 */
SELECT productline, productvendor FROM products
WHERE productscale = '1:18'
ORDER BY  productvendor ASC;

/* Opgave 9 */
SELECT * FROM products
WHERE productLine = 'Motorcycles'
ORDER BY productname;

/* If we want to sort by name only and not include year: */
SELECT * FROM products
WHERE productLine = 'Motorcycles'
ORDER BY RIGHT(productName,LENGTH(productName) - 5);

/* Opgave 10 */
SELECT productname, quantityinstock FROM products
WHERE quantityinstock < 1000
ORDER BY quantityinstock DESC;

/* Opgave 11 */
SELECT customername, CONCAT (contactfirstname, contactlastname) AS contact
FROM customers WHERE country='Norway'
ORDER BY contactfirstname;

/* Opgave 12 */
SELECT COUNT(*) 
FROM customers
WHERE country = 'Germany';

/* Opgave 13 */
SELECT AVG(buyprice)  
FROM products
WHERE productline = 'Classic Cars';

/* Opgave 14 */
SELECT MAX(buyprice)
FROM products
WHERE productVendor = 'Autoart Studio Design';

/* Opgave 15 */
SELECT COUNT(DISTINCT country) 
FROM customers;

/* Opgave 16 */
SELECT SUM(quantityinstock) 
FROM products
WHERE productscale = '1:12';

/* Opgave 17 */
SELECT MAX(msrp - buyPrice)  
FROM products;

/* Opgave 18 */
SELECT productLine, AVG(buyPrice) 
FROM products
GROUP BY productLine;

/* Opgave 19 */
SELECT productvendor, COUNT(*) 
FROM products
GROUP BY productvendor;

/* Opgave 20 */
SELECT productscale, 
AVG((msrp - buyPrice)/buyPrice*100)  
FROM products
GROUP BY productscale;

/* Opgave 21 */
SELECT status, count(ordernumber)  
FROM orders
GROUP BY status;

/* Opgave 22 */
SELECT customernumber, count(*) FROM orders
GROUP BY customernumber
ORDER BY customernumber;

/* Opgave 23 */
SELECT customername, concat(e.firstName,' ', e.lastName) as salesrep
FROM customers c 
INNER JOIN employees e
ON c.salesRepEmployeeNumber = e.employeeNumber;

/* Opgave 24 */
SELECT customername, concat(e.firstName,' ', e.lastName) as salesrep
FROM customers c 
INNER JOIN employees e
ON c.salesRepEmployeeNumber = e.employeeNumber WHERE c.country = 'Italy';

/* Opgave 25 */
SELECT DISTINCT c.country, concat(e.firstName,' ', e.lastName) as salesrep
FROM customers c 
INNER JOIN employees e
ON c.salesRepEmployeeNumber = e.employeeNumber ORDER BY country;

/* Opgave 26 */
UPDATE employees 
SET lastname = 'Smith' 
WHERE employeenumber = '1165';

/* Opgave 27 */
UPDATE customers SET contactfirstname = 'Dr. Roland' WHERE contactfirstname = 'Roland' AND contactlastname = 'Keitel';

/* Opgave 28 */

/* Find først medarbejderens id: 1702: */ 
SELECT employeenumber 
FROM employees 
WHERE firstname = 'Martin' and lastname = 'Gerard';

/* Lav dernæst update */
UPDATE customers
SET salesrepemployeenumber = 1702
WHERE country = 'Spain';

/* Eller gør det i én query */
UPDATE customers
SET salesrepemployeenumber = (SELECT employeenumber FROM employees WHERE firstname = 'Martin' AND lastname = 'Gerard')
WHERE country = 'Spain';

/* Opgave 29 */
UPDATE products SET msrp = msrp * 1.1 WHERE productline = 'Motorcycles';

/* Opgave 30 */
UPDATE customers SET addressline2 = '' WHERE addressline2 IS NULL;

/* Opgave 31 */
/* You may need to alter the not-null constrains of table products or add more values to the query */
INSERT INTO productlines (productline, textdescription) VALUES ('Bicycles', 'Check out fine old bikes');
INSERT INTO products (productcode, productname, productline, productdescription) 
VALUES ('B12_1212', 'Bike', 'Bicycles', 'En fin budcykel');

/* Opgave 32 */
INSERT INTO offices (officecode, city, phone, addressline1, state, country, postalcode, territory) 
VALUES ('8', 'Copenhagen', '+45 23 23 23 23', 'Bredgade 12', 'Cph', 'Denmark', '1354', 'NA');

/* Opgave 33 */
INSERT INTO products (productcode, productname, productline, productdescription)
VALUES ('S11_1111', 'Mountainbike', 'Bicycles', 'Beginner bike'), ('S12_1212', 'Triathlonbike', 'Bicycles', 'Lightweight');

/* Opgave 34 */
/* Use this first if you want to see how many payments should be deleted */
SELECT * FROM payments
WHERE paymentdate < '2003.06.18';

DELETE FROM payments
WHERE  paymentdate < '2003.06.18';

/* Opgave 35 */
SELECT * FROM customers
WHERE customernumber < 150;

DELETE FROM customers
WHERE customernumber < 150;

/* Opgave 36 */
SELECT c.customerName, o.orderDate, o.orderNumber 
FROM customers c INNER JOIN orders o
ON c.customerNumber = o.customerNumber;

/* Opgave 37 (2 løsninger) */
SELECT c.customername
FROM customers c LEFT JOIN orders o
ON c.customernumber = o.customernumber
WHERE o.customernumber IS NULL;

SELECT customername
FROM customers
WHERE customernumber NOT IN (SELECT customerNumber FROM orders);
