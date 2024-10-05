-- SQL Query to retrieve top customers by number of orders

-- This query works by first selecting the customer_id from the 'orders' table and then counting the number of orders (order_id) for each customer. The GROUP BY clause is used to group rows with the same customer_id, allowing the COUNT function to calculate the total number of orders for each customer. Finally, the results are ordered in descending order based on the total number of orders, so that customers with the highest number of orders appear first.

SELECT customer_id, COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id
ORDER BY total_orders DESC;

-- Sample input data for 'orders' table:
-- | order_id | customer_id |
-- |----------|-------------|
-- | 1        | 101         |
-- | 2        | 102         |
-- | 3        | 101         |
-- | 4        | 103         |
-- | 5        | 101         |
-- | 6        | 102         |

-- Sample output:
-- | customer_id | total_orders |
-- |-------------|--------------|
-- | 101         | 3            |
-- | 102         | 2            |
-- | 103         | 1            |

-- Modify this query to add other customer details or to filter by date range as needed.