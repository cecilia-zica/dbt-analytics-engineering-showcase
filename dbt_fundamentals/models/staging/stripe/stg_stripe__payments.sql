

select
    ID as payment_id, 
    ORDERID as order_id,
    PAYMENTMETHOD as payment_method,
    STATUS as payment_status, 
    AMOUNT as amount,
    CREATED as payment_created_at

from {{ source('stripe', 'payments')}}


