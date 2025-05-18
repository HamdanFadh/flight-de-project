with stg_tickets as(
    SELECT *
    FROM {{ ref('stg_tickets') }}
),

dim_passengers as(
    SELECT *
    FROM {{ ref('dim_passengers') }}
),

stg_ticket_flights as(
    SELECT *
    FROM {{ ref('stg_ticket_flights') }}
),

stg_flights as(
    SELECT *
    FROM {{ ref('stg_flights')  }}
),

dim_dates as(
    SELECT * 
    FROM {{ ref('dim_dates') }}
),

dim_times as(
    SELECT *
    FROM {{ ref('dim_times') }}
),

dim_airports as(
    SELECT *
    FROM {{ ref('dim_airports') }}
),

stg_boarding_passes as(
    SELECT *
    FROM {{ ref('stg_boarding_passes' )}}
),


final_fct_boarding_passes as(
    SELECT
        {{ dbt_utils.generate_surrogate_key (['st.ticket_no', 'sf.flught_id'])}},
        st.ticket_no,
        dp.passenger_name
    FROM stg_tickets st
    INNER JOIN dim_passengers dp
        ON dp.nk_passenger = st.passenger_id
    INNER JOIN stg_ticket_flights stf
        ON stf.ticket_no = st.ticket_no
    INNER JOIN stg_flights sf
        ON sf.flight_id = stf.flight_id
    INNER JOIN dim_dates dd1
        on dd1.date_actual = DATE(sf.scheduled_departure)
    

)

