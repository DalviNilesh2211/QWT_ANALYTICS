{{ config(materialized='table', schema = env_var('DBT_STAGE_SCHEMA','STAGING')) }}
select * from {{ source('qwt_src', 'customer') }}
