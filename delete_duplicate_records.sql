-- SQL script to delete duplicate records from a sample table
-- Assuming that 'id' is the primary key and we want to keep the lowest 'id' for each duplicate

-- Sample table: products
-- Columns: id, name, category, price

WITH duplicate_records AS (
  -- Step 1: Find duplicate records based on columns that define a duplicate
  -- The MIN(id) function is used to determine the record with the lowest 'id' for each set of duplicates
  SELECT name, category, price, -- Columns that define a duplicate
         MIN(id) AS min_id
  FROM products
  GROUP BY name, category, price
  HAVING COUNT(*) > 1 -- Only consider records that have duplicates
)
-- Step 2: Delete all records that are duplicates, except for the one with the lowest 'id'
DELETE FROM products
WHERE id NOT IN (
  -- Select the 'min_id' from the duplicate_records CTE to keep the lowest 'id' for each set of duplicates
  SELECT min_id
  FROM duplicate_records
);

-- Sample Input:
-- +----+---------+----------+-------+
-- | id | name    | category | price |
-- +----+---------+----------+-------+
-- |  1 | Widget  | Tools    |  10.0 |
-- |  2 | Widget  | Tools    |  10.0 |
-- |  3 | Gadget  | Tools    |  15.0 |
-- |  4 | Widget  | Tools    |  10.0 |
-- |  5 | Gizmo   | Hardware |  20.0 |
-- +----+---------+----------+-------+

-- Sample Output after running the query:
-- +----+---------+----------+-------+
-- | id | name    | category | price |
-- +----+---------+----------+-------+
-- |  1 | Widget  | Tools    |  10.0 |
-- |  3 | Gadget  | Tools    |  15.0 |
-- |  5 | Gizmo   | Hardware |  20.0 |
-- +----+---------+----------+-------+
-- Explanation: Duplicate rows with 'name = Widget', 'category = Tools', and 'price = 10.0' are removed, keeping the record with the lowest 'id'.