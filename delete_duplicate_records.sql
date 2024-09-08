-- What are the duplicate records in the employees table, and how can we delete them while keeping one of them?

WITH duplicate_employees AS (
  SELECT id, name, ROW_NUMBER() OVER (PARTITION BY name ORDER BY id) AS row_num
  FROM employees
)
DELETE FROM employees
WHERE id IN (
  SELECT id
  FROM duplicate_employees
  WHERE row_num > 1
);

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
-- The duplicate records are deleted, and only one instance of each remains:
-- | id | name       |
-- |----|------------|
-- | 1  | John Smith |
-- | 2  | Jane Doe   |
-- | 5  | Jack Brown |
