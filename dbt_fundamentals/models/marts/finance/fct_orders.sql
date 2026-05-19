

select
    O.order_id,
    O.customer_id,
    P.amount/100 as amount

from {{ ref('stg_jaffle_shop__orders') }} O --se busca dados do STAGINS usa REF
left join {{ ref('stg_stripe__payments') }} P
on O.order_id = P.order_id