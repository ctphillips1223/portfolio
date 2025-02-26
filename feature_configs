WITH facilities AS (
SELECT
    o.id,
    o.rollout_config_id,
    'F' || o.facility_id AS type_id,
    o.facility_id AS original_type_original,
    o.effect,
    'facility' AS override_type,
    c.client_id,
    c.client_name
FROM 
    facility_configs o
LEFT JOIN dim_facility f ON f.facility_id = o.facility_id
LEFT JOIN dim_client c ON c.client_id = f.client_id
),

clients AS (
SELECT
    o.id,
    o.rollout_config_id,
    'C' || o.client_id AS type_id,
    o.client_id AS original_type_original,
    o.effect,
    'client' AS override_type,
    c.client_id,
    c.client_name
FROM 
    client_configs o
LEFT JOIN dim_client c ON c.client_id = o.client_id
),

feature_configs AS (
SELECT * FROM facilities 
UNION 
SELECT * FROM clients
)

SELECT * FROM feature_configs;
