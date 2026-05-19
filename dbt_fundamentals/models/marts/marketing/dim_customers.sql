--Function indicates the materialization that we want in our model, usually see macros in a single line but config in separate blocks
--dim -> dimension table: nouns, or things that are not changing too much over time, like customers, products, etc.
with customers as (

    select * from {{ ref('stg_jaffle_shop__customers')}}

),

orders as (

    select * from {{ ref('stg_jaffle_shop__orders')}} --LINEAGE and dependency, ref is a function that creates a dependency between models, it also allows us to reference other models in our project, 
                                                    --and it also allows us to reference models in other projects if we have them as dependencies in our dbt_project.yml file

),

finance as (
    select * from {{ ref('fct_orders')}}
),

lifetime_value as(
    select 
        customer_id,
        sum(amount) as lifetime_value
    from finance
    group by 1
),

customer_orders as (

    select
        customer_id,

        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date,
        count(order_id) as number_of_orders

    from orders

    group by 1

),


final as (

    select
        customers.customer_id,
        customers.first_name,
        customers.last_name,
        customer_orders.first_order_date,
        customer_orders.most_recent_order_date,
        coalesce(customer_orders.number_of_orders, 0) 
        as number_of_orders,
        coalesce(lifetime_value.lifetime_value, 0) as lifetime_value


    from customers

    left join customer_orders using (customer_id)
    left join lifetime_value using (customer_id)

)

select * from final


