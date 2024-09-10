-- The HAVING operator in SQL is used in combination with the GROUP BY clause to filter groups based on a condition.

-- Sample data:
CREATE TABLE orders (
  id INT,
  customer_id INT,
  total DECIMAL(10, 2)
);

INSERT INTO orders (id, customer_id, total)
VALUES
  (1, 1, 100.00),
  (2, 1, 200.00),
  (3, 2, 50.00),
  (4, 3, 300.00),
  (5, 1, 400.00);

-- Example 1: Find customers who have a total order value greater than 500
SELECT customer_id, SUM(total) AS total_orders
FROM orders
GROUP BY customer_id
HAVING SUM(total) > 500;

-- Example 2: Find customers who have more than 2 orders
SELECT customer_id, COUNT(id) AS num_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(id) > 2;
