{{
    config(
        materialized='view', schema='salesmart'
    )
}}
with cte_customer as 
(
select t_cust.CUSTOMERID ,
	t_cust.COMPANYNAME,
	t_cust.CONTACTNAME,
	t_cust.CITY,
	t_cust.COUNTRY,
	t_cust.DIVISIONID ,
	t_cust.ADDRESS ,
	t_cust.FAX ,
	t_cust.PHONE ,
	t_cust.POSTALCODE ,
	t_cust.STATEPROVINCE,
    div.divisionname
from {{ ref('trf_customers')}} t_cust   
inner join {{ ref("lkp_divisions")}} div on t_cust.divisionid= div.divisionid
) 
select * from cte_customer