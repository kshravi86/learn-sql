-- What is the second-highest salary from the employees table?

SELECT salary
FROM employees
ORDER BY salary DESC
LIMIT 1 OFFSET 1;

-- Sample input data:
-- employees table:
-- | id | name | salary |
-- |----|------|--------|
-- | 1  | John | 10000  |
-- | 2  | Jane | 20000  |
-- | 3  | Joe  | 15000  |
-- | 4  | Jill | 25000  |
-- | 5  | Jack | 12000  |

-- Sample output:
-- | salary |
-- |--------|
-- | 20000  |
