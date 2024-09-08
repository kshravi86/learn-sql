-- What is the query to update the salary field by 10% for employees with a performance rating of "Excellent"?

UPDATE employees
SET salary = salary * 1.1
WHERE performance_rating = 'Excellent';

-- Sample input data:
-- employees table:
-- | id | name       | salary | performance_rating |
-- |----|------------|--------|--------------------|
-- | 1  | John Smith | 10000  | Excellent          |
-- | 2  | Jane Doe   | 20000  | Good               |
-- | 3  | Joe Brown  | 15000  | Excellent          |
-- | 4  | Jill Davis | 25000  | Fair               |
-- | 5  | Jack Brown | 12000  | Excellent          |

-- Sample output:
-- | id | name       | salary | performance_rating |
-- |----|------------|--------|--------------------|
-- | 1  | John Smith | 11000  | Excellent          |
-- | 2  | Jane Doe   | 20000  | Good               |
-- | 3  | Joe Brown  | 16500  | Excellent          |
-- | 4  | Jill Davis | 25000  | Fair               |
-- | 5  | Jack Brown | 13200  | Excellent          |
