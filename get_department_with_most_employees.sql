WITH department_employees AS (
    SELECT 
        department,
        COUNT(employee_id) AS employee_count
    FROM 
        employees
    GROUP BY 
        department
)
SELECT 
    department
FROM 
    department_employees
ORDER BY 
    employee_count DESC
LIMIT 1;
