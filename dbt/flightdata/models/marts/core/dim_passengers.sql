WITH stg_dim_passengers as(
    SELECT
        passenger_id as nk_passenger_id,
        passenger_name,
        contact_data->> 'phone' as phone,
        contact_data->> 'email' as email
    FROM {{ ref('stg_tickets') }}
),
final_dim_passengers as(
    SELECT
        {{ dbt_utils.generate_surrogate_key( ["nk_passenger_id"] )}} as sk_passenger_id,
        *,
        {{ dbt_date.now() }} as created_at,
        {{ dbt_date.now() }} as updated_at
    FROM stg_dim_passengers
)

SELECT * FROM final_dim_passengers