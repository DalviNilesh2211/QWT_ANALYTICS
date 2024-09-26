{{config(materialized='view', schema='salesmart')}}
select  p.productid,
p.productname,
c.categoryname,
p.quantityperunit,
p.unitprice,
p.unitcost,
p.unitsonorder,
p.unitsinstock,
p.productavailability,
s.ContactName,
s.companyname,
s.city
from {{ref('trf_product')}} as P
inner join 
{{ref('lkp_categories')}} c 
on p.categoryid= c.categoryid
inner join 
{{ref('stg_suppliers')}} s 
on s.supplierid =  p.supplierid