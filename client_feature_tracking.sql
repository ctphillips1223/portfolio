SELECT 
    *,
    CASE
        WHEN client_id IN ( 
            SELECT c.client_id
            FROM client_table c
            LEFT JOIN facility_table f ON f.client_id = c.client_id
            WHERE f.is_test != 1
                AND LOWER(f.status) NOT IN ('demo', 'test')
                AND LOWER(c.client_name) NOT LIKE '%test%' 
                AND LOWER(c.client_name) NOT LIKE '%demo%'
                AND LOWER(c.client_name) NOT LIKE '%staging%'
        ) 
        THEN 0
        ELSE 1
    END AS is_test
FROM client_table;
