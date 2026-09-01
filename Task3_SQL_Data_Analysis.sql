-- TASK 3: SQL FOR DATA ANALYSIS
-- Dataset: Ecommerce_SQL_Database

-- 1. SELECT
SELECT *
FROM customers
LIMIT 10;


-- 2. WHERE
SELECT *
FROM customers
WHERE customer_city = 'sao paulo'
LIMIT 10;


-- 3. ORDER BY
SELECT
    customer_id,
    customer_city
FROM customers
ORDER BY customer_id DESC
LIMIT 10;


-- 4. GROUP BY
SELECT
    customer_city,
    COUNT(*) AS customer_count
FROM customers
GROUP BY customer_city
ORDER BY customer_count DESC
LIMIT 10;


-- 5. JOIN
SELECT
    o.order_id,
    o.customer_id,
    c.customer_city,
    o.order_status
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
LIMIT 10;


-- 6. SUBQUERY
SELECT
    product_id,
    product_category_name,
    product_weight_g
FROM products
WHERE product_weight_g > (
    SELECT AVG(product_weight_g)
    FROM products
)
LIMIT 10;


-- 7. AGGREGATE FUNCTIONS
SELECT
    SUM(payment_value) AS total_sales,
    AVG(payment_value) AS average_payment
FROM order_payments;


-- 8. VIEW
CREATE VIEW customer_orders AS
SELECT
    o.order_id,
    o.customer_id,
    c.customer_city,
    o.order_status
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id;

SELECT *
FROM customer_orders
LIMIT 10;


-- 9. INDEX
CREATE INDEX idx_orders_customer_id
ON orders(customer_id);

SELECT name
FROM sqlite_master
WHERE type = 'index'
  AND name = 'idx_orders_customer_id';