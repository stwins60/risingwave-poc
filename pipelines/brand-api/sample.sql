-- sample-query.sql

CREATE TABLE orders (
order_id BIGINT,
customer_id BIGINT,
amount DECIMAL,
created_at TIMESTAMP
);

INSERT INTO orders VALUES
(1, 101, 25.50, NOW()),
(2, 101, 13.25, NOW()),
(3, 102, 99.99, NOW()),
(4, 103, 45.10, NOW()),
(5, 101, 75.00, NOW());

CREATE MATERIALIZED VIEW mv_customer_sales AS
SELECT
customer_id,
COUNT(*) AS total_orders,
SUM(amount) AS total_spent
FROM orders
GROUP BY customer_id;

SELECT * FROM mv_customer_sales;

INSERT INTO orders VALUES
(6, 102, 10.00, NOW()),
(7, 103, 20.00, NOW());

SELECT * FROM mv_customer_sales;
