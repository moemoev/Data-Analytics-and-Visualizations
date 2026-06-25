--
-- All select statements needed to get familiar with tables mentioned in the task
--

SELECT * FROM orders;

SELECT * FROM order_details;

SELECT * FROM products;

SELECT * FROM categories;


SELECT * FROM customers;

SELECT * FROM employees;

SELECT * FROM shippers;

SELECT * FROM suppliers;


------------


--
-- View creation additionaly containing, View DROP and view select(faster then selecting select statement out of view creation) in case needed.
--


CREATE OR REPLACE VIEW v_Product_Enriched
AS
SELECT
	p.product_id,
	p.product_name,
	c.category_name,
	s.company_name AS "Supplier",
	p.unit_price
FROM
	products AS p
JOIN 
	categories AS c
USING 
	(category_id)
JOIN
	suppliers AS s 
USING
	(supplier_id);

DROP VIEW v_Product_Enriched;	


SELECT * FROM v_Product_Enriched;

------------

CREATE OR REPLACE VIEW v_Order_Sales
AS
SELECT
	o.order_id,
	o.customer_id,
	o.employee_id,
	o.order_date,
	o.ship_via,
	od.product_id,
	od.unit_price,
	od.quantity,
	od.discount,
	(od.unit_price * od.quantity * (1 - od.discount)) AS "TotalLineAmount"
FROM
	orders AS o
JOIN
	order_details AS od
USING
	(order_id);

DROP VIEW v_Order_Sales;	


SELECT * FROM v_Order_Sales;

-------------
--
-- Check the count of customers and of customers appearing in the sales tables to determine "active custoemrs"
--
SELECT COUNT(DISTINCT(customer_id)) FROM orders

SELECT count(customer_id) FROM customers

-------------


CREATE OR REPLACE VIEW v_Customer_Geo
AS
SELECT
	c.customer_id,
	c.company_name,
	c.city,
	c.country
FROM
	customers AS c
WHERE customer_id in(
	SELECT DISTINCT(customer_id) FROM orders);
	
DROP VIEW v_Customer_Geo;	


SELECT * FROM v_Customer_Geo;

-------------

SELECT MIN(order_date), MAX(shipped_date) FROM  orders
SELECT order_date FROM orders

SELECT 
	SUM("TotalLineAmount" ),
	COUNT(*)
FROM
	v_order_sales 
WHERE 
	discount = 0
	
SELECT COUNT(*) FROM v_order_sales vos  	

-------

SELECT * FROM v_order_sales vos 
WHERE order_id = 10895