with stg_dim_aircrafts as (
    select
        aircraft_code as nk_aircraft_code,
        model->>'en' as model,
        "range"
    from "flightdb"."bookings"."stg_aircrafts_data"
),

final_dim_aircrafts as (
    select
        md5(cast(coalesce(cast(nk_aircraft_code as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as sk_aircraft_code,
        *,
        cast(
    cast(now() as timestamp)
        at time zone 'UTC' at time zone 'Asia/Jakarta' as timestamp
) as created_at,
        cast(
    cast(now() as timestamp)
        at time zone 'UTC' at time zone 'Asia/Jakarta' as timestamp
) as updated_at
    from stg_dim_aircrafts
)

select * from final_dim_aircrafts