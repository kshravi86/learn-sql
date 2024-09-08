-- What are the top 3 customers with the highest total purchase amount?

SELECT customer, SUM(amount) as total_purchase_amount
FROM orders
GROUP BY customer
ORDER BY total_purchase_amount DESC
LIMIT 3;

-- Sample input data:
-- orders table:
-- | id | customer | amount |
-- |----|----------|--------|
-- | 1  | John     | 100    |
-- | 2  | Jane     | 200    |
-- | 3  | Joe      | 150    |
-- | 4  | Jill     | 250    |
-- | 5  | Jack     | 120    |
-- | 6  | John     | 100    |
-- | 7  | Jane     | 200    |
-- | 8  | Joe      | 150    |

-- Sample output:
-- | customer | total_purchase_amount |
-- |----------|----------------------|
-- | Jill     | 250                 |
-- | Jane     | 400                 |
-- | John     | 200                 |
