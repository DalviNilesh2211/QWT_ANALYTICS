{{
    config(
        materialized='view', schema='salesmart'
    )
}}
select 
od.*,
o.CUSTOMERID,
o.shipperid,
o.employeeid,
o.freight,
o.ordermonth,
o.orderyear
from {{ref('trf_orders')}} as o 
inner join {{ref('trf_orderdetails')}} as od 
on o.orderid = od.orderid
