-- Find the second-highest salary from the employees table
SELECT salary
FROM employees
ORDER BY salary DESC
OFFSET 1 LIMIT 1;

-- Sample input data:
-- employees table:
-- | salary |
-- |-------|
-- | 10000  |
-- | 20000  |
-- | 30000  |
-- | 40000  |
-- | 50000  |

-- Sample output:
-- | salary |
-- |-------|
-- | 40000  |
