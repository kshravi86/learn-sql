-- What are the missing sequences in the order_id column?

WITH orders_with_gaps AS (
  SELECT order_id,
         LEAD(order_id) OVER (ORDER BY order_id) AS next_order_id
  FROM orders
)
SELECT order_id + 1 AS missing_order_id
FROM orders_with_gaps
WHERE next_order_id - order_id > 1;

-- Sample input data:
-- orders table:
-- | order_id |
-- |----------|
-- | 1        |
-- | 2        |
-- | 3        |
-- | 5        |
-- | 6        |
-- | 8        |
-- | 9        |
-- | 11       |

-- Sample output:
-- | missing_order_id |
-- |-----------------|
-- | 4               |
-- | 7               |
-- | 10              |
