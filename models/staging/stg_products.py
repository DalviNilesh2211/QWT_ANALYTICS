def model(dbt,session): 
    dbt.config(materialized="table")
    my_product_sql_df = dbt.source("qwt_src","products")
    return my_product_sql_df