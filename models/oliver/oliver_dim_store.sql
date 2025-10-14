{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
    )
}}

SELECT
store_id as store_key,
store_id,
store_name,
Street,
city,
state
FROM {{ source('oliver_landing', 'store') }}