-- Query to find all employees under a particular manager in a hierarchy using recursive CTE

WITH RECURSIVE employee_hierarchy AS (
  SELECT id, name, manager_id, 0 AS level
  FROM employees
  WHERE id = <manager_id>  -- Replace <manager_id> with the actual manager ID

  UNION ALL

  SELECT e.id, e.name, e.manager_id, m.level + 1
  FROM employees e
  JOIN employee_hierarchy m ON e.manager_id = m.id
)
SELECT * FROM employee_hierarchy ORDER BY level, id;

-- Sample input data:
-- employees table:
-- | id | name       | manager_id |
-- |----|------------|------------|
-- | 1  | John Smith | NULL       |
-- | 2  | Jane Doe   | 1          |
-- | 3  | Joe Brown  | 1          |
-- | 4  | Jill Davis | 2          |
-- | 5  | Jack Brown | 3          |

-- Sample output:
-- | id | name       | manager_id | level |
-- |----|------------|------------|-------|
-- | 1  | John Smith | NULL       | 0     |
-- | 2  | Jane Doe   | 1          | 1     |
-- | 3  | Joe Brown  | 1          | 1     |
-- | 4  | Jill Davis | 2          | 2     |
-- | 5  | Jack Brown | 3          | 2     |

-- Example 2:
-- employees table:
-- | id | name         | manager_id |
-- |----|--------------|------------|
-- | 1  | Alice Green  | NULL       |
-- | 2  | Bob White    | 1          |
-- | 3  | Charlie Blue | 1          |
-- | 4  | David Black  | 2          |
-- | 5  | Eve Yellow   | 3          |

-- Sample output:
-- | id | name         | manager_id | level |
-- |----|--------------|------------|-------|
-- | 1  | Alice Green  | NULL       | 0     |
-- | 2  | Bob White    | 1          | 1     |
-- | 3  | Charlie Blue | 1          | 1     |
-- | 4  | David Black  | 2          | 2     |
-- | 5  | Eve Yellow   | 3          | 2     |

-- Example 3:
-- employees table:
-- | id | name        | manager_id |
-- |----|-------------|------------|
-- | 1  | Peter King  | NULL       |
-- | 2  | Mary Queen  | 1          |
-- | 3  | John Prince | 2          |
-- | 4  | Paul Duke   | 2          |
-- | 5  | Lucy Baron  | 3          |

-- Sample output:
-- | id | name        | manager_id | level |
-- |----|-------------|------------|-------|
-- | 1  | Peter King  | NULL       | 0     |
-- | 2  | Mary Queen  | 1          | 1     |
-- | 3  | John Prince | 2          | 2     |
-- | 4  | Paul Duke   | 2          | 2     |
-- | 5  | Lucy Baron  | 3          | 3     |