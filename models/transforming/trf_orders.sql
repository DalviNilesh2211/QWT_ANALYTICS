{{
    config(
        materialized='table', schema='transforming'
    )
}}
select ORDERID,ORDERDATE,CUSTOMERID,EMPLOYEEID,SHIPPERID,FREIGHT, month(ORDERDATE) ordermonth,
       year(orderdate) orderyear
 from {{ref ( 'stg_orders')}}

 
