-- stg_jaffle_shop__customers -> staged -> schema name (the data is coming from jaffle shop schema) -> dataset (customers model)

select
    id as customer_id,
    first_name,
    last_name

from {{ source('jaffle_shop', 'customers') }}