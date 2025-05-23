WITH stg_dim_airports as(
    SELECT 
        airport_code as nk_airport_code,
        airport_name->>'en' as airport_name,
        city->>'en' as city,
        coordinates,
        timezone
    FROM {{ ref("stg_airports_data" )}}
), 
final_dim_airports as(
    SELECT 
        {{ dbt_utils.generate_surrogate_key( ["nk_airport_code"] )}} as sk_aircraft_code,
        *,
        {{ dbt_date.now() }} as created_at,
        {{ dbt_date.now() }} as updated_at
    FROM stg_dim_airports
)

SELECT * FROM final_dim_airports