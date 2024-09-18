{{
    config(
        materialized='table', schema='transforming'
    )
}}
select productid,
productname,supplierid,
categoryid,quantityperunit, 
unitprice,unitcost,
unitsonorder,
unitsinstock,
iff(unitsonorder - unitsinstock > 0, 'Product is not available', 'Product is available') as productavailability

 from {{ref ( 'stg_products')}}

 
