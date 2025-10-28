{{ config(
    materialized = 'table',
    database = 'group3project',
    schema = 'final_part_2'
    )
}}

select
    --c.campaign_key,
    --p.product_key,
    cu.customer_key,
    d.date_key,
    
from {{ref('stg_employee_certifications')}} as c
inner join {{ ref('oliver_dim_date')}} d 
    on d.date_key = c.certification_awarded_date
inner join {{ ref('oliver_dim_employee')}} as e 
    on e.employee_key = c.employee_id