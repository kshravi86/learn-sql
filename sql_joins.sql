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

-- INNER JOIN: Returns records that have matching values in both tables
SELECT customers.name, orders.total
FROM customers
INNER JOIN orders
ON customers.id = orders.customer_id;

-- Output:
-- name  | total
-- John  | 100.00
-- John  | 200.00
-- Jane  | 50.00
-- Bob   | 300.00
-- John  | 400.00

-- LEFT JOIN: Returns all records from the left table, and the matched records from the right table
SELECT customers.name, orders.total
FROM customers
LEFT JOIN orders
ON customers.id = orders.customer_id;

-- Output:
-- name  | total
-- John  | 100.00
-- John  | 200.00
-- John  | 400.00
-- Jane  | 50.00
-- Bob   | 300.00
-- Bob   | NULL

-- RIGHT JOIN: Returns all records from the right table, and the matched records from the left table
SELECT customers.name, orders.total
FROM customers
RIGHT JOIN orders
ON customers.id = orders.customer_id;

-- Output:
-- name  | total
-- John  | 100.00
-- John  | 200.00
-- John  | 400.00
-- Jane  | 50.00
-- Bob   | 300.00
-- NULL  | 50.00

-- FULL OUTER JOIN: Returns all records when there is a match in either the left or right table
SELECT customers.name, orders.total
FROM customers
FULL OUTER JOIN orders
ON customers.id = orders.customer_id;

-- Output:
-- name  | total
-- John  | 100.00
-- John  | 200.00
-- John  | 400.00
-- Jane  | 50.00
-- Bob   | 300.00
-- Bob   | NULL
-- NULL  | 50.00

-- CROSS JOIN: Returns the Cartesian product of both tables
SELECT customers.name, orders.total
FROM customers
CROSS JOIN orders ON customers.id = orders.customer_id;

-- Output:
-- name  | total
-- John  | 100.00
-- John  | 200.00
-- John  | 50.00
-- John  | 300.00
-- John  | 400.00
-- Jane  | 100.00
-- Jane  | 200.00
-- Jane  | 50.00
-- Jane  | 300.00
-- Jane  | 400.00
-- Bob   | 100.00
-- Bob   | 200.00
-- Bob   | 50.00
-- Bob   | 300.00
-- Bob   | 400.00
