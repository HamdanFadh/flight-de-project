WITH stg_dim_passengers as(
    SELECT
        passenger_id as nk_passenger_id,
        passenger_name,
        contact_data->> 'phone' as phone,
        contact_data->> 'email' as email
    FROM "flightdb"."bookings"."stg_tickets"
),
final_dim_passengers as(
    SELECT
        md5(cast(coalesce(cast(nk_passenger_id as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as sk_passenger_id,
        *,
        cast(
    cast(now() as timestamp)
        at time zone 'UTC' at time zone 'Asia/Jakarta' as timestamp
) as created_at,
        cast(
    cast(now() as timestamp)
        at time zone 'UTC' at time zone 'Asia/Jakarta' as timestamp
) as updated_at
    FROM stg_dim_passengers
)

SELECT * FROM final_dim_passengers