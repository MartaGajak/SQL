-- database from https://www.w3schools.com/sql/trysql.asp?filename=trysql_select_all
-- 1.	Ilu jest pracowników?
SELECT count(*) FROM Employees;

-- 2.	Ilu jest klientów?
SELECT count(*) FROM Customers;

-- 3.	Ilu jest klientów z Londynu?
SELECT count(*) FROM Customers WHERE city LIKE 'London';
SELECT count(*) as London_customers FROM Customers WHERE City = 'London';

-- 4.	Z jakich krajów mamy klientów?
SELECT DISTINCT Country FROM Customers;
SELECT Country FROM Customers GROUP BY country;

-- 5.	Z ilu krajów mamy klientów?
SELECT COUNT(*)  as countries_number FROM (SELECT DISTINCT country FROM customers);
SELECT COUNT(*) FROM (SELECT country FROM customers GROUP BY country);

-- 6.	Z jakich krajów jest najwięcej klientów?
SELECT country, COUNT(*) FROM customers GROUP BY country ORDER BY COUNT(*) DESC;

-- 7.	Z jakiego kraju jest najwięcej dostawców?
SELECT country, COUNT(*) FROM suppliers GROUP BY country ORDER BY COUNT(*) DESC LIMIT 1;

-- 8.	Jaki jest najdroższy produkt?
SELECT ProductName FROM products WHERE PRICE ORDER BY price DESC LIMIT 1;

-- 9.	Jaki jest najtańszy produkt?
SELECT ProductName FROM products WHERE PRICE ORDER BY price ASC LIMIT 1;

-- 10.	Jaka jest srednia cena produktów?
SELECT AVG(price) FROM products;

-- 11.	Ile było zamówień w 1996 roku?
SELECT COUNT(*) AS order_quantity FROM Orders WHERE OrderDate LIKE '1996%';
SELECT COUNT(*) AS order_quantity FROM Orders WHERE YEAR(OrderDate) = 1996;
SELECT COUNT(*) AS order_quantity FROM Orders WHERE OrderDate >= '1996-01-01' AND OrderDate <= '1996-12-31';

-- 12.	Którego dnia było najwięcej zamówień?
SELECT OrderDate, COUNT(*) AS order_per_day FROM orders GROUP BY OrderDate ORDER BY order_per_day DESC;
select orderdate, count(*) AS myCount from orders group by orderdate order by myCount desc;

-- 13*. Którego miesiąca było najwięcej zamówień? 
SELECT tab.DateM, MAX(tab.Counter) FROM (SELECT *, SUBSTR(OrderDate, 1, 7) AS DateM, count(*) as Counter  FROM Orders GROUP BY SUBSTR(OrderDate, 1, 7)) as tab;


