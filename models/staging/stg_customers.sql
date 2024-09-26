{{ config(materialized='table', schema = env_var('QWT_SOURCESCHEMA','STAGING')) }}
select * from {{ source('qwt_src', 'customer') }}
