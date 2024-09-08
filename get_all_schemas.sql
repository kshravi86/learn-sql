SELECT 
    nspname AS schema_name,
    oid AS schema_oid,
    datname AS database_name,
    datowner AS database_owner
FROM 
    pg_namespace
JOIN 
    pg_database ON pg_namespace.nspowner = pg_database.oid
WHERE 
    nspname NOT IN ('information_schema', 'pg_catalog', 'public')
ORDER BY 
    schema_name;
