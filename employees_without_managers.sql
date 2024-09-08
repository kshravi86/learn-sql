-- What are the employees who do not have a manager?

SELECT *
FROM employees
WHERE manager_id IS NULL;

-- Sample input data:
-- employees table:
-- | id | name       | manager_id |
-- |----|------------|-------------|
-- | 1  | John Smith | 2          |
-- | 2  | Jane Doe   | NULL       |
-- | 3  | Joe Brown  | 1          |
-- | 4  | Jill Davis | NULL       |

-- Sample output:
-- | id | name       | manager_id |
-- |----|------------|-------------|
-- | 2  | Jane Doe   | NULL       |
-- | 4  | Jill Davis | NULL       |
