{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
)}}

select
    d.date_key,
    e.employee_key,
    c.certification_name,
    c.certification_cost
from {{ref('stg_employee_certifications')}} as c
inner join {{ ref('oliver_dim_date')}} d 
    on d.date_key = c.certification_awarded_date
inner join {{ ref('oliver_dim_employee')}} as e 
    on e.employee_key = c.employee_id