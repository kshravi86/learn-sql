WITH ranked_salaries AS (
    SELECT 
        salary,
        DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_rank
    FROM 
        employees
)
SELECT 
    salary
FROM 
    ranked_salaries
WHERE 
    salary_rank = 2;
