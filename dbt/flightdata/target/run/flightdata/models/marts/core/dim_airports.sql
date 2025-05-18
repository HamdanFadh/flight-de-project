
  
    

  create  table "flightdb"."bookings"."dim_airports__dbt_tmp"
  
  
    as
  
  (
    WITH stg_dim_airports as(
    SELECT 
        airport_code as nk_airport_code,
        airport_name->>'en' as airport_name,
        city->>'en' as city,
        coordinates,
        timezone
    FROM "flightdb"."bookings"."stg_airports_data"
), 
final_dim_airports as(
    SELECT 
        md5(cast(coalesce(cast(nk_airport_code as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as sk_aircraft_code,
        *,
        cast(
    cast(now() as timestamp)
        at time zone 'UTC' at time zone 'Asia/Jakarta' as timestamp
) as created_at,
        cast(
    cast(now() as timestamp)
        at time zone 'UTC' at time zone 'Asia/Jakarta' as timestamp
) as updated_at
    FROM stg_dim_airports
)

SELECT * FROM final_dim_airports
  );
  