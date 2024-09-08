-- What are the employees with the same first and last name?

SELECT name
FROM employees
GROUP BY name
HAVING COUNT(*) > 1;

-- Sample input data:
-- employees table:
-- | id | name       |
-- |----|------------|
-- | 1  | John Smith |
-- | 2  | Jane Doe   |
-- | 3  | John Smith |
-- | 4  | Jane Doe   |
-- | 5  | Jack Brown |

-- Sample output:
-- | name       |
-- |------------|
-- | John Smith |
-- | Jane Doe   |
