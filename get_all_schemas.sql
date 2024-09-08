-- Sample input data:
-- pg_namespace and pg_database tables:
-- (assuming a Postgres database with multiple schemas)

-- Sample output:
-- | schema_name | schema_oid | database_name | database_owner |
-- |------------|-----------|--------------|----------------|
-- | my_schema  | 12345     | my_database  | 1234          |
-- | your_schema| 67890     | your_database| 5678          |
-- | ...        | ...       | ...          | ...          |
