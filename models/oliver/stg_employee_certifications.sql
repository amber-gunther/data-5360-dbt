{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
)}}

select
    employee_id,
    last_name,
    PARSE_JSON(CERTIFICATION_JSON):certification_name::VARCHAR(50) as certification_name,
    PARSE_JSON(CERTIFICATION_JSON):certification_cost::VARCHAR(50) as certification_cost,
    PARSE_JSON(CERTIFICATION_JSON):certification_awarded_date::VARCHAR(50) as certification_awarded_date,
    first_name,
    email
from {{ source('oliver_landing', 'employee_certifications')}}