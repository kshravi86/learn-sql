-- Sample data:
CREATE TABLE customers (
  id INT,
  name VARCHAR(50)
);

CREATE TABLE orders (
  id INT,
  customer_id INT,
  total DECIMAL(10, 2)
);

INSERT INTO customers (id, name)
VALUES
  (1, 'John'),
  (2, 'Jane'),
  (3, 'Bob');

INSERT INTO orders (id, customer_id, total)
VALUES
  (1, 1, 100.00),
  (2, 1, 200.00),
  (3, 2, 50.00),
  (4, 3, 300.00),
  (5, 1, 400.00);

-- Example 1: Find customers who have placed an order with a total value greater than 200
SELECT name
FROM customers
WHERE id IN (SELECT customer_id FROM orders WHERE total > 200);

-- Output:
-- name
-- John
-- John

-- Example 2: Find customers who have not placed an order
SELECT name
FROM customers
WHERE id NOT IN (SELECT customer_id FROM orders);

-- Output:
-- name
-- Bob

-- Example 3: Find customers who have placed the most orders
SELECT name
FROM customers
WHERE id = (SELECT customer_id FROM orders GROUP BY customer_id ORDER BY COUNT(id) DESC LIMIT 1);

-- Output:
-- name
-- John
