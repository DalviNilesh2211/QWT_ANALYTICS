{{config(materialized='table' , schema = env_var('QWT_SOURCESCHEMA','STAGING')) }}
select get(xmlget(supplierinfo,'SupplierID'),'$')::number as SupplierID,
       get(xmlget(supplierinfo,'CompanyName'),'$')::varchar as CompanyName,
       get(xmlget(supplierinfo,'ContactName'),'$')::varchar as ContactName,
       get(xmlget(supplierinfo,'City'),'$')::varchar as City,
       get(xmlget(supplierinfo,'PostalCode'),'$')::varchar as PostalCode,
       get(xmlget(supplierinfo,'Country'),'$')::varchar as Country,
       get(xmlget(supplierinfo,'Phone'),'$')::varchar as Phone,
       get(xmlget(supplierinfo,'Fax'),'$')::varchar as Fax
from {{ source('qwt_src', 'suppliers') }} as s