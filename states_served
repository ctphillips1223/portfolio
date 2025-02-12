SELECT 
    du.user_id,
    du.first_name + ' ' + du.last_name AS full_name,
    LISTAGG(DISTINCT loc.name, ',') WITHIN GROUP (ORDER BY loc.name) AS states_served
FROM 
    mydb.visit_kind_membership vkm
JOIN 
    mydb.visit_kind vk 
    ON vk.id = vkm.visit_kind_id
LEFT JOIN 
    mydb.served_areas sa 
    ON sa.servable_id = vkm.id
JOIN 
    refined_analytics.user_data du 
    ON du.user_id = vkm.user_id
LEFT JOIN 
    mydb.location_data loc 
    ON loc.id = sa.location_id
LEFT JOIN 
    refined_analytics.practice_data pd 
    ON pd.practice_id = vk.practice_id
LEFT JOIN 
    mydb.user_accounts ua 
    ON ua.id = du.user_id
WHERE
    pd.client_id = 123
    AND pd.is_test != 1
    AND du.role = 'clinician'
    AND du.is_test != 1
    AND ua.email NOT LIKE '%inactive%'
GROUP BY 
    1, 2;

 
