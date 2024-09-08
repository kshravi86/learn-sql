SELECT c.customer_name, SUM(o.amount) AS total_order_amount
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON o.product_id = p.product_id
GROUP BY c.customer_name
ORDER BY total_order_amount DESC;

-- Sample input data:
-- orders table:
-- | id | customer_id | product_id | amount |
-- |----|-------------|------------|---------|
-- | 1  | 1           | 1          | 100     |
-- | 2  | 1           | 2          | 200     |
-- | 3  | 2           | 1          | 150     |
-- | 4  | 3           | 3          | 250     |
-- | 5  | 1           | 1          | 100     |

-- customers table:
-- | id | customer_name |
-- |----|---------------|
-- | 1  | John Smith    |
-- | 2  | Jane Doe     |
-- | 3  | Joe Brown    |

-- products table:
-- | id | product_name |
-- |----|--------------|
-- | 1  | Product A    |
-- | 2  | Product B    |
-- | 3  | Product C    |

-- Sample output:
-- | customer_name | total_order_amount |
-- |---------------|--------------------|
-- | John Smith    | 400               |
-- | Jane Doe     | 150               |
-- | Joe Brown    | 250               |
