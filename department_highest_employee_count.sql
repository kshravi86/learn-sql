SELECT department, COUNT(*) as employee_count
FROM employees
GROUP BY department
ORDER BY employee_count DESC
LIMIT 1;

-- Sample input data:
-- employees table:
-- | id | name | department |
-- |----|------|------------|
-- | 1  | John | Sales      |
-- | 2  | Jane | Marketing  |
-- | 3  | Joe  | Sales      |
-- | 4  | Jill | Marketing  |
-- | 5  | Jack | Sales      |

-- Sample output:
-- | department | employee_count |
-- |------------|----------------|
-- | Sales      | 3             |
-- What is the department with the highest number of employees?
