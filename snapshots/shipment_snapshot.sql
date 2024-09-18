{% snapshot shipment_snapshot %}

    {{
        config(
          target_database = 'dbt_analytics',
          target_schema='snapshots',
          strategy='timestamp',
          unique_key= "orderid||'-'||LineNo",
          updated_at='ShipmentDate'
        )
    }}

    select * from {{ ref('stg_shipments') }}

{% endsnapshot %}