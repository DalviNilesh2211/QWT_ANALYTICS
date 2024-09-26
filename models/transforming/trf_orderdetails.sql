{{
    config(
        materialized='table',  schema= env_var('DBT_TRNASFORMING_SCHEMA','transforming')
    )
}}
select od.*,
(od.UnitPrice * od.Quantity) * (1-od.Discount) as linesalesamount,
p.unitcost * od.Quantity as costtogoodssold,
((od.Unitprice * od.Quantity) * (1-od.discount)) - (p.Unitcost * od.Quantity) as margin

 from {{ref ( 'stg_orderdetails')}} od 
 inner join {{ref ( 'trf_product')}} p 
 on od.productid= p.productid 

 
