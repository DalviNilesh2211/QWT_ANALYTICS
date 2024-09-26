def prodavailable ( x,y):
    return x-y

def model(dbt,session):
    dbt.config(materialized ="table")
    temp_df = dbt.ref ("stg_products")

    df = temp_df.withColumn("productavailability",prodavailable(temp_df["unitsinstock"],temp_df["unitsonorder"]))

    #df.select(iff(df.["productavailability"]> 0, lit("yes"), lit("No")))
    #df = temp_df.withColumn("productavailability", iff(prodavailable(temp_df["unitsinstock"],temp_df["unitsonorder"]) > 0 , lit("yes"), lit("no")))
    return df
