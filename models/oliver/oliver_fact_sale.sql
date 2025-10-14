{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
) }}

SELECT
    cu.cust_key,
    d.date_key,
    s.store_key,
    p.product_key,
    e.employee_key,
    quantity,
    unit_price
FROM {{ source('oliver_landing', 'orderline') }} sales
INNER JOIN {{ source('oliver_landing', 'orders') }} o ON o.order_id = sales.order_id
INNER JOIN {{ ref('oliver_dim_product') }} p ON sales.product_id = p.product_key
INNER JOIN {{ ref('oliver_dim_customer') }} cu ON cu.cust_key = o.customer_id
INNER JOIN {{ ref('oliver_dim_employee') }} e ON o.employee_id = e.employee_key
INNER JOIN {{ ref('oliver_dim_store') }} s ON s.store_key = o.store_id
INNER JOIN {{ ref('oliver_dim_date') }} d ON o.order_date = d.date_key
