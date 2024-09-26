{{
    config(
        materialized='table',  schema= env_var('DBT_TRNASFORMING_SCHEMA','transforming')
    )
}}
select ORDERID,ORDERDATE,CUSTOMERID,EMPLOYEEID,SHIPPERID,FREIGHT, month(ORDERDATE) ordermonth,
       year(orderdate) orderyear
 from {{ref ( 'stg_orders')}}

 
