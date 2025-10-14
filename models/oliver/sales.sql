{{ config(materialized="table", schema="dw_oliver") }}


select*
from {{ ref("oliver_fact_sale") }} s
left join {{ ref("oliver_dim_customer") }} c on s.cust_key = c.cust_key
left join {{ ref("oliver_dim_date") }} d on s.date_key = d.date_key
left join {{ ref("oliver_dim_employee") }} e on s.employee_key = e.employee_key
left join {{ ref("oliver_dim_store") }} st on s.store_key = st.store_key
left join {{ ref("oliver_dim_product") }} p on s.product_key = p.product_key
