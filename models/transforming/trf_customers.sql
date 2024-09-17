{{
    config(
        materialized='table', schema='transforming'
    )
}}
select CUSTOMERID, COMPANYNAME, CONTACTNAME, CITY, COUNTRY, DIVISIONID, ADDRESS, FAX, 
       PHONE, POSTALCODE, case when STATEPROVINCE='' then 'NA' else STATEPROVINCE end STATEPROVINCE
 from {{ref ( 'stg_customers')}}

 
