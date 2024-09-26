{{
    config(
        materialized='table', schema= env_var('DBT_TRNASFORMING_SCHEMA','transforming') , pre_hook=['grant select on table staging.stg_customers to role public']
    )
}}
select CUSTOMERID, COMPANYNAME, CONTACTNAME, CITY, COUNTRY, DIVISIONID, ADDRESS, FAX, 
       PHONE, POSTALCODE, case when STATEPROVINCE='' then 'NA' else STATEPROVINCE end STATEPROVINCE
 from {{ref ( 'stg_customers')}}
