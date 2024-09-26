{{config(materialized='view', schema='reporting')}}

with customers as 
(

    select c.customerid,c.companyname,
           c.contactname 
    from {{ ref('dim_customers') }} c
), orders as
(

    select orderid, customerid,orderdate
    from {{ref('fct_orders')}}
) ,

customers_orders as 
(
select customers.customerid,
      customers.companyname,
      customers.contactname,
      min(orders.orderdate) min_orderdate,
      max(orders.orderdate) max_orderdate,
 from orders inner join customers on orders.customerid = customers.customerid
group by customers.customerid,
      customers.companyname,
      customers.contactname
)
select * from customers_orders