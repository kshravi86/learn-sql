-- What is the query to find all employees under a particular manager in a hierarchy using recursive CTE?

WITH RECURSIVE employee_hierarchy AS (
  SELECT id, name, manager_id, 0 AS level
  FROM employees
  WHERE id = <manager_id>
  UNION ALL
  SELECT e.id, e.name, e.manager_id, level + 1
  FROM employees e
  JOIN employee_hierarchy m ON e.manager_id = m.id
)
SELECT * FROM employee_hierarchy;

-- Sample input data:
-- employees table:
-- | id | name       | manager_id |
-- |----|------------|-------------|
-- | 1  | John Smith | NULL       |
-- | 2  | Jane Doe   | 1          |
-- | 3  | Joe Brown  | 1          |
-- | 4  | Jill Davis | 2          |
-- | 5  | Jack Brown | 3          |

-- Sample output:
-- | id | name       | manager_id | level |
-- |----|------------|-------------|-------|
-- | 1  | John Smith | NULL       | 0     |
-- | 2  | Jane Doe   | 1          | 1     |
-- | 4  | Jill Davis | 2          | 2     |
-- | 3  | Joe Brown  | 1          | 1     |
-- | 5  | Jack Brown | 3          | 2     |
