WITH practices AS (
SELECT
o.id,
o.rollout_config_id,
'P'+o.practice_id AS evisit_id,
o.practice_id AS evisit_id_original,
o.effect,
o.created_at,
o.updated_at,
'practice' AS override_type,
c.customer_id,
c.customer_name


FROM 

evisit_production.rollout_config_practice_overrides o

LEFT JOIN analytics.dim_practice p ON p.practice_id = o.practice_id
LEFT JOIN analytics.dim_customer c ON c.customer_id = p.customer_id
),

customers AS
(SELECT
o.id,
o.rollout_config_id,
'C'+o.customer_id AS evisit_id,
o.customer_id AS evisit_id_original,
o.effect,
o.created_at,
o.updated_at,
'customer' AS override_type,
c.customer_id,
c.customer_name

FROM

evisit_production.rollout_config_customer_overrides o

LEFT JOIN analytics.dim_customer c ON c.customer_id = o.customer_id),

overrides AS

(
SELECT *

FROM practices 

UNION

SELECT *

FROM customers
)

SELECT *

from overrides



LIMIT 10
