-- Total revenue
SELECT SUM(quantity * price) AS total_revenue
FROM orders;

-- Top selling products
SELECT product,
       SUM(quantity) AS total_sold
FROM orders
GROUP BY product
ORDER BY total_sold DESC;

-- Revenue by category
SELECT category,
       SUM(quantity * price) AS revenue
FROM orders
GROUP BY category
ORDER BY revenue DESC;

-- Top customers by spending
SELECT customer_name,
       SUM(quantity * price) AS total_spent
FROM orders
GROUP BY customer_name
ORDER BY total_spent DESC;

-- Monthly revenue trend
SELECT DATE_TRUNC('month', order_date) AS month,
       SUM(quantity * price) AS revenue
FROM orders
GROUP BY month
ORDER BY month;

-- Orders by city
SELECT city,
       COUNT(order_id) AS total_orders
FROM orders
GROUP BY city
ORDER BY total_orders DESC;

-- Average order value
SELECT AVG(quantity * price) AS avg_order_value
FROM orders;

-- Most expensive product
SELECT product,
       MAX(price) AS highest_price
FROM orders
GROUP BY product
ORDER BY highest_price DESC;

-- Customers with more than one order
SELECT customer_name,
       COUNT(order_id) AS orders_count
FROM orders
GROUP BY customer_name
HAVING COUNT(order_id) > 1;

-- Ranking categories by revenue
SELECT category,
       SUM(quantity * price) AS revenue,
       RANK() OVER (ORDER BY SUM(quantity * price) DESC) AS category_rank
FROM orders
GROUP BY category;
